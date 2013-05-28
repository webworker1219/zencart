<?php
class ProductsImagesHandle {

function io_lock($file){
  global $bmzConf;
  // no locking if safemode hack
  if ($bmzConf['safemodehack']) return;

  $lockDir = $bmzConf['lockdir'] . '/' . md5($file);
  @ignore_user_abort(1);

  
  $timeStart = time();
  do {
    //waited longer than 3 seconds? -> stale lock
    if ((time() - $timeStart) > 3) break;
    $locked = @mkdir($lockDir);
  } while ($locked === false);
}
function bmz_clear_cache() {
	global $bmzConf;
	return remove_dir($bmzConf['cachedir']);
}
function io_makeFileDir($file){
  global $messageStack;
  global $bmzConf;

  $dir = dirname($file);
  $dmask = $bmzConf['dmask'];
  umask($dmask);
  if(!is_dir($dir)){
    io_mkdir_p($dir);
  }
  umask($bmzConf['umask']); 
}

function io_mkdir_p($target){
  global $bmzConf;

  if (is_dir($target) || empty($target)) return 1; // best case check first
  if (@file_exists($target) && !is_dir($target)) return 0;
  //recursion
  if (io_mkdir_p(substr($target, 0, strrpos($target, '/')))){
    if($bmzConf['safemodehack']){
      $dir = preg_replace('/^' . preg_quote(realpath($bmzConf['ftp']['root']), '/') . '/', '', $target);
      return io_mkdir_ftp($dir);
    }else{
      return @mkdir($target, 0777); // crawl back up & create dir tree
    }
  }
  return 0;
}
function io_mkdir_ftp($dir){
  global $messageStack;
  global $bmzConf;

  if(!function_exists('ftp_connect')){
    //$messageStack->add("FTP support not found - safemode workaround not usable", "error");
    return false;
  }
  
  $conn = @ftp_connect($bmzConf['ftp']['host'], $bmzConf['ftp']['port'], 10);
  if(!$conn){
    //$messageStack->add("FTP connection failed", "error");
    return false;
  }

  if(!@ftp_login($conn, $bmzConf['ftp']['user'], $bmzConf['ftp']['pass'])){
   // $messageStack->add("FTP login failed", "error");
    return false;
  }

  //create directory
  $ok = @ftp_mkdir($conn, $dir);
  //set permissions (using the directory umask)
  @ftp_site($conn, sprintf("CHMOD %04o %s", (0777 - $bmzConf['dmask']), $dir));

  @ftp_close($conn);
  return $ok;
}

function remove_dir($dirname) {
  global $messageStack;
  $error = false;
  if ($dir = @dir($dirname)) {
    $dir->rewind();
    while ($file = $dir->read()) {
      //echo $dirname . '/' . $file . '<br />';
      if (($file != ".") && ($file != "..")) {
        if (is_dir($dirname . '/' . $file)) {
      	// another directory, recurse
          $error |= remove_dir($dirname . '/' . $file);
	      // if it was a directory, it should be empty now
          if (!@rmdir($dirname . '/' . $file)) {
            $error |= true;
            //$messageStack->add('Couldn\'t delete ' . $dirname . '/' . $file . '.', 'error');
          }
        } else {
          if (!@unlink($dirname . '/' . $file)) {
            $error |= true;
            //$messageStack->add('Couldn\'t delete ' . $dirname . '/' . $file . '.', 'error');
          }
        }
      }
    }
    $dir->close();
  } else {
  	 $error |= true;
  }
  return $error;
}

function products_urlimage_handle($jmwimagearr=array()){

if(sizeof($jmwimagearr)<=0) return '';
if(!empty($jmwimagearr->imageBurl)) {
	$handle_image = array($jmwimagearr->imageBurl);
}else{
	foreach ($jmwimagearr as $_k => $_imageobj){$url_images_string.=$_imageobj->imageBurl.',';}
	if(!empty($url_images_string)) $url_images_string =substr($url_images_string,0,-1);
	$handle_image=explode(',',$url_images_string);
}
//echo '<span style="color:#ff0000">jmw images - > '.print_r($jmwimagearr,true).'</span><br /> ' ;
if(!empty($handle_image)){

	for($i=0;$i<sizeof($handle_image);$i++){
		//$file_whether=@file_get_contents($handle_image[$i]);
		//if(!empty($file_whether)){
		//	$fileArray[]=array('name'=>end(explode('/',$handle_image[$i])),'tmp_name'=>$handle_image[$i]);
		//}
		
		if (check_remote_file_exists($handle_image[$i])) {
			$fileArray[]=array('name'=>end(explode('/',$handle_image[$i])),'tmp_name'=>$handle_image[$i]);
		}else {
			//echo $url_images_string.' ... failed '.$handle_image[$i].'图片下载失败!<br />';
		}
	}
}
$watermark = DIR_FS_CATALOG_IMAGES.'watermark.png';
$wateralpha = 65; 
@array_multisort($fileArray,SORT_ASC); 
if (!empty($fileArray)) {
    $data = array();
	$foldDate = date('Ym') ;
	$tempfile1 = DIR_FS_CATALOG_IMAGES . 's/'.$foldDate.'/temp.txt' ;
	$tempfile2 = DIR_FS_CATALOG_IMAGES . 'l/'.$foldDate.'/temp.txt' ;
	$tempfile3 = DIR_FS_CATALOG_IMAGES . 'v/'.$foldDate.'/temp.txt' ;
	
	io_makeFileDir($tempfile1);
	io_makeFileDir($tempfile2);
	io_makeFileDir($tempfile3);
	
    for($i = 0; $i < count ( $fileArray ); $i ++) {
	    set_time_limit(1200);
        $nameBase = $foldDate.'/'.time().$i;
		
        $data['ImgExtension'] = strtolower(substr( $fileArray[$i]['name'], strrpos($fileArray[$i]['name'], '.')));
        $source_name = $fileArray[$i]['tmp_name'];
       
        $destination_name = DIR_FS_CATALOG_IMAGES . 's/'.$nameBase . $data['ImgExtension'];
        
        if ( !loadRemoteImg($source_name, $destination_name) ) {
          //echo ('failed to copy '.$source_name.' to '.$destination_name.'...'. "error<br />" );
        }else{
          //echo( "success:" .$source_name.'<br />');
        }
		
		
        $data['smallFileName'] = 's/'.$nameBase . $data['ImgExtension'];
        $data['mediumFileName'] = 'l/'.$nameBase . $data['ImgExtension'];
        $data['largeFileName'] = 'v/'.$nameBase . $data['ImgExtension'];

        $destination_name_small = DIR_FS_CATALOG_IMAGES .$data['smallFileName'];
        $destination_name_medium = DIR_FS_CATALOG_IMAGES .$data['mediumFileName'];
        $destination_name_large = DIR_FS_CATALOG_IMAGES .$data['largeFileName'];
          
        
        if (!copy($destination_name, $destination_name_medium)) {
          //echo ('failed to copy '.$destination_name_medium.'...'. "error <br />" );
        }else{
          //echo ('Successed to copy '.$file.'...'. "success" );

          if (strtolower($data['ImgExtension']) == ".jpg" || strtolower($data['ImgExtension']) == ".jpeg")
            $im = @imagecreatefromjpeg ($destination_name_medium );
          if (strtolower($data['ImgExtension']) == ".gif")
            $im = @imagecreatefromgif ($destination_name_medium );
          if (strtolower($data['ImgExtension']) == ".png")
            $im = @imagecreatefrompng ($destination_name_medium );
          list($width_orig, $height_orig) = getimagesize($destination_name_medium );
          $width = PRODUCT_MEDIUM_IMAGE_WIDTH;
          $height = PRODUCT_MEDIUM_IMAGE_HEIGHT;
          if ($width && ($width_orig < $height_orig)) {
              $width = ($height / $height_orig) * $width_orig;
          } else {
              $height = ($width / $width_orig) * $height_orig;
          }

          $im_s = imagecreatetruecolor(PRODUCT_MEDIUM_IMAGE_WIDTH,PRODUCT_MEDIUM_IMAGE_HEIGHT);

          $white = imagecolorallocate($im_s, 255, 255, 255);

          imagefill($im_s, 0, 0, $white);

		  
          if ($width_orig <= $width){
            $wpos=(PRODUCT_MEDIUM_IMAGE_WIDTH - $width_orig)/2;
            $hpos=(PRODUCT_MEDIUM_IMAGE_HEIGHT - $height_orig)/2;
            imagecopy($im_s,$im,$wpos, $hpos, 0, 0,$width_orig,$height_orig );
          }else{
            $wpos=(PRODUCT_MEDIUM_IMAGE_WIDTH - $width)/2;
            $hpos=(PRODUCT_MEDIUM_IMAGE_HEIGHT - $height)/2;
            imagecopyresampled($im_s,$im,$wpos, $hpos, 0, 0,$width,$height,$width_orig,$height_orig );
          }
          imagejpeg ( $im_s, $destination_name_medium, 100 );
          imagedestroy ( $im );       
        }
        
        
        
        if (!copy($destination_name, $destination_name_large)) {
          //echo ('failed to copy '.$destination_name_large.'...'."error <br />" );
        }else{
          //echo ('Successed to copy '.$file.'...'. "success" );
          
          if (strtolower($data['ImgExtension']) == ".jpg" || strtolower($data['ImgExtension']) == ".jpeg")
            $im = @imagecreatefromjpeg ($destination_name_large );
          if (strtolower($data['ImgExtension']) == ".gif")
            $im = @imagecreatefromgif ($destination_name_large );
          if (strtolower($data['ImgExtension']) == ".png")
            $im = @imagecreatefrompng ($destination_name_large );
          list($width_orig, $height_orig) = getimagesize($destination_name_large );
          $width = PRODUCT_MEDIUM_LARGE_WIDTH;
          $height = PRODUCT_MEDIUM_LARGE_HEIGHT;
          if ($width && ($width_orig < $height_orig)) {
              $width = ($height / $height_orig) * $width_orig;
          } else {
              $height = ($width / $width_orig) * $height_orig;
          }
          $im_s = @imagecreatetruecolor ( PRODUCT_MEDIUM_LARGE_WIDTH, PRODUCT_MEDIUM_LARGE_HEIGHT );
		  
          $white = @imagecolorallocate($im_s, 255, 255, 255);
          imagefill($im_s, 0, 0, $white);
          if ($width_orig <= $width){
	          $wpos=(PRODUCT_MEDIUM_LARGE_WIDTH - $width_orig)/2;
	          $hpos=(PRODUCT_MEDIUM_LARGE_HEIGHT - $height_orig)/2;
	          imagecopy($im_s,$im,$wpos, $hpos, 0, 0,$width_orig,$height_orig );
          }else{
          	$wpos=(PRODUCT_MEDIUM_LARGE_WIDTH - $width)/2;
            $hpos=(PRODUCT_MEDIUM_LARGE_HEIGHT - $height)/2;
            imagecopyresampled($im_s,$im,$wpos, $hpos, 0, 0,$width,$height,$width_orig,$height_orig );
          }
          list($water_w, $water_h) = getimagesize($watermark);
          $dst_x = (PRODUCT_MEDIUM_LARGE_WIDTH - $water_w)/2;   
          $dst_y = (PRODUCT_MEDIUM_LARGE_HEIGHT + $water_h)/1.5;    
		  $im_watermark = @imagecreatefrompng ($watermark );
		  if(WATERMARK_TRANSPARENT == 'yes') {
		  	@imagejpeg ( $im_s, $destination_name_large, 100 );
	        $im_s = watermark::emboss($destination_name_large, $watermark, PRODUCT_MEDIUM_LARGE_WIDTH, PRODUCT_MEDIUM_LARGE_HEIGHT);
		  } else {
		  	 @imagecopymerge($im_s, $im_watermark, $dst_x, $dst_y, 0, 0,$water_w, $water_h,$wateralpha);
		  }
          @imagejpeg ( $im_s, $destination_name_large, 100 );
          @imagedestroy ( $im );        
        }
        
        if (strtolower($data['ImgExtension']) == ".jpg" || strtolower($data['ImgExtension']) == ".jpeg")
          $im = @imagecreatefromjpeg ($destination_name_small );
        if (strtolower($data['ImgExtension']) == ".gif")
          $im = @imagecreatefromgif ($destination_name_small );
        if (strtolower($data['ImgExtension']) == ".png")
          $im = @imagecreatefrompng ($destination_name_small );
          
        list($width_orig, $height_orig) = getimagesize($destination_name_small);
        $width = PRODUCT_MEDIUM_SMALL_WIDTH;
        $height = PRODUCT_MEDIUM_SMALL_HEIGHT;
        if ($width && ($width_orig < $height_orig)) {
            $width = ($height / $height_orig) * $width_orig;
        } else {
            $height = ($width / $width_orig) * $height_orig;
        }
        $im_s = @imagecreatetruecolor( PRODUCT_MEDIUM_SMALL_WIDTH, PRODUCT_MEDIUM_SMALL_HEIGHT ) or die("Cannot Initialize new GD image stream");
        $white = imagecolorallocate($im_s, 255, 255, 255);
        imagefill($im_s, 0, 0, $white);
        if ($width_orig <= $width){
            $wpos=(PRODUCT_MEDIUM_SMALL_WIDTH - $width_orig)/2;
            $hpos=(PRODUCT_MEDIUM_SMALL_HEIGHT - $height_orig)/2;
            imagecopy($im_s,$im,$wpos, $hpos, 0, 0,$width_orig,$height_orig );
        }else{
            $wpos=(PRODUCT_MEDIUM_SMALL_WIDTH - $width)/2;
            $hpos=(PRODUCT_MEDIUM_SMALL_HEIGHT - $height)/2;
            imagecopyresampled($im_s,$im,$wpos, $hpos, 0, 0,$width,$height,$width_orig,$height_orig );
        }
        imagejpeg ( $im_s, $destination_name_small, 100 );
        imagedestroy ( $im );
        $products_image_names[] = 's/'.$nameBase.$data['ImgExtension'];
		if(API_MULTI_MAP_SETUP==false){
		 break;
		}
        
    }
    
    if(is_array($existimgArray)){
      if(is_array($products_image_names)){
        $newArray = array_merge($existimgArray,$products_image_names);
        $products_image_name = $newArray[0];
        $products_image_name_string = implode ( ',', $newArray);
      }else{
        $products_image_name = $existimgArray[0];
        $products_image_name_string = implode ( ',', $existimgArray);
      }
    }else{
      $products_image_name = $products_image_names[0];
      $products_image_name_string = @implode ( ',', $products_image_names);
    }

  }else{
  	echo 'failed 没找到要下载的图�?!<br />';
    if(is_array($existimgArray)){
    $products_image_name = $existimgArray[0];
    $products_image_name_string = implode ( ',', $existimgArray);
    }else{
    $products_image_name = $existimgArray[0];
    $products_image_name_string = $existimgArray[0];
    }

  }
 return   $products_image_name_string ;
}
}

class watermark {
   public static function emboss($pic1, $patt, $twidth, $theight) {
      $source = imagecreatefromjpeg($pic1); 
      $pattern = imagecreatefrompng($patt); 

      list ($width, $height) = getimagesize($pic1);
      list ($widthpatt, $heightpatt) = getimagesize($patt);

      $new_width = $width;
      $new_height = $width / $widthpatt * $heightpatt;

      if ($new_height > $height) {
    $offset = intval(($new_height - $height) / 2);
      }elseif ($new_height < $height) {
    $offset = intval(($new_height - $height) / 2);
       } else {
       $offset = 0;
        }

    $image_p = imagecreatetruecolor($new_width, $new_height);
     imagecopyresampled($image_p, $pattern, 0, 0, 0, 0, $new_width, $new_height, $widthpatt, $heightpatt);

    $im = imagecreatetruecolor($twidth, $theight);
        for ($y = 0; $y < $theight; $y ++) {
       for ($x = 0; $x < $twidth; $x ++) {
         $colors = imagecolorsforindex($source, imagecolorat($source, $x, $y));
         $pattern_color = imagecolorsforindex($image_p, imagecolorat($image_p, $x, ($y + $offset)));
        
        if (($y + $offset +1) > 0 && ($y + $offset) < ($new_height -1)) {
          $brightness = abs(($pattern_color['red'] * 50 / 255) - 50);
           if ($pattern_color['red'] < 150) {
             $change = true;
           } else {
              $change = false;
              $tally = 0;
           }

           if ($change && $tally < 2) {
             $highlight = 1.8;
             $tally ++;
           } else {
             $highlight = 1;
           }
           $brightness = $brightness * $highlight;
        } else {
            $brightness = 0;
        }
        $r = (($colors['red'] + $brightness) > 255) ? 255 : ($colors['red'] + $brightness);
        $g = (($colors['green'] + $brightness) > 255) ? 255 : ($colors['green'] + $brightness);
        $b = (($colors['blue'] + $brightness) > 255) ? 255 : ($colors['blue'] + $brightness);
        $test = imagecolorallocate($im, $r, $g, $b);
        imagesetpixel($im, $x, $y, $test);
       }
        }

    return $im;
   }
}
//判断远程文件是否存在
function remote_file_exists($url_file){
	//�?测输�?
	$url_fil = trim($url_file);
	if (empty($url_file)) { return false; }
	$url_arr = parse_url($url_file);
	if (!is_array($url_arr) || empty($url_arr)){ return false; }

	//获取请求数据
	$host = $url_arr['host'];
	$path = $url_arr['path'] ."?". $url_arr['query'];
	$port = isset($url_arr['port']) ? $url_arr['port'] : "80";

	//连接服务�?
	$fp = fsockopen($host, $port, $err_no, $err_str, 30);
	if (!$fp){ return false; }

	//构�?�请求协�?
	$request_str = "GET ".$path." HTTP/1.1\r\n";
	$request_str .= "Host: ".$host."\r\n";
	$request_str .= "Connection: Close\r\n\r\n";

	//发�?�请�?
	fwrite($fp, $request_str);
	$first_header = fgets($fp, 1024);
	fclose($fp);

	//判断文件是否存在
	if (trim($first_header) == ""){ return false; }
		if (!preg_match("/200/", $first_header)){
			return false;
		}
		return true;
	}
//CURL判断远程文件是否存在	
function check_remote_file_exists($url) 
{ 
$curl = curl_init($url); 
// 不取回数�? 
curl_setopt($curl, CURLOPT_NOBODY, true); 
// 发�?�请�? 
$result = curl_exec($curl); 
$found = false; 
// 如果请求没有发�?�失�? 
if ($result !== false) { 
// 再检查http响应码是否为200 
$statusCode = curl_getinfo($curl, CURLINFO_HTTP_CODE); 
if ($statusCode == 200) { 
$found = true; 
} 
} 
curl_close($curl); 

return $found; 
}
/*
下载远程图片到本�?
$url:远程图片地址
$filename:保存到本地的文件路径
*/
function loadRemoteImg($url = "", $filename = "") { 
	if(is_dir(basename($filename))) { return false; } 
	$url = preg_replace( '/(?:^[\'"]+|[\'"\/]+$)/', '', $url ); 
	$hander = curl_init(); 
	$fp = fopen($filename,'wb'); 
	curl_setopt($hander,CURLOPT_URL,$url); 
	curl_setopt($hander,CURLOPT_FILE,$fp); 
	curl_setopt($hander,CURLOPT_HEADER,0); 
	curl_setopt($hander,CURLOPT_FOLLOWLOCATION,1); 
	curl_setopt($hander,CURLOPT_TIMEOUT,60); 
	curl_exec($hander); 
	curl_close($hander); 
	fclose($fp); 
	return true; 
}

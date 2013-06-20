<?php
class ApiBase {
	private static $in_type = API_INPUT_FORMAT;
	private static $out_type = API_OUTPUT_FORMAT;
	
	/**
	 * prepare db object
	 */
	public static function prepare_db() {
		global $db;
		return $db;
	}
	
	/**
	 * prepare input to the specific format
	 */
	public static function prepare_input($param) {
		if(self::$in_type == 'json') {
			return json_decode($param, true);
		} elseif(self::$in_type == 'xml') {
			return '';
		}
	}
	
	/**
	 * prepare output to the specific format
	 */
	public static function prepare_output($return) {
		if(self::$out_type == 'json') {
			return json_encode($return);
		} elseif(self::$out_type == 'xml') {
			return '';
		}
	}
	
	/**
	 * parent_category_list output to the category list
	 */
	
	public static function parent_category_list($categories_id) {
		global $db;
		$categories_id = $categories_id;
		$return = array();
		
		$categories = $db->Execute("select c.categories_id,c.categories_image,c.parent_id,c.sort_order,c.categories_status
								   ,cd.language_id,cd.categories_name,cd.categories_description  
								   from " . TABLE_CATEGORIES . " c, " . TABLE_CATEGORIES_DESCRIPTION . " cd
								   where c.categories_id = cd.categories_id
                                   and cd.language_id = '" . (int)$_SESSION['languages_id'] . "'");
		 while (!$categories->EOF) {
			$item['categories_id']             =  $categories->fields['categories_id'];
			$item['categories_image']          =  $categories->fields['categories_image'];
			$item['parent_id']                 =  $categories->fields['parent_id'];
			$item['sort_order']                =  $categories->fields['sort_order'];
			$item['language_id']               =  $categories->fields['language_id'];
			$item['categories_name']           =  $categories->fields['categories_name'];
			$item['categories_description']    =  $categories->fields['categories_description'];
			$item['categories_status']         =  $categories->fields['categories_status'];
		
			$return[] = $item;
			$categories->MoveNext();
		 }
		 return $return;
	}
	
	/**
	 * order_products_info order producte info
	 */
	public static function order_products_info($order_id){
	    global $db;
		$return =array();
		
		$order_product_query=$db->Execute("select op.products_id, op.products_model, op.products_name, op.products_price,
										  op.final_price, op.products_quantity, p.manufacturers_id
										  from ".TABLE_ORDERS_PRODUCTS." op,".TABLE_PRODUCTS." p 
										  where orders_id='".$order_id."' AND op.products_id = p.products_id
										  ");
	   while (!$order_product_query->EOF) {
		   $item['products_id']       = $order_product_query->fields['products_id'];
		   $item['products_model']    = $order_product_query->fields['products_model'];
		   $item['products_name']     = $order_product_query->fields['products_name'];
		   $item['products_price']    = $order_product_query->fields['products_price'];
		   $item['final_price']       = $order_product_query->fields['final_price'];
		   $item['products_quantity'] = $order_product_query->fields['products_quantity'];
		   $item['manufacturers_id']  = $order_product_query->fields['manufacturers_id'];
		   $return[] = $item;
		   $order_product_query->MoveNext();
	   }
	    return $return;
	}
	/**
	 * countries_code order countries info
	 */
    public static function countries_code($countries_name){
		global $db;
	    if(!empty($countries_name)){
		  $countries_query=$db->Execute("select countries_iso_code_2 from ".TABLE_COUNTRIES." where countries_name='".$countries_name."'");
		  return $countries_query->fields['countries_iso_code_2'];
		}
	
	}
	
	
	
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


function products_urlimage_handle($url_images_string=''){
set_time_limit(100);
$handle_image=explode(',',$url_images_string);
if(!empty($handle_image)){
	for($i=0;$i<sizeof($handle_image);$i++){
		$file_whether=@file_get_contents($handle_image[$i]);
		if(!empty($file_whether)){
		 $fileArray[]=array('name'=>end(explode('/',$handle_image[$i])),'tmp_name'=>$handle_image[$i]);
		}
		
	}
}
$watermark = DIR_FS_CATALOG_IMAGES.'watermark.png';
$wateralpha = 65; 
@array_multisort($fileArray,SORT_ASC); 
if (!empty($fileArray)) {
    $data = array();
    for($i = 0; $i < count ( $fileArray ); $i ++) {
        $nameBase = date('Ym').'/'.time().$i;

        $data['ImgExtension'] = strtolower(substr( $fileArray[$i]['name'], strrpos($fileArray[$i]['name'], '.')));
        $source_name =$fileArray[$i]['tmp_name'];
       
        $destination_name = DIR_FS_CATALOG_IMAGES . 's/'.$nameBase . $data['ImgExtension'];
        io_makeFileDir($destination_name);
        if ( !copy($source_name, $destination_name) ) {
          //echo ( TEXT_MSG_NOUPLOAD_LARGE. "error" );
        }else{
          //echo( TEXT_MSG_UPLOAD_LARGE."success" );
          
        }
        $data['smallFileName'] = 's/'.$nameBase . $data['ImgExtension'];
        $data['mediumFileName'] = 'l/'.$nameBase . $data['ImgExtension'];
        $data['largeFileName'] = 'v/'.$nameBase . $data['ImgExtension'];

        $destination_name_small = DIR_FS_CATALOG_IMAGES .$data['smallFileName'];
        $destination_name_medium = DIR_FS_CATALOG_IMAGES .$data['mediumFileName'];
        $destination_name_large = DIR_FS_CATALOG_IMAGES .$data['largeFileName'];
        io_makeFileDir($destination_name_medium);
        io_makeFileDir($destination_name_large);        
        
        if (!copy($destination_name, $destination_name_medium)) {
          //echo ('failed to copy '.$file.'...'. "error" );
        }else{
          //echo ('Successed to copy '.$file.'...'. "success" );

          if ($data['ImgExtension'] == ".jpg" || $data['ImgExtension'] == ".jpeg")
            $im = @imagecreatefromjpeg ($destination_name_medium );
          if ($data['ImgExtension'] == ".gif")
            $im = @imagecreatefromgif ($destination_name_medium );
          if ($data['ImgExtension'] == ".png")
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
          //echo ('failed to copy '.$file.'...'."error" );
        }else{
          //echo ('Successed to copy '.$file.'...'. "success" );
          
          if ($data['ImgExtension'] == ".jpg" || $data['ImgExtension'] == ".jpeg")
            $im = @imagecreatefromjpeg ($destination_name_large );
          if ($data['ImgExtension'] == ".gif")
            $im = @imagecreatefromgif ($destination_name_large );
          if ($data['ImgExtension'] == ".png")
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
		  
          $white = imagecolorallocate($im_s, 255, 255, 255);
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
		  	 imagecopymerge($im_s, $im_watermark, $dst_x, $dst_y, 0, 0,$water_w, $water_h,$wateralpha);
		  }
          @imagejpeg ( $im_s, $destination_name_large, 100 );
          @imagedestroy ( $im );        
        }
        
        if ($data['ImgExtension'] == ".jpg" || $data['ImgExtension'] == ".jpeg")
          $im = @imagecreatefromjpeg ($destination_name_small );
        if ($data['ImgExtension'] == ".gif")
          $im = @imagecreatefromgif ($destination_name_small );
        if ($data['ImgExtension'] == ".png")
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
public static  function zen_get_languages_mzt() {
    global $db;
    $languages = $db->Execute("select languages_id, name, code, image, directory
                               from " . TABLE_LANGUAGES . " order by sort_order");

    while (!$languages->EOF) {
      $languages_array[] = array('id' => $languages->fields['languages_id'],
                                 'name' => $languages->fields['name'],
                                 'code' => $languages->fields['code'],
                                 'image' => $languages->fields['image'],
                                 'directory' => $languages->fields['directory']);
      $languages->MoveNext();
    }

    return $languages_array;
  }
 public static   function zen_catalog_href_link_mzt($page = '', $parameters = '', $connection = 'NONSSL') {
    if ($connection == 'NONSSL') {
      $link = HTTP_CATALOG_SERVER . DIR_WS_CATALOG;
    } elseif ($connection == 'SSL') {
      if (ENABLE_SSL_CATALOG == 'true') {
        $link = HTTPS_CATALOG_SERVER . DIR_WS_HTTPS_CATALOG;
      } else {
        $link = HTTP_CATALOG_SERVER . DIR_WS_CATALOG;
      }
    } else {
      die('</td></tr></table></td></tr></table><br><br><font color="#ff0000"><b>Error!</b></font><br><br><b>Unable to determine connection method on a link!<br><br>Known methods: NONSSL SSL<br><br>Function used:<br><br>zen_href_link(\'' . $page . '\', \'' . $parameters . '\', \'' . $connection . '\')</b>');
    }
    if ($parameters == '') {
      $link .= 'index.php?main_page='. $page;
    } else {
      $link .= 'index.php?main_page='. $page . "&" . zen_output_string($parameters);
    }

    while ( (substr($link, -1) == '&') || (substr($link, -1) == '?') ) $link = substr($link, 0, -1);

    return $link;
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
?>
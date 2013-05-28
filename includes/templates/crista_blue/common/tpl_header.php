<?php
/**
* Template designed by pixemus.com
* pixemus.com - Free ecommerce templates and design services
*
* Common Template
* 
* @package templateSystem
* @copyright Copyright 2009-2010 pixemus.com
* @copyright Copyright 2003-2006 Zen Cart Development Team
* @copyright Portions Copyright 2003 osCommerce
* @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
* @version $Id: tpl_header.php 4813 2006-10-23 02:13:53Z drbyte $
*/
?>

<?php
  // Display all header alerts via messageStack:
  if ($messageStack->size('header') > 0) {
    echo $messageStack->output('header');
  }
  if (isset($_GET['error_message']) && zen_not_null($_GET['error_message'])) {
  echo htmlspecialchars(urldecode($_GET['error_message']));
  }
  if (isset($_GET['info_message']) && zen_not_null($_GET['info_message'])) {
   echo htmlspecialchars($_GET['info_message']);
} else {

}

?>


<!--bof-header logo and navigation display-->
<?php
if (!isset($flag_disable_header) || !$flag_disable_header) {
?>

<div id="headerWrapper">

<!--bof-header ezpage links-->
<div class="topper-menu float-right">
<?php if (EZPAGES_STATUS_HEADER == '1' or (EZPAGES_STATUS_HEADER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
<?php require($template->get_template_dir('tpl_ezpages_bar_header.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_header.php'); ?>
<?php } ?>
</div>
<!--eof-header ezpage links-->

<div class="language-login float-right">


<div id="login_logout_section" class="float-right">
<?php if ($_SESSION['customer_id']) { ?>
    <ul class="list-style-none inline-list">
	<li>
		<?php echo(TOP_MENU_HELLO);?><a href="<?php echo zen_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>"><?php echo ($_SESSION['customer_first_name'].' '.$_SESSION['customer_last_name']);?></a>
	</li>
    <li><a href="<?php echo zen_href_link(FILENAME_LOGOFF, '', 'SSL'); ?>"><?php echo HEADER_TITLE_LOGOFF; ?></a></li>
	</ul>
<?php
      } else {
        if (STORE_STATUS == '0') {
?>
    <a href="<?php echo zen_href_link(FILENAME_LOGIN, '', 'SSL'); ?>"><?php echo HEADER_TITLE_LOGIN; ?></a>
	<?php echo HEADER_OR; ?>
    <a href="<?php echo zen_href_link(FILENAME_CREATE_ACCOUNT, '', 'SSL'); ?>"><?php echo HEADER_TITLE_REGISTER; ?></a>
<?php } } ?>

</div>


<!-- bof languages/currencies header display -->
<div id="navCurrencies" class="float-right">
     <div class="nav-currencies float-right">
         <?php echo zen_draw_form('currencies', zen_href_link(basename(ereg_replace('.php','', $PHP_SELF)), '', $request_type, false), 'get')?>
         <?php
         
             if (isset($currencies) && is_object($currencies)) {
         
               reset($currencies->currencies);
               $currencies_array = array();
               while (list($key, $value) = each($currencies->currencies)) {
                 $currencies_array[] = array('id' => $key, 'text' => $value['title']);
               }
         
               $hidden_get_variables = '';
               reset($_GET);
               while (list($key, $value) = each($_GET)) {
                 if ( ($key != 'currency') && ($key != zen_session_name()) && ($key != 'x') && ($key != 'y') ) {
                   $hidden_get_variables .= zen_draw_hidden_field($key, $value);
                 }
               }
             }
         
         ?><?php echo zen_draw_pull_down_menu('currency', $currencies_array, $_SESSION['currency'], ' onchange="this.form.submit();"') . $hidden_get_variables . zen_hide_session_id()?></form>

     </div> <!-- nav currencies --> 


     <div class="nav-languages float-right">
     
         <?php if (!isset($lng) || (isset($lng) && !is_object($lng))) {
             $lng = new language;
           }
         
           reset($lng->catalog_languages);

		   if (count ($lng->catalog_languages) > 1){
         
	           while (list($key, $value) = each($lng->catalog_languages)) {
    	         echo '<a href="' . zen_href_link($_GET['main_page'], zen_get_all_get_params(array('language', 'currency')) . 'language=' . $key, $request_type) . '">' . zen_image(DIR_WS_LANGUAGES.$value['directory'].'/images/'.$value['image'], $value['name'], '', '', ' style="vertical-align:middle;"') . '</a>&nbsp;';
        	   }
			}
          ?>
     </div>  <!-- nav language -->
                
</div> <!-- navCurrencies -->
<!-- eof  languages/currencies header display -->


</div>


<!--bof-branding display-->
<div id="logoWrapper">
    <div id="logo"><?php echo '<a href="' . HTTP_SERVER . DIR_WS_CATALOG . '">' . zen_image($template->get_template_dir(HEADER_LOGO_IMAGE, DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . HEADER_LOGO_IMAGE, HEADER_ALT_TEXT) . '</a>'; ?></div>
</div>
<div class="clearBoth"></div>
<!--eof-branding display-->

<!--eof-header logo and navigation display-->

<?php require($template->get_template_dir('tpl_top_nav.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_top_nav.php'); ?>

<!--bof-optional categories tabs navigation display-->
<?php require($template->get_template_dir('tpl_modules_categories_tabs.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_categories_tabs.php'); ?>
<!--eof-optional categories tabs navigation display-->


</div>
<?php } ?>
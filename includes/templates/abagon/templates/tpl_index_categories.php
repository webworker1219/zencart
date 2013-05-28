<?php
/**
 * Page Template
 *
 * Loaded by main_page=index<br />
 * Displays category/sub-category listing<br />
 * Uses tpl_index_category_row.php to render individual items
 *
 * @package templateSystem
 * @copyright Copyright 2003-2006 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_index_categories.php 4678 2006-10-05 21:02:50Z ajeh $
 */

?>
<div class="centerColumn" id="indexCategories">
<?php if ($show_welcome == true) { ?>

<!--
<h1 id="indexCategoriesHeading"><?php echo HEADING_TITLE; ?></h1>

<?php if (SHOW_CUSTOMER_GREETING == 1) { ?>
<h2 class="greeting"><?php echo zen_customer_greeting(); ?></h2>
<?php } ?>

-->
<!-- deprecated - to use - uncomment
<?php if (TEXT_MAIN) { ?>
<div id="" class="content"><?php echo TEXT_MAIN; ?></div>
<?php } ?>-->

<!-- deprecated - to use - uncomment
<?php if (TEXT_INFORMATION) { ?>
<div id="" class="content"><?php echo TEXT_INFORMATION; ?></div>
<?php } ?>-->

<?php if (DEFINE_MAIN_PAGE_STATUS >= 1 and DEFINE_MAIN_PAGE_STATUS <= 2) { ?>
<div id="indexCategoriesMainContent" class="content"><?php
/**
 * require the html_define for the index/categories page
 */
  include($define_page);
?>
</div>
<?php } ?>

<?php if ($this_is_home_page) { ?>

<!--bof-banner #2 display -->
<?php
  if (SHOW_BANNERS_GROUP_SET2 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET2)) {
    if ($banner->RecordCount() > 0) {
?>
<div id="bannerTwo" class="banners"><?php echo zen_display_banner('static', $banner); ?></div>
<?php
    }
  }
?>

<!--bof-banner #3 display -->
<?php
  if (SHOW_BANNERS_GROUP_SET3 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET3)) {
    if ($banner->RecordCount() > 0) {
?>
<div id="bannerThree" class="banners"><?php echo zen_display_banner('static', $banner); ?></div>
<?php
    }
  }
?>

<?php } ?>




<?php } else { ?>
<h1 id="indexCategoriesHeading"><?php echo $breadcrumb->last(); ?></h1>
<?php } ?>

<?php
if (PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP == 'true') {
// categories_image
  if ($categories_image = zen_get_categories_image($current_category_id)) {
?>
<div id="categoryImgListing" class="categoryImg"><?php echo zen_image(DIR_WS_IMAGES . $categories_image, '', SUBCATEGORY_IMAGE_TOP_WIDTH, SUBCATEGORY_IMAGE_TOP_HEIGHT); ?></div>
<?php
  }
} // categories_image
?>

<?php
// categories_description
    if ($current_categories_description != '') {
?>
<div id="categoryDescription" class="catDescContent"><?php echo $current_categories_description;  ?></div>
<?php } // categories_description ?>
<!-- BOF: Display grid of available sub-categories, if any -->
<?php
  if (PRODUCT_LIST_CATEGORY_ROW_STATUS == 0) {
    // do nothing
  } else {
    // display subcategories
/**
 * require the code to display the sub-categories-grid, if any exist
 */
   require($template->get_template_dir('tpl_modules_category_row.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_category_row.php');
  }
?>
<!-- EOF: Display grid of available sub-categories -->
<?php
$show_display_category = $db->Execute(SQL_SHOW_PRODUCT_INFO_CATEGORY);


while (!$show_display_category->EOF) {
/*  // //  echo 'I found ' . zen_get_module_directory(FILENAME_UPCOMING_PRODUCTS);
*/
?>

<?php if ($show_display_category->fields['configuration_key'] == 'SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS') { ?>
<?php
/**
 * display the Featured Products Center Box
 */
?>
<?php
    require($template->get_template_dir('tpl_modules_featured_products.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_featured_products.php'); ?>
<?php  } ?>

<?php if ($show_display_category->fields['configuration_key'] == 'SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS') { ?>
<?php
/**
 * display the Special Products Center Box
 */
?>
<?php require($template->get_template_dir('tpl_modules_specials_default.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_specials_default.php'); ?>
<?php } ?>

<?php if ($show_display_category->fields['configuration_key'] == 'SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS') { ?>
<?php
/**
 * display the New Products Center Box
 */
?>
<?php require($template->get_template_dir('tpl_modules_whats_new.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_whats_new.php'); ?>
<?php } ?>
<?php if ($show_display_category->fields['configuration_key'] == 'SHOW_PRODUCT_INFO_CATEGORY_UPCOMING') { ?>
<?php include(DIR_WS_MODULES . zen_get_module_directory(FILENAME_UPCOMING_PRODUCTS)); ?><?php } ?>
<?php
  $show_display_category->MoveNext();
  
}
?>

<?php if ($this_is_home_page) { ?>

<!--bof-banner #4 display -->
<?php
  if (SHOW_BANNERS_GROUP_SET4 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET4)) {
    if ($banner->RecordCount() > 0) {
?>
<div id="bannerFour" class="banners"><?php echo zen_display_banner('static', $banner); ?></div>
<?php
    }
  }
?>

<!--bof-banner #5 display -->
<?php
  if (SHOW_BANNERS_GROUP_SET5 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET5)) {
    if ($banner->RecordCount() > 0) {
?>
<div id="bannerFive" class="banners"><?php echo zen_display_banner('static', $banner); ?></div>
<?php
    }
  }
?>
<!--bof- banner #6 display -->
<?php
  if (SHOW_BANNERS_GROUP_SET6 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET6)) {
    if ($banner->RecordCount() > 0) {
?>
<div id="bannerSix" class="banners"><?php echo zen_display_banner('static', $banner); ?></div>
<?php
    }
  }
?>

<?php }?>

</div>

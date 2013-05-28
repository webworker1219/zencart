<?php
/**
 * Common Template - tpl_footer.php
 *
 * this file can be copied to /templates/your_template_dir/pagename<br />
 * example: to override the privacy page<br />
 * make a directory /templates/my_template/privacy<br />
 * copy /templates/templates_defaults/common/tpl_footer.php to /templates/my_template/privacy/tpl_footer.php<br />
 * to override the global settings and turn off the footer un-comment the following line:<br />
 * <br />
 * $flag_disable_footer = true;<br />
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_footer.php 4821 2006-10-23 10:54:15Z drbyte $
 */
require(DIR_WS_MODULES . zen_get_module_directory('footer.php'));
?>

<?php
if (!isset($flag_disable_footer) || !$flag_disable_footer) {
?>
</div>
</div>
<div class="body-bg">
<div class="bottom-wrapper">
	<div id="footer">
		<div id="lt_corner">
		<div id="rt_corner">
		<div id="lb_corner">
	<!--bof-navigation display -->
		<div id="navSuppWrapper">
		<!--BOF footer menu display-->
		<?php require($template->get_template_dir('tpl_footer_menu.php',DIR_WS_TEMPLATE, $current_page_base,'common'). '/tpl_footer_menu.php');?>
		<!--EOF footer menu display-->
		<div class="clearBoth"></div>
		</div>
		</div>
		</div>
		</div>
	</div>

</div>
</div>
<!--eof-navigation display -->
<div class="bottom-wrapper">
		<!--bof-navigation display -->
		<div style="float:right;">
		<?php if (EZPAGES_STATUS_FOOTER == '1' or (EZPAGES_STATUS_FOOTER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
		<?php require($template->get_template_dir('tpl_ezpages_bar_footer.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_footer.php'); ?>
		<?php } ?>
		</div>
		<!--eof-navigation display -->

	<!--bof- site copyright display -->
	<div id="siteinfoLegal" class="legalCopyright"><?php echo FOOTER_TEXT_BODY; ?></div>
	<!--eof- site copyright display -->

	<!--bof-ip address display -->
	<?php
	if (SHOW_FOOTER_IP == '1') {
	?>
	<div id="siteinfoIP"><?php echo TEXT_YOUR_IP_ADDRESS . '  ' . $_SERVER['REMOTE_ADDR']; ?></div>
	<?php
	}
	?>
	<!--eof-ip address display -->
    <div class="clearBoth"><?php echo '<img src="'. $template->get_template_dir('', DIR_WS_TEMPLATE, $current_page_base,'images') . '/spacer.gif" width="2" height="1" alt="wastrong template" />'; ?></div>
</div>

<?php
} // flag_disable_footer
?>

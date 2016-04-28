{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!DOCTYPE HTML>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7 " lang="{$lang_iso}"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7" lang="{$lang_iso}"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8" lang="{$lang_iso}"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9" lang="{$lang_iso}"> <![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang_iso}">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
		<title>{$meta_title|escape:'htmlall':'UTF-8'}</title>
{if isset($meta_description) AND $meta_description}
		<meta name="description" content="{$meta_description|escape:html:'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:html:'UTF-8'}" />
{/if}
	<meta name="generator" content="PrestaShop" />
    <meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
	<meta name="author" content="Prestashop 1.5">   
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />    
<script>
    if (navigator.userAgent.match(/Android/i)) {
        var viewport = document.querySelector("meta[name=viewport]");
       	viewport.setAttribute('content', 'initial-scale=1.0,maximum-scale=1.0,user-scalable=0,width=device-width,height=device-height');
    }
	if(navigator.userAgent.match(/Android/i)){
    window.scrollTo(0,1);
 }
</script> 
    <meta name="apple-mobile-web-app-capable" content="yes" /> 
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
		<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
		<script type="text/javascript">
			var baseDir = '{$content_dir}';
			var baseUri = '{$base_uri}';
			var static_token = '{$static_token}';
			var token = '{$token}';
			var priceDisplayPrecision = {$priceDisplayPrecision*$currency->decimals};
			var priceDisplayMethod = {$priceDisplay};
			var roundMode = {$roundMode};
		</script>
<link href="{$css_dir}normalize.css" rel="stylesheet" type="text/css" media="all" />
<link href="{$css_dir}bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="{$css_dir}bootstrap-responsive.css" rel="stylesheet" type="text/css" media="all" />
<link href="{$css_dir}font.css" rel="stylesheet" type="text/css" media="all" />
{if isset($css_files)}
{foreach from=$css_files key=css_uri item=media}
<link href="{$css_uri}" rel="stylesheet" type="text/css" media="{$media}" />
{/foreach}
{/if}  
<link href="{$css_dir}320.css" rel="stylesheet" type="text/css" media="all" />
<link href="{$css_dir}480.css" rel="stylesheet" type="text/css" media="all" />
<link href="{$css_dir}768.css" rel="stylesheet" type="text/css" media="all" />

{if isset($js_files)}
{foreach from=$js_files item=js_uri}
<script type="text/javascript" src="{$js_uri}"></script>
{/foreach}
{/if}
<!-- Added by Ram for Product zoom -->
<!--<script src="{$content_dir}/js/jqzoom_ev/js/jquery-1.6.js"></script>-->
<script src="{$content_dir}js/jqzoom_ev/js/jquery.jqzoom-core.js"></script>
<!-- <script src="{$content_dir}js/jqzoom_ev/js/jquery.jqzoom-core-pack.js"></script> -->


<link href="{$content_dir}themes/theme768/css/jquery.jqzoom.css" rel="stylesheet" type="text/css" media="all" />
<!--end of Product zoom  -->

<script src="{$js_dir}/source/bootstrap.js"></script>
<script src="{$js_dir}/source/plugins.js"></script>
<script src="{$js_dir}/source/footable.js"></script>
<script src="{$js_dir}/source/jquery.core-ui-select.js"></script> 
<script src="{$js_dir}/source/jquery.scrollpane.js"></script>
<script src="{$js_dir}/source/jquery.uniform.js"></script> 
<script src="{$js_dir}/source/jquery.mousewheel.js"></script>
<script src="{$js_dir}/source/mainscript.js"></script>
<script src="{$js_dir}/source/modernizr-2.5.3.min.js"></script>
{$HOOK_HEADER}
<script src="{$js_dir}/source/jquery.carouFredSel-6.2.1.js"></script>
<script src="{$js_dir}/source/jquery.touchSwipe.min.js"></script>
</head>
    <!--[if lt IE 9]><div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div><![endif]-->
	<body {if isset($page_name)}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if} class="{if $hide_left_column}hide-left-column {/if}{if $hide_right_column}hide-right-column {/if}{if $content_only} content_only {/if}lang_{$lang_iso}">
    	{if !$content_only}
{if isset($restricted_country_mode) && $restricted_country_mode}
<div id="restricted-country">
  <p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country}</span></p>
</div>
{/if}
<!-- $check_nepal variable extracted from classes/controller/FrontController.php -->
	{if $check_nepal == 'NP'}
		Free delivery within Kathmandu Valley.
	{/if}
 <!--
	{if $page_name !='order' and $page_name !='authentication' and  $page_name !='product' and $page_name !='module-cheque-payment' 
		and $page_name|substr:0:$qpos!= 'module-productquestion-productquestion-form'  and $page_name !='address' and $page_name !='my-account'
		and $page_name !='addresses' and $page_name !='history' and $page_name !='order-slip' and $page_name !='identity'
		and $page_name != 'module-favoriteproducts-account' and $page_name !='contact' and $page_name !='discount'
	}
		{assign var="show_margin" value=0}
	{else}
		{assign var="show_margin" value=0}
	{/if}
			-->		
<div id="wrapp">
       <div id="wrapp_2">
		<!--{if $show_margin == 0}
			<header id="header" class="container ">
		{else}
			<header id="header" class="container " style="border-bottom: 1px solid #ccc;margin-bottom:3px;">
		{/if}
		-->
            
			<header id="header" class="container "><div  id="header-inner" >
       			<a id="header_logo" href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}">
                     <img class="logo" src="{$logo_url}" alt="{$shop_name|escape:'htmlall':'UTF-8'}" {if $logo_image_width}width="{$logo_image_width}"{/if} {if $logo_image_height}height="{$logo_image_height}" {/if} />
                  </a>
          {$HOOK_TOP}
         </div>
           </header>
		   
		<div id="columns" class="container ">
                 <div class="row ">  
                 <div class="loader_page"> 
							{assign var="qpos" value=$page_name|strpos:"?"}
							{assign var='LeftColumn' value=0}
                            {assign var='RightColumn' value=0}
                 			{if isset($HOOK_LEFT_COLUMN) && (str_replace(" ","",$HOOK_LEFT_COLUMN)) !=''}{assign var='LeftColumn' value=3}{/if}
                            {if isset($HOOK_RIGHT_COLUMN) && (str_replace(" ","",$HOOK_RIGHT_COLUMN)) !=''}{assign var='RightColumn' value=3}{/if}
                            {if isset($LeftColumn) && $LeftColumn !=0}   
								{if $page_name !='order'}
									{if $page_name !='authentication' and  $page_name !='product' and $page_name !='module-cheque-payment' and $page_name|substr:0:$qpos!= 'module-productquestion-productquestion-form'  and $page_name !='address' and $page_name !='my-account'
									and $page_name !='addresses' and $page_name !='history' and $page_name !='order-slip' and $page_name !='identity'
									and $page_name != 'module-favoriteproducts-account' and $page_name !='contact' and $page_name !='discount'
									and $page_name !='manufacturer'
									}
									<aside id="left_column"  class="span3 column">
									   {$HOOK_LEFT_COLUMN}
									</aside>
									{/if}	
									
								{/if}
                            {/if}  
						
                         <!--<div id="center_column" class="center_column span{12 - $LeftColumn - $RightColumn} clearfix"> -->
						 <!--<div id="center_column" class="{if $page_name != 'order'}center_column span{12 - $LeftColumn - $RightColumn} clearfix{else} center_column span{12 - $RightColumn}{/if}">-->
						 {if $page_name !='product' and $page_name|substr:0:$qpos!= 'module-productquestion-productquestion-form'}
							{if $page_name=='address' }
								<div id="center_column" class="center_column span{12 - $LeftColumn - $RightColumn} clearfix"> 
							{else}
								{if $page_name =='module-cheque-payment' }
									<div id="center_column" class="center_column span{12 - $LeftColumn } clearfix"> 
								{else}
									<div id="center_column" class="center_column span{12 - $LeftColumn - $RightColumn} clearfix"> 							
								{/if}
									
							{/if}
							
						 {else}
							<div id="center_column" class="center_column span{12 - $RightColumn} clearfix"> 
						 {/if}
{/if} 
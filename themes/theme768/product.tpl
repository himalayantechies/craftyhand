{** 2007-2013 PrestaShop** NOTICE OF LICENSE** This source file is subject to the Academic Free License (AFL 3.0)* that is bundled with this package in the file LICENSE.txt.* It is also available through the world-wide-web at this URL:* http://opensource.org/licenses/afl-3.0.php* If you did not receive a copy of the license and are unable to* obtain it through the world-wide-web, please send an email* to license@prestashop.com so we can send you a copy immediately.** DISCLAIMER** Do not edit or add to this file if you wish to upgrade PrestaShop to newer* versions in the future. If you wish to customize PrestaShop for your* needs please refer to http://www.prestashop.com for more information.**  @author PrestaShop SA <contact@prestashop.com>*  @copyright  2007-2013 PrestaShop SA*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)*  International Registered Trademark & Property of PrestaShop SA*}
{include file="$tpl_dir./errors.tpl"}{*include file="$tpl_dir./modules/blocktopmenu/jquery.fancybox.js"*}{*include file="$tpl_dir./modules/blocktopmenu/jquery.fancybox.pack.js"*}{*include file="$tpl_dir./modules/blocktopmenu/jquery.fancybox.css"*}{if $errors|@count == 0}<script type="text/javascript">$(function() {	$('.jqzoom').jqzoom(	{			zoomWidth: 500,              zoomHeight: 500	});});</script>
<script type="text/javascript">// <![CDATA[// PrestaShop internal settingsvar currencySign = '{$currencySign|html_entity_decode:2:"UTF-8"}';var currencyRate = '{$currencyRate|floatval}';var currencyFormat = '{$currencyFormat|intval}';var currencyBlank = '{$currencyBlank|intval}';var taxRate = {$tax_rate|floatval};var jqZoomEnabled = {if $jqZoomEnabled}true{else}false{/if};
//JS Hookvar oosHookJsCodeFunctions = new Array();
// Parametersvar id_product = '{$product->id|intval}';var productHasAttributes = {if isset($groups)}true{else}false{/if};var quantitiesDisplayAllowed = {if $display_qties == 1}true{else}false{/if};var quantityAvailable = {if $display_qties == 1 && $product->quantity}{$product->quantity}{else}0{/if};var allowBuyWhenOutOfStock = {if $allow_oosp == 1}true{else}false{/if};var availableNowValue = '{$product->available_now|escape:'quotes':'UTF-8'}';var availableLaterValue = '{$product->available_later|escape:'quotes':'UTF-8'}';var productPriceTaxExcluded = {$product->getPriceWithoutReduct(true)|default:'null'} - {$product->ecotax};var productBasePriceTaxExcluded = {$product->base_price} - {$product->ecotax};var reduction_percent = {if $product->specificPrice AND $product->specificPrice.reduction AND $product->specificPrice.reduction_type == 'percentage'}{$product->specificPrice.reduction*100}{else}0{/if};var reduction_price = {if $product->specificPrice AND $product->specificPrice.reduction AND $product->specificPrice.reduction_type == 'amount'}{$product->specificPrice.reduction|floatval}{else}0{/if};var specific_price = {if $product->specificPrice AND $product->specificPrice.price}{$product->specificPrice.price}{else}0{/if};var product_specific_price = new Array();{foreach from=$product->specificPrice key='key_specific_price' item='specific_price_value'}	product_specific_price['{$key_specific_price}'] = '{$specific_price_value}';{/foreach}var specific_currency = {if $product->specificPrice AND $product->specificPrice.id_currency}true{else}false{/if};var group_reduction = '{$group_reduction}';var default_eco_tax = {$product->ecotax};var ecotaxTax_rate = {$ecotaxTax_rate};var currentDate = '{$smarty.now|date_format:'%Y-%m-%d %H:%M:%S'}';var maxQuantityToAllowDisplayOfLastQuantityMessage = {$last_qties};var noTaxForThisProduct = {if $no_tax == 1}true{else}false{/if};var displayPrice = {$priceDisplay};var productReference = '{$product->reference|escape:'htmlall':'UTF-8'}';var productAvailableForOrder = {if (isset($restricted_country_mode) AND $restricted_country_mode) OR $PS_CATALOG_MODE}'0'{else}'{$product->available_for_order}'{/if};var productShowPrice = '{if !$PS_CATALOG_MODE}{$product->show_price}{else}0{/if}';var productUnitPriceRatio = '{$product->unit_price_ratio}';var idDefaultImage = {if isset($cover.id_image_only)}{$cover.id_image_only}{else}0{/if};var stock_management = {$stock_management|intval};{if !isset($priceDisplayPrecision)}	{assign var='priceDisplayPrecision' value=2}{/if}{if !$priceDisplay || $priceDisplay == 2}	{assign var='productPrice' value=$product->getPrice(true, $smarty.const.NULL, $priceDisplayPrecision)}	{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(false, $smarty.const.NULL)}{elseif $priceDisplay == 1}	{assign var='productPrice' value=$product->getPrice(false, $smarty.const.NULL, $priceDisplayPrecision)}	{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(true, $smarty.const.NULL)}{/if}
var productPriceWithoutReduction = '{$productPriceWithoutReduction}';var productPrice = '{$productPrice}';
// Customizable fieldvar img_ps_dir = '{$img_ps_dir}';var customizationFields = new Array();{assign var='imgIndex' value=0}{assign var='textFieldIndex' value=0}{foreach from=$customizationFields item='field' name='customizationFields'}	{assign var="key" value="pictures_`$product->id`_`$field.id_customization_field`"}	customizationFields[{$smarty.foreach.customizationFields.index|intval}] = new Array();	customizationFields[{$smarty.foreach.customizationFields.index|intval}][0] = '{if $field.type|intval == 0}img{$imgIndex++}{else}textField{$textFieldIndex++}{/if}';	customizationFields[{$smarty.foreach.customizationFields.index|intval}][1] = {if $field.type|intval == 0 && isset($pictures.$key) && $pictures.$key}2{else}{$field.required|intval}{/if};{/foreach}
// Imagesvar img_prod_dir = '{$img_prod_dir}';var combinationImages = new Array();{if isset($combinationImages)}	{foreach from=$combinationImages item='combination' key='combinationId' name='f_combinationImages'}		combinationImages[{$combinationId}] = new Array();		{foreach from=$combination item='image' name='f_combinationImage'}			combinationImages[{$combinationId}][{$smarty.foreach.f_combinationImage.index}] = {$image.id_image|intval};		{/foreach}	{/foreach}{/if}
combinationImages[0] = new Array();{if isset($images)}	{foreach from=$images item='image' name='f_defaultImages'}		combinationImages[0][{$smarty.foreach.f_defaultImages.index}] = {$image.id_image};	{/foreach}{/if}
// Translationsvar doesntExist = '{l s='This combination does not exist for this product. Please select another combination.' js=1}';var doesntExistNoMore = '{l s='This product is no longer in stock' js=1}';var doesntExistNoMoreBut = '{l s='with those attributes but is available with others.' js=1}';var uploading_in_progress = '{l s='Uploading in progress, please be patient.' js=1}';var fieldRequired = '{l s='Please fill in all the required fields before saving your customization.' js=1}';
{if isset($groups)}	// Combinations	{foreach from=$combinations key=idCombination item=combination}		var specific_price_combination = new Array();		var available_date = new Array();		specific_price_combination['reduction_percent'] = {if $combination.specific_price AND $combination.specific_price.reduction AND $combination.specific_price.reduction_type == 'percentage'}{$combination.specific_price.reduction*100}{else}0{/if};		specific_price_combination['reduction_price'] = {if $combination.specific_price AND $combination.specific_price.reduction AND $combination.specific_price.reduction_type == 'amount'}{$combination.specific_price.reduction}{else}0{/if};
		specific_price_combination['price'] = {if $combination.specific_price AND $combination.specific_price.price}{$combination.specific_price.price}{else}0{/if};
		specific_price_combination['reduction_type'] = '{if $combination.specific_price}{$combination.specific_price.reduction_type}{/if}';
		specific_price_combination['id_product_attribute'] = {if $combination.specific_price}{$combination.specific_price.id_product_attribute|intval}{else}0{/if};
		available_date['date'] = '{$combination.available_date}';
		available_date['date_formatted'] = '{dateFormat date=$combination.available_date full=false}';
		addCombination({$idCombination|intval}, new Array({$combination.list}), {$combination.quantity}, {$combination.price}, {$combination.ecotax}, {$combination.id_image}, '{$combination.reference|addslashes}', {$combination.unit_impact}, {$combination.minimal_quantity}, available_date, specific_price_combination);
	{/foreach}
{/if}

{if isset($attributesCombinations)}
	// Combinations attributes informations
	var attributesCombinations = new Array();
	{foreach from=$attributesCombinations key=id item=aC}
		tabInfos = new Array();
		tabInfos['id_attribute'] = '{$aC.id_attribute|intval}';
		tabInfos['attribute'] = '{$aC.attribute}';
		tabInfos['group'] = '{$aC.group}';
		tabInfos['id_attribute_group'] = '{$aC.id_attribute_group|intval}';
		attributesCombinations.push(tabInfos);
	{/foreach}
{/if}
//]]>
</script>

{include file="$tpl_dir./breadcrumb.tpl"}

<!--adding block top menu -->
{*include file="$tpl_dir./modules/blocktopmenu/blocktopmenu.tpl"*}
<!-- /adding block top menu -->
<div id="primary_block" class="clearfix">
	{if isset($adminActionDisplay) && $adminActionDisplay}
	<div id="admin-action">
		<p>{l s='This product is not visible to your customers.'}
		<input type="hidden" id="admin-action-product-id" value="{$product->id}" />
		<input type="submit" value="{l s='Publish'}" class="exclusive" onclick="submitPublishProduct('{$base_dir}{$smarty.get.ad|escape:'htmlall':'UTF-8'}', 0, '{$smarty.get.adtoken|escape:'htmlall':'UTF-8'}')"/>
		<input type="submit" value="{l s='Back'}" class="exclusive" onclick="submitPublishProduct('{$base_dir}{$smarty.get.ad|escape:'htmlall':'UTF-8'}', 1, '{$smarty.get.adtoken|escape:'htmlall':'UTF-8'}')"/>
		</p>
		<p id="admin-action-result"></p>
		</p>
	</div>
	{/if}
	{if isset($confirmation) && $confirmation}
	<p class="confirmation">
		{$confirmation}
	</p>
	{/if}
<!--ADD CUSTOM CLOUD ZOOM!!!-->
<!-- Call quick start function. -->
<!-- right infos-->
<div class="row">
<div id="pb-right-column" class="span6">
		<h1 class="pb-right-colum-h">{$product->name|escape:'htmlall':'UTF-8'}</h1>
	<!-- product img-->
		<div id="image-block">
		{if $have_image}
			<span id="view_full_size">
            {if $jqZoomEnabled}
			<a id="zoom1" rel="position: 'inside' , showTitle: false, adjustX:0, adjustY:0" class="cloud-zoom" href="{$link->getImageLink($product->link_rewrite, $cover.id_image,'thickbox_default')}">
<img id="mousetrap_img" alt="{$product->name|escape:'htmlall':'UTF-8'}" width="106" height="106" title="{$product->name|escape:'htmlall':'UTF-8'}" src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'thickbox_default')}" >
<img id="bigpic" alt="{$product->name|escape:'htmlall':'UTF-8'}" title="{$product->name|escape:'htmlall':'UTF-8'}" src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')}" /><span class="mask"></span>	



			 </a>
             {else}
				<a  href="{$link->getImageLink($product->link_rewrite, $cover.id_image,'thickbox_default')}" class="jqzoom" rel='gal1' title="{$product->name|escape:'htmlall':'UTF-8'}">
					<img id="bigpic" alt="{$product->name|escape:'htmlall':'UTF-8'}" title="{$product->name|escape:'htmlall':'UTF-8'}" src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')}" />		
				</a>
             {/if}
			</span>
		{else}
			<span id="view_full_size">
				<img src="{$img_prod_dir}{$lang_iso}-default-large_default.jpg" id="bigpic" alt="" title="{$product->name|escape:'htmlall':'UTF-8'}" width="{$largeSize.width}" height="{$largeSize.height}" />
				<span class="span_link">{l s='Maximize'}</span>
			</span>
		{/if}
		</div>

		{if isset($images) && count($images) > 0}
		<!-- thumbnails -->
		
		<div  align="center" class="added for alignment" style="width:550px;margin:0px 0 0 -25px;"><!--added by manish  3rd jan 2014-->
				
		<div  align="center" class="center1" style="width:300px;" id="views_block" class=" {if isset($images) && count($images) < 2}hidden{/if}">
		{if isset($images) && count($images) > 2}<a id="view_scroll_left"  title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}" >{l s='Previous'}</a>{/if}
		<div  align="center" class="center2" id="thumbs_list" style="width:180px;">
		
			<ul id="thumbs_list_frame">
				{if isset($images)}
                	{assign var="counter" value=0}
					{foreach from=$images item=image name=thumbnails}
                    {assign var="counter" value=$counter+1}
					{assign var=imageIds value="`$product->id`-`$image.id_image`"}
					<li id="thumbnail_{$image.id_image}">
                                     {if $jqZoomEnabled}
                                       <a href="{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')}" class="cloud-zoom-gallery" title="{$image.legend|htmlspecialchars}" rel="useZoom: 'zoom1', smallImage: '{$link->getImageLink($product->link_rewrite, $imageIds, 'large_default')}'">
                                      		<img id="thumb_{$image.id_image}" src="{$link->getImageLink($product->link_rewrite, $imageIds, 'medium_default')}" alt="{$image.legend|htmlspecialchars}"  />
                                        </a>
                                    {else}
									{assign var="large_img" value= $link->getImageLink($product->link_rewrite, $imageIds, 'large_default')}
									{assign var="thickbox_img" value= $link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')}
									
									<a href='javascript:void(0);' {if $counter == 1}class="zoomThumbActive"{/if} rel="gallery: 'gal1', smallimage: '{$large_img}', largeimage: '{$thickbox_img}'" >
                                      		<img src="{$link->getImageLink($product->link_rewrite, $imageIds, 'medium_default')}" alt="{$image.legend|htmlspecialchars}"  />
                                        </a>
								
                                    {/if} 
					</li>
					{/foreach}
				{/if}
			</ul>

		</div>
		{if isset($images) && count($images) > 2}<a id="view_scroll_right" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">{l s='Next'}</a>{/if}
		</div>
		{/if}
		{if isset($images) && count($images) > 1}
        <p class="resetimg" style="text-align:center;">
        	<span id="wrapResetImages" style="display: none;">
            	<i class="icon-reply"></i>
        	<a id="resetImages" href="{$link->getProductLink($product)}" onclick="$('span#wrapResetImages').hide('slow');return (false);">{l s='Display all pictures'}</a></span></p>
        {/if}   
		
	</div>
	
	
	</diV><!--added by manish-->
	<!-- left infos-->
	<div id="pb-left-column" class="span5" style="border-bottom:none !important;">
	
	
	
	<div class="titlenrating" {if !$product->manufacturer_name}style="border-bottom:dotted 1px #cccccc;"{/if} >
			<h1 style="border-bottom:none !important;font-weight:normal !important;">{$product->name|escape:'htmlall':'UTF-8'}</h1>
			
			
			<!--<div style="display:inline;font-size:11px;padding-top:5px;">
				<div style="float:left;"  {if !$product->manufacturer_name}style="display: none;"{/if}>
					<label for="manufacturer_name">{l s='Sold by Artist :'} </label>
					<span id="product_manufacturer">
						<a href="{$link->getmanufacturerLink($product->id_manufacturer, $manufacturer.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{l s='more...'}">
							{$product->manufacturer_name|escape:'htmlall':'UTF-8'}</a>
					</span>	
				</div>-->
				
						
			<!--<p id="product_reference" {if isset($groups) OR !$product->reference}style="display: none;"{/if}><label for="product_reference">{l s='Reference :'} </label><span class="editable">{$product->reference|escape:'htmlall':'UTF-8'}</span> -->
			<!--<p id="manufacturer_name" {if !$product->manufacturer_name}{/if}>-->
			<!--
			<item style="float:left;margin-top:4px;" {if !$product->manufacturer_name}style="display: none;"{/if}>
					<label for="manufacturer_name">{l s='By :'} </label>
					<span id="product_manufacturer">
						<a href="{$link->getmanufacturerLink($product->id_manufacturer, $manufacturer.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{l s='more...'}">
							{$product->manufacturer_name|escape:'htmlall':'UTF-8'}</a>
					</span>	
				</item>-->
			{if $product->manufacturer_name <>''}	
			<div style="display:inline;font-size:12px;padding-top:5px;width:100%;border-bottom:dotted 1px #cccccc;">
				 <div  class="manufac" style="float:left; width:100%;border-bottom:dotted 1px #cccccc;padding-bottom:3px;" {if !$product->manufacturer_name}style="border-bottom: none; "{/if}>
					<!--<label for="manufacturer_name" >{l s='By :'} </label>-->
					<label for="manufacturer_name" style="font-size:12px; font-weight:normal !important;" {if !$product->manufacturer_name}style="display: none;"{/if}>{l s='by :'} </label>
					<span id="product_manufacturer">
						<a href="{$link->getmanufacturerLink($product->id_manufacturer, $manufacturer.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{l s='more...'}">
							{$product->manufacturer_name|escape:'htmlall':'UTF-8'}</a>
					</span>	
				</div>
				<!--<div  style= "float:right;font-size:11px;"id="product_reference" {if isset($groups) OR !$product->reference}style="display: none;"{/if}>
						<!--<item style="float:right;">	-->		
							<!--<label for="product_reference" >{l s='Item #'} </label>-->
							<!--<span class="editable" style="font-size:11px;" >{$product->reference|escape:'htmlall':'UTF-8'}</span>-->
						<!-- </item> -->
				<!--</div>-->
			</div>
			{/if}
			<!--<div style="border-bottom:dotted 1px #cccccc;">&nbsp;</div>-->
			
			<!--
				<p id="product_reference" {if isset($groups) OR !$product->reference}style="display: none; "{/if}>
					<item style="float:right;">			
						<label for="product_reference" >{l s='Item # '} </label>
						<span class="editable" >{$product->reference|escape:'htmlall':'UTF-8'}</span>
					</item>
				</p>
			-->
			
			
</div>

		
					
			
			
            {if $product->online_only}
				<span class="online_only">{l s='Online only'}</span>
            {/if}
			
        		{if $product->description_short OR $packItems|@count > 0}
				
				
		
				
				<div id="product_comments_block_extra">
	{if $nbComments != 0}
	<div class="comments_note">
		<span>{l s='' mod='productcomments'}&nbsp</span>
		<div class="star_content clearfix">
		{section name="i" start=0 loop=5 step=1}
			{if $averageTotal le $smarty.section.i.index}
				<div class="star"></div>
			{else}
				<div class="star star_on"></div>
			{/if}
		{/section}
		</div>
	</div>
	{/if}

	
	<div class="comments_advices">
		{if $nbComments != 0}
		<span class="read_rew"><a class="read_rew" href="#idTab5"><i class="icon-comment-alt"></i>{l s='' mod='productcomments'} ({$nbComments})</a></span>
		{/if}
		{if ($too_early == false AND ($logged OR $allow_guests))}
		
		<a class="open-comment-form"  href="#new_comment_form"><i class="icon-pencil"></i> {l s='Write your review ' mod='productcomments'}</a>|<span style="margin:0 5px;"></span>		<!--<a  id="ask-a-question" class="ask a ques" style="Cursor:pointer;float:right;">Ask a question</a>-->
		{/if}
	</div>			<div  id="ask-a-question" class="ask a ques" style="font-size:12px;"><a>{l s='Ask a Question' mod='productquestion'}</a></div>			<!--<div  id="ask-a-question" class="ask a ques" style="font-size:12px;"><a href="{$this_path}productquestion-form.php?id_product={$smarty.get.id_product|intval}" style="padding:0px;margin:2px;">{l s='Ask a Question' mod='productquestion'}</a></div>-->
</div>
	<script>/*$('#test00').fancybox({'hideOnContentClick': false;});*/$('#ask-a-question' ).click(function() {$.fancybox.open({      href : '{$this_path}productquestion-form.php?id_product={$smarty.get.id_product|intval}&content_only=1',      type : 'iframe',      padding : 5,      width :1000,      height :700      //auto-dimensions : false     });});</script><script>/*$('#test00').fancybox({'hideOnContentClick': false;});*/$('#forpopup' ).click(function() {$.fancybox.open({      href : '{$this_path}productquestion-form.php?id_product={$smarty.get.id_product|intval}&from=new',      type : 'iframe',      padding : 5,      width :1000,      height :700      //auto-dimensions : false     });});</script>	
				
<div  style= "float:right;font-size:12px;margin:5px 0 0 0;"id="product_reference" {if isset($groups) OR !$product->reference}style="display: none;"{/if}>
						<!--<item style="float:right;">	-->		
							<label for="product_reference" >{l s='Item #'} </label>
							<span class="editable" style="font-size:12px;" >{$product->reference|escape:'htmlall':'UTF-8'}</span>
						<!-- </item> -->
				</div>				
				
			

				
		<div id="short_description_block">
			{if $product->description_short}
				<div id="short_description_content" class="rte align_justify">{$product->description_short}</div>
			{/if}
			{if $product->description}
		{*	<p class="buttons_bottom_block"><a href="javascript:{ldelim}{rdelim}" class="button">{l s='More details'}</a></p>*}
			{/if}
			{if $packItems|@count > 0}
			<div class="short_description_pack">
				<h3>{l s='Pack content'}</h3>
				{foreach from=$packItems item=packItem}
				<div class="pack_content">
					{$packItem.pack_quantity} x <a href="{$link->getProductLink($packItem.id_product, $packItem.link_rewrite, $packItem.category)}">{$packItem.name|escape:'htmlall':'UTF-8'}</a>
					<p style="margin-bottom:4px !important;" >{$packItem.description_short}</p>
				</div>
				{/foreach}
			</div>
			{/if}
		</div>
		{/if}										{if $features}<section class="page_product_box toggle_frame datasheet">	<!--<h3 class="toggle">{l s=''}<i class="icon-toggle icon-minus-sign-alt"></i></h3>-->        <div class="toggle_content">            {if isset($features) && $features}                <ul  class="bullet" style="padding-left:0px !important;">                    {foreach from=$features item=feature}                        {if isset($feature.value)}                            <li><!--<i class="icon-angle-right"></i>--> <span style="color:#333333 !important; font-size:12px !important;">{$feature.name|escape:'htmlall':'UTF-8'} : </span> <span style="font-size:12px !important; font-weight:normal !important;color:#585858;">{$feature.value|escape:'htmlall':'UTF-8'}</span></li>                        {/if}                    {/foreach}                </ul>            {/if}        </div></section>{/if}										
             
		{*{if isset($colors) && $colors}
		<!-- colors -->
		<div id="color_picker">
			<p>{l s='Pick a color:' js=1}</p>
			<div class="clear"></div>
			<ul id="color_to_pick_list" class="clearfix">
			{foreach from=$colors key='id_attribute' item='color'}
				<li><a id="color_{$id_attribute|intval}" class="color_pick" style="background: {$color.value};" onclick="updateColorSelect({$id_attribute|intval});$('#wrapResetImages').show('slow');" title="{$color.name}">{if file_exists($col_img_dir|cat:$id_attribute|cat:'.jpg')}<img src="{$img_col_dir}{$id_attribute}.jpg" alt="{$color.name}" width="20" height="20" />{/if}</a></li>
			{/foreach}
			</ul>
			<div class="clear"></div>
		</div>
		{/if}*}       
        
		{if ($product->show_price AND !isset($restricted_country_mode)) OR isset($groups) OR $product->reference OR (isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS)}
		<!-- add to cart form-->
		<form id="buy_block" {if $PS_CATALOG_MODE AND !isset($groups) AND $product->quantity > 0}class="hidden"{/if} action="{$link->getPageLink('cart')}" method="post">

			<!-- hidden datas -->
			<p class="hidden">
				<input type="hidden" name="token" value="{$static_token}" />
				<input type="hidden" name="id_product" value="{$product->id|intval}" id="product_page_product_id" />
				<input type="hidden" name="add" value="1" />
				<input type="hidden" name="id_product_attribute" id="idCombination" value="" />
			</p>
            <div class="product_attributes">
				{if $product->quantity <= 0 }
                <div class="row-3" style="padding-bottom:10px;">
                    <!-- availability -->
					<p id="availability_statut"{if ($product->quantity <= 0 && !$product->available_later && $allow_oosp) OR ($product->quantity > 0 && !$product->available_now) OR !$product->available_for_order OR $PS_CATALOG_MODE} style="display: none;"{/if}>						<span id="availability_label">{l s='Availability:'}</span>						<span id="availability_value"{if $product->quantity <= 0} class="warning_inline"{/if}>						{if $product->quantity <= 0}{if $allow_oosp}{$product->available_later}{else}{l s='This product is no longer in stock'}{/if}{else}{$product->available_now}{/if}						</span><br/>						<b>If the item is out of stock, our artisans can recreate this item on your request. Please click "Send New Request"  button to order this item.</b>						<!--<br/><br/> Please note that each item is an individual creation and unique. Due to the nature and appeal of a handmade product, there may be some slight variation in color and motifs. It's this beauty and uniqueness that proves it is handmade indeed. -->					</p>			
			<!-- number of item in stock -->			<!--{if ($display_qties == 1 && !$PS_CATALOG_MODE && $product->available_for_order)}			<p id="pQuantityAvailable"{if $product->quantity <= 0} style="display: none;"{/if}>				<span id="quantityAvailable">{$product->quantity|intval}</span>				<span {if $product->quantity > 1} style="display: none;"{/if} id="quantityAvailableTxt">{l s='only 1 item in stock'}</span>				<span {if $product->quantity == 1} style="display: none;"{/if} id="quantityAvailableTxtMultiple">{l s='items in stock'}</span>			</p>			{/if}-->
			<!--<p class="warning_inline" id="last_quantities"{if ($product->quantity > $last_qties OR $product->quantity <= 0) OR $allow_oosp OR !$product->available_for_order OR $PS_CATALOG_MODE} style="display: none"{/if} >{l s='Warning: Last items in stock!'}</p>-->               <!--<p id="product_reference" {if isset($groups) OR !$product->reference}style="display: none;"{/if}>                    <label for="product_reference">{l s='Reference:'} </label>					<label for="product_reference">{l s='Item # '} </label>                    <span class="editable">{$product->reference|escape:'htmlall':'UTF-8'}</span>				</p>                           {if $product->online_only}                            <span class="online_only">{l s='Online only'}</span>                        {/if}-->                </div>							                {/if}
                {if isset($groups)}
				<!-- attributes -->
				<div id="attributes">				{foreach from=$groups key=id_attribute_group item=group}					{if $group.attributes|@count}						<fieldset class="attribute_fieldset">							<label class="attribute_label" for="group_{$id_attribute_group|intval}">{$group.name|escape:'htmlall':'UTF-8'} :&nbsp;</label>							{assign var="groupName" value="group_$id_attribute_group"}							<div class="attribute_list">							{if ($group.group_type == 'select')}								<select name="{$groupName}" id="group_{$id_attribute_group|intval}" class="attribute_select" onchange="findCombination();getProductAttribute();">									{foreach from=$group.attributes key=id_attribute item=group_attribute}										<option value="{$id_attribute|intval}"{if (isset($smarty.get.$groupName) && $smarty.get.$groupName|intval == $id_attribute) || $group.default == $id_attribute} selected="selected"{/if} title="{$group_attribute|escape:'htmlall':'UTF-8'}">{$group_attribute|escape:'htmlall':'UTF-8'}</option>									{/foreach}								</select>							{elseif ($group.group_type == 'color')}								<ul id="color_to_pick_list" class="clearfix">									{assign var="default_colorpicker" value=""}									{foreach from=$group.attributes key=id_attribute item=group_attribute}									<li{if $group.default == $id_attribute} class="selected"{/if}>										<a id="color_{$id_attribute|intval}" class="color_pick{if ($group.default == $id_attribute)} selected{/if}" style="background: {$colors.$id_attribute.value};" title="{$colors.$id_attribute.name}" onclick="colorPickerClick(this);getProductAttribute();">											{if file_exists($col_img_dir|cat:$id_attribute|cat:'.jpg')}												<img src="{$img_col_dir}{$id_attribute}.jpg" alt="{$colors.$id_attribute.name}" width="25" height="25" /><br />											{/if}										</a>									</li>									{if ($group.default == $id_attribute)}										{$default_colorpicker = $id_attribute}									{/if}									{/foreach}								</ul>								<input type="hidden" class="color_pick_hidden" name="{$groupName}" value="{$default_colorpicker}" />							{elseif ($group.group_type == 'radio')}                            	<ul>								{foreach from=$group.attributes key=id_attribute item=group_attribute}                                	<li>									<div class="list-radio"><input type="radio" class="attribute_radio" name="{$groupName}" value="{$id_attribute}" {if ($group.default == $id_attribute)} checked="checked"{/if} onclick="findCombination();getProductAttribute();" />									{$group_attribute|escape:'htmlall':'UTF-8'}</div>                                    </li>								{/foreach}                                </ul>							{/if}														{if $group.name =='Size'}								{if $attachments}									{if isset($attachments) && $attachments}										{foreach from=$attachments item=attachment}										<a href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")}" target="_blank">												{$attachment.name|escape:'htmlall':'UTF-8'}											</a>										{/foreach}									{/if}								{/if}							{/if}								</div>						</fieldset>
					{/if}
					
					
				{/foreach}
				</div>
			{/if}
			
			<!-- minimal quantity wanted -->
			<p id="minimal_quantity_wanted_p"{if $product->minimal_quantity <= 1 OR !$product->available_for_order OR $PS_CATALOG_MODE} style="display: none;"{/if}>
				{l s='This product is not sold individually. You must select at least'} <b id="minimal_quantity_label">{$product->minimal_quantity}</b> {l s='quantity for this product.'}
			</p>
			{if $product->minimal_quantity > 1}
			<script type="text/javascript">
				checkMinimalQuantity();
			</script>
			{/if}
	<!--<p class="warning_inline" id="last_quantities"{if ($product->quantity > $last_qties OR $product->quantity <= 0) OR $allow_oosp OR !$product->available_for_order OR $PS_CATALOG_MODE} style="display: none"{/if} >{l s='Warning: Last items in stock!'}</p>
	-->
		</div>

                <div class="content_prices clearfix">
                <!-- prices -->
                {if $product->show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
				
				{*DISPLAYS REDUCED PRICE*}
               <!--    
				<div class="row-2" {if !$product->specificPrice} style="display:none;"{/if}>
             
             
                        <p id="reduction_percent" {if !$product->specificPrice OR $product->specificPrice.reduction_type != 'percentage'} style="display:none;"{/if}><span id="reduction_percent_display" class="price">{if $product->specificPrice AND $product->specificPrice.reduction_type == 'percentage'}-{$product->specificPrice.reduction*100}%{/if}</span></p>
                        <p id="reduction_amount" {if !$product->specificPrice OR $product->specificPrice.reduction_type != 'amount' || $product->specificPrice.reduction|intval ==0} style="display:none"{/if}><span id="reduction_amount_display" class="price">{if $product->specificPrice AND $product->specificPrice.reduction_type == 'amount' && $product->specificPrice.reduction|intval !=0}-{convertPrice price=$product->specificPrice.reduction|floatval}{/if}</span></p>
                        {if $product->specificPrice AND $product->specificPrice.reduction && $product->specificPrice.reduction > 0}
                            <p id="old_price"><span class="price">
                            {if $priceDisplay >= 0 && $priceDisplay <= 2}
                                {if $productPriceWithoutReduction > $productPrice}
                                    <span id="old_price_display price">{convertPrice price=$productPriceWithoutReduction}</span>
										{if $tax_enabled && $display_tax_label == 1}
                                        {if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}
                                    {/if} 
                                {/if}
                            {/if}
                            </span>
                            </p>
                         {/if}
    				{if $product->on_sale}
					<img src="{$img_dir}onsale_{$lang_iso}.gif" alt="{l s='On sale'}" class="on_sale_img"/>
					<span class="on_sale">{l s='On sale!'}</span>
                    {elseif $product->specificPrice AND $product->specificPrice.reduction AND $productPriceWithoutReduction > $productPrice}
                        <span class="discount">{l s='Reduced price!'}</span>
                    {/if}
            </div>
			-->
			<div class="row_1" style="border-top:none;border-bottom:none;padding-top:10px;padding-bottom:10px;">
				<p class="our_price_display">
				{if $priceDisplay >= 0 && $priceDisplay <= 2}
					<span  id="our_price_display">{convertPrice price=$productPrice}</span>
					{if $product->on_sale}
						<img src="{$img_dir}onsale_{$lang_iso}.gif" alt="{l s='On sale'}" class="on_sale_img"/>
						<span class="on_sale">{l s='On sale!'}</span>
                    {elseif $product->specificPrice AND $product->specificPrice.reduction AND $productPriceWithoutReduction > $productPrice}
                        <span class="discount" style="font-size: 18px;color:#000;padding-left:20px;">{l s='Save'}
						
						<span id="reduction_amount" {if !$product->specificPrice OR $product->specificPrice.reduction_type != 'amount' || $product->specificPrice.reduction|intval ==0} style="display:none"{/if}><span id="reduction_amount_display" class="price" style="font-size: 18px;font-weight:bold;color:#000;">{if $product->specificPrice AND $product->specificPrice.reduction_type == 'amount' && $product->specificPrice.reduction|intval !=0}{convertPrice price=$product->specificPrice.reduction|floatval}{/if}</span>
						</span>
						
						<p id="reduction_percent" {if !$product->specificPrice OR $product->specificPrice.reduction_type != 'percentage'} style="display:none;"{/if}><span id="reduction_percent_display" class="price" >{if $product->specificPrice AND $product->specificPrice.reduction_type == 'percentage'}-{$product->specificPrice.reduction*100}%{/if}</span></p>
						
						</span>
                    {/if}
					
					 
					<!--{if $tax_enabled  && ((isset($display_tax_label) && $display_tax_label == 1) OR !isset($display_tax_label))}
						{if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}
					{/if}-->
				{/if}
				</p>
				<!-- DISPLAY ORIGINAL PRICE -->
				{if $product->specificPrice AND $product->specificPrice.reduction && $product->specificPrice.reduction > 0}
					<div  style="padding-top:5px; float:left;width:100%;"><span >
					{if $priceDisplay >= 0 && $priceDisplay <= 2}
						{if $productPriceWithoutReduction > $productPrice}
							<span>Original price:	</span>
							<span id="old_price_display ">{convertPrice price=$productPriceWithoutReduction}</span>
							<!-- {if $tax_enabled && $display_tax_label == 1}
								{if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}
							{/if} -->
						{/if}
					{/if}
					</span>
					</div>
                {/if}
				<!-- END OF DISPLAY ORIGINAL PRICE -->	
				
				{if ($display_qties == 1 && !$PS_CATALOG_MODE && $product->available_for_order)}
					<!--<div style="padding-top:10px;" id="pQuantityAvailable" {if $product->quantity <= 0} style="display: none;"{/if} > -->
					{if $product->quantity == 1}
					<div style="padding-top:5px; float:left;" >
						<!--<span id="quantityAvailable">{$product->quantity|intval}</span>-->
						<span style="font-size:16px;">In Stock,</span>
						<span style="color:rgb(197, 1, 3); font-size:16px;" {if $product->quantity > 1} style="display: none;"{/if} id="quantityAvailableTxt">{l s='Only 1 left!'}</span>
						<span {if $product->quantity == 1} style="display: none;"{/if} id="quantityAvailableTxtMultiple" >{l s='items in stock'}</span>
					</div>
					{/if} 
				{/if}
			</div>	
			<div class="row_1" style="display:inline-block;width:100%;float:left;border-top:0px;font-size:12px;border-bottom:none;padding-top:10px;padding-bottom:10px;">
				<span style="color:#333333; font-weight:bold;">Processing Time:</span> Ships within {$product->handling_time} business days.<br/>
				<span style="color:#333333; font-weight:bold;">Returns:</span> 14 days money back, buyer pays return shipping.<br/>
				<span style="color:#333333; font-weight:bold;">Guarantee:</span> Get the item you ordered or get your money back.
			</div>
    		<div class="row_1" style="display:inline-block;width:100%;float:left;border-top:0px;" >
				<!--<p class="our_price_display">
				{if $priceDisplay >= 0 && $priceDisplay <= 2}
					<span  id="our_price_display">{convertPrice price=$productPrice}</span>
					{if $tax_enabled  && ((isset($display_tax_label) && $display_tax_label == 1) OR !isset($display_tax_label))}
						{if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}
					{/if}
				{/if}
				</p>-->
				             
  <!-- quantity wanted -->
					<p id="quantity_wanted_p"{if (!$allow_oosp && $product->quantity <= 0) OR $virtual OR !$product->available_for_order OR $PS_CATALOG_MODE} style="display: none;"{/if}>
                        <span style="padding-right:10px;">Quantity: 
                        <input type="text" name="qty" id="quantity_wanted" class="text" style="padding-right:25px;margin:-5px 0 0;" value="{if isset($quantityBackup)}{$quantityBackup|intval}{else}{if $product->minimal_quantity > 1}{$product->minimal_quantity}{else}1{/if}{/if}" size="2" maxlength="3" {if $product->minimal_quantity > 1}onkeyup="checkMinimalQuantity({$product->minimal_quantity});"{/if} />
						</span>
                        <label>{l s='Quantity:'}</label>
                    </p>
					
                    {if (!$allow_oosp && $product->quantity <= 0) OR !$product->available_for_order OR (isset($restricted_country_mode) AND $restricted_country_mode) OR $PS_CATALOG_MODE}						<!--
                        <span class="exclusive">                            <span></span>                            {l s='Add to cart'}                        </span>						-->						<!-- Send New Request  -->						<p id="add_to_cart" class="buttons_bottom_block" style="margin:-6px 0 0 !important;">                            <a class="btn-success btn" id="forpopup">							<span>{l s='Send New Request'}  </span></a>                        </p>						<!-- End of Send New Request -->						
                    {else}
                        <p id="add_to_cart" class="buttons_bottom_block" style="margin:-6px 0 0 !important;">
                         
                            <a class="btn-success btn" href="javascript:document.getElementById('add2cartbtn').click();"> <span>{l s='Add to cart'}  </span></a>
							<input id="add2cartbtn" type="submit" name="Submit" value="{l s='Add to cart'}" />
                            <!--show when "This product is no longer in stock with those attributes but is available with others"-->
                            <span class="exclusive" style="display:none;">
                                <span></span>
                                {l s='Add to cart'}
                            </span>
                        </p>
                    {/if}
								
                  
					
    	</div>
		            
                    <div class="other-prices">
                         {if $priceDisplay == 2}
                            <span id="pretaxe_price"><span id="pretaxe_price_display">{convertPrice price=$product->getPrice(false, $smarty.const.NULL)}</span>&nbsp;{l s='tax excl.'}</span>
                        {/if}
                        {if $packItems|@count && $productPrice < $product->getNoPackPrice()}
                            <p class="pack_price">{l s='Instead of'} <span class="price" style="text-decoration: line-through;">{convertPrice price=$product->getNoPackPrice()}</span></p>
                        {/if}
                        {if $product->ecotax != 0}
                            <p class="price-ecotax">{l s='include'} <span id="ecotax_price_display">{if $priceDisplay == 2}{$ecotax_tax_exc|convertAndFormatPrice}{else}{$ecotax_tax_inc|convertAndFormatPrice}{/if}</span> {l s='for green tax'}
                                {if $product->specificPrice AND $product->specificPrice.reduction}
                                <br />{l s='(not impacted by the discount)'}
                                {/if}
                            </p>
                        {/if}
                        {if !empty($product->unity) && $product->unit_price_ratio > 0.000000}
                             {math equation="pprice / punit_price"  pprice=$productPrice  punit_price=$product->unit_price_ratio assign=unit_price}
                            <p class="unit-price"><span id="unit_price_display">{convertPrice price=$unit_price}</span> {l s='per'} {$product->unity|escape:'htmlall':'UTF-8'}</p>
                        {/if}
                    </div>
                {/if}
            </div>
			
			 
<!-- number of item in stock -->
			<!--{if ($display_qties == 1 && !$PS_CATALOG_MODE && $product->available_for_order)}
			<p id="pQuantityAvailable"{if $product->quantity <= 0} style="display: none;"{/if}>
				<span id="quantityAvailable">{$product->quantity|intval}</span>
				<stock>IN STOCK</stock>
				<span {if $product->quantity > 1} style="display: none;"{/if} id="quantityAvailableTxt">{l s='Only 1 left!'}</span>
				<span {if $product->quantity == 1} style="display: none;"{/if} id="quantityAvailableTxtMultiple">{l s='items in stock'}</span>
			</p>
			{/if}				
             -->
			<!-- Out of stock hook -->
			<p id="oosHook"{if $product->quantity > 0} style="display: none;"{/if}>
				{$HOOK_PRODUCT_OOS}
			</p>

      {if isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS}{$HOOK_PRODUCT_ACTIONS}{/if}
	
</form>

{/if}
{if isset($HOOK_EXTRA_RIGHT) && $HOOK_EXTRA_RIGHT}{$HOOK_EXTRA_RIGHT}{/if}
  <!-- added later by Manish -->
	<!--<div class="row_1" style="display:inline-block;width:100%;float:right;border-top:0px;"> -->
		<ul id="usefull_link_block" class="clearfix" >
			{if $HOOK_EXTRA_LEFT}{$HOOK_EXTRA_LEFT}{/if}
			<!--<li class="print"><a href="javascript:print();"><i class="icon-print"></i>{l s='Print'}</a></li> -->
			<li><span class='st_googleplus' ></span></li>
			<li><span class='st_pinterest' ></span></li>
			<li><span class='st_twitter' st_via="craftyhandnepal" ></span></li>
			<li>Share on <span class='st_facebook'></span></li>
		</ul> 
		<!-- end of edit by Manish -->
	<!--</div>-->
		
	 		


		<!--<div  id="ask-a-question" class="ask a ques" style="background:#f3f3f2;border:solid 1px #d8d5d2; border-radius:3px;color:#5a5552!important;width:100px;font-weight:bold;margin:-6px 0 0 0; Cursor:pointer;">Ask a question-->		<!--<a href="{$this_path}productquestion-form.php?id_product={$smarty.get.id_product|intval}" style="color:#5a5552;padding:0px;margin:2px;">{l s='Ask a Question' mod='productquestion'}</a>--><!--</div>-->
	</div>
</div><script>/*$('#test00').fancybox({'hideOnContentClick': false;});*/$('#ask-a-question' ).click(function() {$.fancybox.open({      href : '{$this_path}productquestion-form.php?id_product={$smarty.get.id_product|intval}&content_only=1',      type : 'iframe',      padding : 5,      width :1000,      height :700      //auto-dimensions : false     });});</script><script>/*$('#test00').fancybox({'hideOnContentClick': false;});*/$('#forpopup' ).click(function() {$.fancybox.open({      href : '{$this_path}productquestion-form.php?id_product={$smarty.get.id_product|intval}&from=new',      type : 'iframe',      padding : 5,      width :1000,      height :700      //auto-dimensions : false     });});</script>

</div>
<!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<div class="clear"></div>


<div class="extra-box-product">

{*{if isset($HOOK_PRODUCT_FOOTER) && $HOOK_PRODUCT_FOOTER}{$HOOK_PRODUCT_FOOTER}{/if} *}


{if (isset($quantity_discounts) && count($quantity_discounts) > 0)}
  <script type="text/javascript">
    $(function() {
      $('#quantityDiscount table').footable();
	  breakpoints: {
  phone: 480
}
    });
 </script>


<section id="quantityDiscount" class="page_product_box toggle_frame">
	<h3 class="toggle">{l s='Sliding scale pricing'}<i class="icon-toggle icon-minus-sign-alt"></i></h3>
        <div class="toggle_content">
            <table class=" std shop_table footable ">
                <thead>
                    <tr>
                        <th data-class="expand">{l s='Product'}</th>
                        <th data-hide="phone">{l s='From (qty)'}</th>
                        <th data-hide="phone">{l s='Discount'}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$quantity_discounts item='quantity_discount' name='quantity_discounts'}
                    <tr id="quantityDiscount_{$quantity_discount.id_product_attribute}">
                        <td>
                            {if (isset($quantity_discount.attributes) && ($quantity_discount.attributes))}
                                {$product->getProductName($quantity_discount.id_product, $quantity_discount.id_product_attribute)}
                            {else}
                                {$product->getProductName($quantity_discount.id_product)}
                            {/if}
                        </td>
                        <td>{$quantity_discount.quantity|intval}</td>
                        <td>
                            {if $quantity_discount.price >= 0 OR $quantity_discount.reduction_type == 'amount'}
                               -{convertPrice price=$quantity_discount.real_value|floatval}
                           {else}
                               -{$quantity_discount.real_value|floatval}%
                           {/if}
                        </td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
    </div>
</section>
{/if}

{if (isset($product) && $product->description) || (isset($features) && $features) || (isset($accessories) && $accessories) || (isset($HOOK_PRODUCT_TAB) && $HOOK_PRODUCT_TAB) || (isset($attachments) && $attachments)}

{if $product->description}
<section class="page_product_box toggle_frame more_info_inner" style="border-bottom:dotted 1px #cccccc !important;">
	<h3 class="toggle" >{l s='More information about '}{$product->name|escape:'htmlall':'UTF-8'}<i class="icon-toggle icon-minus-sign-alt"></i></h3>
		{if isset($product) && $product->description}
			<div class="toggle_content" >
				{strip}{($product->description)}{/strip}
           	</div> 
			{strip}
			<div style="background-color:#f2f2f2;font-size:13px;padding:6px;"><shortnote>All attempts have been made to best represent the item's true color in the pictures, but the colors may vary slightly due to differences in monitor calibrations 
			</shortnote></div>			{if $product->available_note}				<note>
				<p> <h3>Note:</h3>
				The items listed in this website are simultaneously displayed in our store/gallery for sale as well. We do our best to keep the  availability status of items up to date in the website. But it is possible that the item is sold out from the store and we are unable to update its status immediately and might be out of stock at the time you place an order.
				<br/><br/>
				Though less likely to occur, under such circumstances, we will immediately inform you and try our best to make available similar item or resolve the issue with mutual consent.
				</p>
				</note>			{else}					<div style="padding-bottom: 16px;">&nbsp;</div>			{/if}			
			{/strip}	
 		{/if}
</section>  
{/if} 

<!--{if $features}
<section class="page_product_box toggle_frame datasheet">
	<h3 class="toggle">{l s='Data sheet'}<i class="icon-toggle icon-minus-sign-alt"></i></h3>
        <div class="toggle_content">
            {if isset($features) && $features}
                <ul  class="bullet">
                    {foreach from=$features item=feature}
                        {if isset($feature.value)}
                            <li><i class="icon-angle-right"></i> <span>{$feature.name|escape:'htmlall':'UTF-8'} - </span> {$feature.value|escape:'htmlall':'UTF-8'}</li>
                        {/if}
                    {/foreach}
                </ul>
            {/if}
        </div>
</section>
{/if}-->


<!--
{if $attachments}
<section class="page_product_box toggle_frame attachment_product">
	<h3 class="toggle">{l s='Download'}<i class="icon-toggle icon-minus-sign-alt"></i></h3>
        <div class="toggle_content">  
            {if isset($attachments) && $attachments}
                <ul class="bullet">
                    {foreach from=$attachments item=attachment}
                        <li>
							<a href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")}" target="_blank">
                                <i class="icon-angle-right"></i> {$attachment.name|escape:'htmlall':'UTF-8'}
                            </a>
							
                       		{*$attachment.description|escape:'htmlall':'UTF-8'*}
                        </li>
                    {/foreach}
                </ul>
            {/if}
    </div>
</section>
{/if}
-->
{if isset($accessories) AND $accessories}
<section class="page_product_box toggle_frame more_info_inner4">
	<h3 class="toggle">{l s='Accessories'}<i class="icon-toggle icon-minus-sign-alt"></i></h3>
	  {if isset($accessories) AND $accessories}
		<ul id="idTab4" class="toggle_content">
            {foreach from=$accessories item=accessory name=accessories_list}
						{if ($accessory.allow_oosp || (isset($accessory.quantity_all_versions) && $accessory.quantity_all_versions > 0) || $accessory.quantity > 0) AND $accessory.available_for_order AND !isset($restricted_country_mode)}
							{assign var='accessoryLink' value=$link->getProductLink($accessory.id_product, $accessory.link_rewrite, $accessory.category)}
							<li class="ajax_block_product bordercolor {if $smarty.foreach.accessories_list.first}first_item{elseif $smarty.foreach.accessories_list.last}last_item{else}item{/if} product_accessories_description">
                            	<div class="accessories_desc bordercolor">
									<a href="{$accessoryLink|escape:'htmlall':'UTF-8'}" title="{$accessory.legend|escape:'htmlall':'UTF-8'}" class="accessory_image product_img_link bordercolor">
                            		<img src="{$link->getImageLink($accessory.link_rewrite, $accessory.id_image, 'medium_default')}" alt="{$accessory.legend|escape:'htmlall':'UTF-8'}"  /></a>
                                    <h5><a class="product_link" href="{$accessoryLink|escape:'htmlall':'UTF-8'}">{$accessory.name|truncate:22:'...':true|escape:'htmlall':'UTF-8'}</a></h5>
                                    <p class="product_descr"  class="product_description">{$accessory.description_short|strip_tags|truncate:170:'...'}</p>									
								</div>
								<div class="accessories_price">
									{if $accessory.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}<span class="price">{if $priceDisplay != 1}{displayWtPrice p=$accessory.price}{else}{displayWtPrice p=$accessory.price_tax_exc}{/if}</span>{/if}
								
									{if !$PS_CATALOG_MODE && ($accessory.allow_oosp || $accessory.quantity > 0)}
									<a class="exclusive button ajax_add_to_cart_button btn_add_cart" href="{$link->getPageLink('cart', true, NULL, "qty=1&amp;id_product={$accessory.id_product|intval}&amp;token={$static_token}&amp;add")}" rel="ajax_id_product_{$accessory.id_product|intval}" title="{l s='Add to cart'}"><span>{l s='Add to cart'}</span></a>
                                    {else}
                                     <span class="exclusive">{l s='Add to cart'}</span>
                                     <span class="availability">
                                        {if (isset($accessory.quantity_all_versions) && $accessory.quantity_all_versions > 0)}{l s='Product available with different options'}{else}{l s='Out of stock'}{/if}
                                     </span>
									{/if}	
                                    </div>							
							</li>
						{/if}
					{/foreach}
		</ul>
	{/if}
</section>
{/if}

{if isset($product) && $product->customizable}
<section class="page_product_box toggle_frame">
	<h3>{l s='Product customization'}<i class="icon-toggle icon-minus-sign-alt"></i></h3>
		<div class="customization_block toggle_content">
			<form method="post" action="{$customizationFormTarget}" enctype="multipart/form-data" id="customizationForm" class="clearfix">
				<p class="infoCustomizable">
					{l s='After saving your customized product, remember to add it to your cart.'}
					{if $product->uploadable_files}<br />{l s='Allowed file formats are: GIF, JPG, PNG'}{/if}
				</p>
				{if $product->uploadable_files|intval}
				<div class="customizableProductsFile titled_box clearfix">
					<h2><span>{l s='Pictures'}</span></h2>
					<ul id="uploadable_files" >
						{counter start=0 assign='customizationField'}
						{foreach from=$customizationFields item='field' name='customizationFields'}
							{if $field.type == 0}
								<li class="customizationUploadLine{if $field.required} required{/if}">{assign var='key' value='pictures_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
									{if isset($pictures.$key)}
									<div class="customizationUploadBrowse">
										<img src="{$pic_dir}{$pictures.$key}_small" alt="" />
										<a  class="btn btn-danger" href="{$link->getProductDeletePictureLink($product, $field.id_customization_field)}" title="{l s='Delete'}" ><i class="icon-trash icon-large"></i>{l s='Delete'}
										</a>
									</div>
									{/if}
					<div class="customizationUploadBrowse">
						<label class="customizationUploadBrowseDescription">{if !empty($field.name)}{$field.name}{else}{l s='Please select an image file from your computer'}{/if}{if $field.required}<sup>*</sup>{/if}</label>
						<input type="file" name="file{$field.id_customization_field}" id="img{$customizationField}" class="customization_block_input {if isset($pictures.$key)}filled{/if}" />
					</div>
								</li>
								{counter}
							{/if}
						{/foreach}
					</ul>
				</div>
				{/if}
				{if $product->text_fields|intval}
				<div class="customizableProductsText titled_box clearfix">
					<h2><span>{l s='Text'}</span></h2>
					<ul id="text_fields">
					{counter start=0 assign='customizationField'}
					{foreach from=$customizationFields item='field' name='customizationFields'}
						{if $field.type == 1}
						<li class="customizationUploadLine{if $field.required} required{/if}">
							<label for ="textField{$customizationField}">{assign var='key' value='textFields_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field} {if !empty($field.name)}{$field.name}{/if}{if $field.required}<sup>*</sup>{/if}</label>
							<textarea type="text" name="textField{$field.id_customization_field}" id="textField{$customizationField}" rows="1" cols="40" class="customization_block_input" >{if isset($textFields.$key)}{$textFields.$key|stripslashes}{/if}</textarea>
						</li>
						{counter}
						{/if}
					{/foreach}
					</ul>
				</div>
				{/if}
				<p id="customizedDatas">
					<input type="hidden" name="quantityBackup" id="quantityBackup" value="" />
					<input type="hidden" name="submitCustomizedDatas" value="1" />
					<input type="button" class="button" value="{l s='Save'}" onclick="javascript:saveCustomization()" />
					<span id="ajax-loader" style="display:none"><img src="{$img_ps_dir}loader.gif" alt="loader" /></span>
				</p><p class="required"><sup>*</sup> {l s='required fields'}</p>
                </form>             			
		</div>
</section>
{/if}

{if isset($HOOK_PRODUCT_FOOTER) && $HOOK_PRODUCT_FOOTER}{$HOOK_PRODUCT_FOOTER}{/if} 

<section id="last_page_product" class="page_product_box toggle_frame">
{$HOOK_PRODUCT_TAB}
	<div id="more_info_sheets" class="toggle_content toggle_content_comment">
     {if isset($HOOK_PRODUCT_TAB_CONTENT) && $HOOK_PRODUCT_TAB_CONTENT}{$HOOK_PRODUCT_TAB_CONTENT}{/if}
   </div> 	
</section>
{/if}
</div>
    {if isset($packItems) && $packItems|@count > 0}
        <section id="blockpack" class="page_product_box toggle_frame">
            <h3 class="toggle">{l s='Pack content'}<i class="icon-toggle icon-minus-sign-alt"></i></h3>
            <div class="toggle_content">
            {include file="$tpl_dir./product-list.tpl" products=$packItems}
            </div>
        </section>
    {/if}
{/if}
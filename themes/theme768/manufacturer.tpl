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

{include file="$tpl_dir./breadcrumb.tpl"}
	<aside id="left_column" class="span3 column">
	<div> <span style="font-size:18px;">About this artist	</span></div>
		<div style="padding-right:10px; padding-bottom:22px;width:100%">
			<img src="{$img_manu_dir}{$manufacturer->id|escape:'htmlall':'UTF-8'}-medium_default.jpg" alt="">			
		</div>
		<div><p style="font-style:italic;width:90%;">{$manufacturer->short_description}</p></div>
	</aside>
{include file="$tpl_dir./errors.tpl"}

{if !isset($errors) OR !sizeof($errors)}
	<h1><span style="font-size:18px;">{$manufacturer->name|escape:'htmlall':'UTF-8'}</span></h1>
	{if !empty($manufacturer->description) || !empty($manufacturer->short_description)}
	<div>
		<div class="description_box cat_desc" style="padding-top:15px;">
				{$manufacturer->description|substr:0:$nlPost}
				{assign var="desc_len" value=$manufacturer->description|count_characters:true}
				<span style="display:none;">{$manufacturer->description|substr:$nlPost:$desc_len}</span>
				<a href="#" onclick="$(this).prev().slideDown('slow'); $(this).hide(); return false;">{l s='... Read more'}</a>
				<!--class="lnk_more" -->
			
		</div>
	</div>	
	{/if}
	<br/>
	<h1 style="padding-top:10px;padding-bottom:20px;"><span>{l s='Items from '}&nbsp;{$manufacturer->name|escape:'htmlall':'UTF-8'}</span></h1>
	{if $products}
            <div class="sortPagiBar shop_box_row shop_box_row clearfix">
            {include file="./product-sort.tpl"}
            {include file="./nbr-product-page.tpl"}
            </div>
		{include file="./product-list.tpl" products=$products}
	            <div class="bottom_pagination shop_box_row  clearfix">
            {include file="./product-compare.tpl"}
            {include file="./pagination.tpl"}
            </div>
	{else}
		<p class="warning">{l s='No products for this artist.'}</p>
	{/if}
{/if}

 
<div id="manufacturer_comments_block_extra">
{if isset($HOOK_MANU_TAB_CONTENT) && $HOOK_MANU_TAB_CONTENT}{$HOOK_MANU_TAB_CONTENT}{/if}

	{if $nbComments != 0}

	<div class="comments_note">

		<span>{l s='' mod='manufacturercomments'}&nbsp</span>

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

		<span class="read_rew"><a class="read_rew" href="#idTab5"><i class="icon-comment-alt"></i>{l s='' mod='manufacturercomments'} ({$nbComments})</a></span>

		{/if}

		{if ($too_early == false AND ($logged OR $allow_guests))}

		

		<a class="open-comment-form"  href="#new_comment_form"><i class="icon-pencil"></i> {l s='Write your review ' mod='manufacturercomments'}</a>|<span style="margin:0 5px;"></span>
		<!--<a  id="ask-a-question" class="ask a ques" style="Cursor:pointer;float:right;">Ask a question</a>-->
		{/if}

	</div>
			

</div>
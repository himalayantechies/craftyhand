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
<script type="text/javascript">
var productcomments_controller_url = '{$productcomments_controller_url}';
var confirm_report_message = "{l s='Are you sure you want report this comment?' mod='productcomments'}";
var secure_key = "{$secure_key}";
var productcomments_url_rewrite = '{$productcomments_url_rewriting_activated}';
</script>

<div id="idTab5">
	<div id="product_comments_block_tab">
	{if $comments}
		{foreach from=$comments item=comment}
			{if $comment.content}
			<div class="comment clearfix">
				<ul>
					{if $comment.total_advice > 0}
						<li style="font-size:11px;">{l s='%1$d out of %2$d people found this review useful.' sprintf=[$comment.total_useful,$comment.total_advice] mod='productcomments'}</li>
					{/if}
				</ul>
					
				<div class="comment_author" style="padding-top:5px;">
					<div class="star_content clearfix" style="margin:0px !important;">
					{section name="i" start=0 loop=5 step=1}
						{if $comment.grade le $smarty.section.i.index}
							<div class="star"></div>
						{else}
							<div class="star star_on"></div>
						{/if}
						
					{/section}
					<div style="width:100%;">
					<h4 class="title_block" style="float:right; margin:-13px -60px 0 76px;font-weight:bold;color:#333333;font-size:13px;text-transform:none;">{$comment.title}</h4></div>
					
					</div>
					<div class="comment_author_infos" style="float:left;">
						<div class="author" style="margin:0px 14px 0px 0;">
							<span style="color:#888888;font-weight:normal;text-transform:capitalize;font-size:11px;">By &nbsp;</span>
							<span style="color:#333333; font-weight:normal;text-transform:capitalize;font-size:11px;">{$comment.customer_name|escape:'html':'UTF-8'}</span>
							<em style="font-style:normal;"> <span style="color:#888888;text-transform:none;font-size:11px;font-weight:normal;margin:0 0 0 8px;">on</span><span style="font-style:normal;"> <span style="color:#888888;text-transform:none;font-size:11px;font-weight:normal;margin:0 0 0 5px;"> {$smarty.now|date_format} </span></em>
						</div>
					
										
								
					</div>
				
	<br/>				
					<span style="color:#333333; text-transform:none;font-weight:normal;padding-top:15px;width:100%;">
					{$comment.content|escape:'html':'UTF-8'|nl2br}
					</span>
					<br/>
					<div>
					<ul>
						{if $logged == 1}
							{if !$comment.customer_advice}
								<li style="margin:19px 0 0; display:inline-flex; width:500px !important;color:#333333;font-size:11px;font-weight:bold;">{l s='Was this review useful to you?' mod='productcomments'}
									<div class="clearfix" style="margin:-3px 0 0 -2px;">
									<button class="usefulness_btn" style="width:30px; padding:0 0px; margin:-2px 0 0 8px; color:#333333; font-size:11px;" data-is-usefull="1" data-id-product-comment="{$comment.id_product_comment}">{l s='yes' mod='productcomments'}</button> 
									
									<button class="usefulness_btn"  style="width:30px; padding:0 0px ; color:#333333; font-size:11px; margin:-2px 0 0 8px;"data-is-usefull="0" data-id-product-comment="{$comment.id_product_comment}">{l s='no' mod='productcomments'}</button>
									</div>
									<div>
									{if !$comment.customer_report}
									<span style ="text-transform:none;padding-left:7px;"class="report_btn" data-id-product-comment="{$comment.id_product_comment}">{l s='Report abuse' mod='productcomments'}</span></li>
									{/if}		
									</div>
								</li>
							{/if}
							
						{/if}
					</ul>
					<div class="clearfix" style ="text-transform:none;">	&nbsp;				
				</div>
			
			</div>
			{/if}
		{/foreach}
	{else}
		{if ($too_early == false AND ($logged OR $allow_guests))}
		<p class="align_center">
			<a id="new_comment_tab_btn" class="open-comment-form" href="#new_comment_form">{l s='Be the first to write your review' mod='productcomments'} !</a>
		</p>
		{else}
		<p class="align_center">{l s='No customer comments for the moment.' mod='productcomments'}</p>
		{/if}
	{/if}	
	</div>
</div>

<!-- Fancybox -->
<div style="display: none;">
	<div id="new_comment_form">
		<form action="#" id="id_new_comment_form">
			<h1 class="title"><span>{l s='Write your review' mod='productcomments'}</span></h1>
            <div class="row-fluid">
            	<div class="span6 titled_box">
                <div class="product clearfix">
                	<h2 class="product_name"><span>{$product->name}</span></h2>
                    <img src="{$link->getImageLink($product->link_rewrite, $productcomment_cover, 'small_default')}" alt="{$product->name|escape:html:'UTF-8'}" />
                    <div class="product_desc">
                        {$product->description_short}
                    </div>
                </div>
				</div>
                <div class="span6 titled_box">
                    <div class="new_comment_form_content">
                        <h2><span>{l s='Write your review' mod='productcomments'}</span></h2>
        
                        <div id="new_comment_form_error" class="error" style="display: none;">
                            <ul></ul>
                        </div>
        
                        {if $criterions|@count > 0}
                            <ul id="criterions_list">
                            {foreach from=$criterions item='criterion'}
                                <li>
                                    <label>{$criterion.name|escape:'html':'UTF-8'}:</label>
                                    <div class="star_content">
                                        <input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="1" />
                                        <input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="2" />
                                        <input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="3" checked="checked" />
                                        <input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="4" />
                                        <input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="5" />
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            {/foreach}
                            </ul>
                        {/if}
        
                        <label for="comment_title">{l s='Title' mod='productcomments'}: <sup class="required">*</sup></label>
                        <input id="comment_title" name="title" type="text" value=""/>
						<!--<input id="title" name="title" type="text" value=""/>-->
						
                        <label for="content">{l s='Comment' mod='productcomments'}: <sup class="required">*</sup></label>
                        <textarea id="content" name="content"></textarea>
        
                        {if $allow_guests == true && $logged == 0}
                        <label>{l s='Your name' mod='productcomments'}: <sup class="required">*</sup></label>
                        <input id="commentCustomerName" name="customer_name" type="text" value=""/>
							<!--<input id="customer_name" name="customer_name" type="text" value=""/>-->
                        {/if}
                        
                    </div>
                </div>
             </div>
             <div id="new_comment_form_footer" class=" sendfrend_footer">
                            <input id="id_product_comment_send" name="id_product" type="hidden" value='{$id_product_comment_form}'></input> 
							<!--<input id="id_product" name="id_product" type="hidden" value='{$id_product_comment_form}'></input>-->
                            <p class="fl required"><sup>*</sup> {l s='Required fields' mod='productcomments'}</p>
                            <p class="fr ">
                                <button id="submitNewMessage" class="btn btn-inverse" name="submitMessage" type="submit">{l s='Send' mod='productcomments'}</button>
                                <input class="btn btn-inverse" type="button" value="{l s='Cancel' mod='productcomments'}" onclick="$.fancybox.close();" />
                            </p>
                            <div class="clearfix"></div>
                        </div>
		</form><!-- /end new_comment_form_content -->
	</div>
</div>
<!-- End fancybox -->

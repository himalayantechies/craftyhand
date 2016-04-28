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

<!-- Horizontal Block Viewed products -->
<section class="crossselling page_product_box">
	<h4><span>{l s='Recently viewed products' mod='blockviewed'}</span></i></h4>
	<div class="block_content toggle_content">
		<ul class="products " style="display:inline-flex;">
			{foreach from=$productsViewedObj item=viewedProduct name=myLoop}
				<li class="shop_box  clearfix"  style="padding:0 7px 0 18px; text-align:left;">
					<a class="products_block_img " href="{$viewedProduct->product_link}" title="{l s='More about' mod='blockviewed'} {$viewedProduct->name|escape:html:'UTF-8'}"><img src="{$link->getImageLink($viewedProduct->link_rewrite, $viewedProduct->cover, 'small_default')}" alt="{$viewedProduct->legend|escape:html:'UTF-8'}" /></a>
					<div>
					<h5  style="line-height:10px;"><a class="product_link" href="{$viewedProduct->product_link}" title="{l s='More about' mod='blockviewed'} {$viewedProduct->name|escape:html:'UTF-8'}"><h8>{$viewedProduct->name|truncate:30:'...'|escape:html:'UTF-8'}</h8>
					<!--<h8>{$viewedProduct->name|truncate:25:'...'|escape:html:'UTF-8'}</h8>-->
					</a></h5>
					<!--<p class="product_descr"><h8>{$viewedProduct->description_short|strip_tags:'UTF-8'|truncate:75}</h8>	
					</p>-->
					<div style="padding-top:10px;"><span class="price price-new" style="font-size:12px;">{convertPrice price = $viewedProduct->price} </span></div>
					 </div> 
				</li>
			{/foreach}
		</ul>
	</div>
</section>

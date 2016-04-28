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

<!-- Block user information module HEADER -->
<section class="blockuserinfo header-box" style="right:139px;top:5px;">
		
		<span style="padding-right:0px;"><a href="{$link->getPageLink('my-account', true)}">My Account   <span style="color:grey;" class="slash">|</span></a></span>
		{if $logged}
			<a href="{$link->getPageLink('index', true, NULL, "mylogout")}" title="{l s='Log out' mod='blockuserinfo'}" class="logout" rel="tooltip" data-placement="bottom" data-original-title="first tooltip"><span><i class="icon-unlock"><span style="color:grey;margin-left:6px;"class="slash">|</span></i></span></a>
		{else}
		<i class="icon-lock-login">	<a href="{$link->getPageLink('my-account', true)}" title="{l s='Login' mod='blockuserinfo'}" class="login" rel="tooltip" data-placement="bottom" data-original-title="first tooltip" ><span class="sign" style="font-family:Arial;">Sign In</span> <span style="color:grey;" class="slash">|<span></i></span></a>
		{/if}
		<span style="padding-right:0px;"><a href="http://craftyhand.com/contact-us">Contact Us  <span style="color:grey;"class="slash"> |</span></a></span>
</section>

<section id="header_user" class="blockuserinfo-cart header-box">
		{if !$PS_CATALOG_MODE}
		<div id="shopping_cart">
        <a href="{$link->getPageLink($order_process, true)}" title="{l s='View my shopping cart' mod='blockuserinfo'}" rel="nofollow">
          <i class="opancart icon-caret-down"></i>
                <span class="shopping_cart_title">{l s='CART' mod='blockuserinfo'}</span>
                <span class="ajax_cart_quantity{if $cart_qties == 0} hidden{/if}">({$cart_qties})</span>
                <!--<span class="ajax_cart_product_txt{if $cart_qties != 1} hidden{/if}">{l s='Product' mod='blockuserinfo'}</span>
                <span class="ajax_cart_product_txt_s{if $cart_qties < 2} hidden{/if}">{l s='Products' mod='blockuserinfo'}</span>-->
				
				<span class="ajax_cart_product_txt{if $cart_qties != 1} hidden{/if}">{l s='' mod='blockuserinfo'}</span>
                <span class="ajax_cart_product_txt_s{if $cart_qties < 2} hidden{/if}">{l s='' mod='blockuserinfo'}</span>
				
				
                 {*<span class="price ajax_cart_total{if $cart_qties == 0} hidden{/if}">
				{if $cart_qties > 0}
					{if $priceDisplay == 1}
						{assign var='blockuser_cart_flag' value='Cart::BOTH_WITHOUT_SHIPPING'|constant}
						{convertPrice price=$cart->getOrderTotal(false, $blockuser_cart_flag)}
					{else}
						{assign var='blockuser_cart_flag' value='Cart::BOTH_WITHOUT_SHIPPING'|constant}
						{convertPrice price=$cart->getOrderTotal(true, $blockuser_cart_flag)}
					{/if}
				{/if}                  
                </span>*}
                <span class="ajax_cart_no_product{if $cart_qties > 0} hidden{/if}">{l s='(0)' mod='blockuserinfo'}</span>
            </a>
		</div>
		{/if}
		
</section>

		{if $logged}
		<div class="wishlist" style="float:right;margin:-36px 98px 0 0;">
			<a href="http://craftyhand.com/module/blockwishlist/mywishlist" id="wishlist_button" > {l s='Wishlist' mod='blockwishlist'}</a>
			</div>
		{/if}

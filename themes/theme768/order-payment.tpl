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

{if !$opc}
	<script type="text/javascript">
	// <![CDATA[
	var currencySign = '{$currencySign|html_entity_decode:2:"UTF-8"}';
	var currencyRate = '{$currencyRate|floatval}';
	var currencyFormat = '{$currencyFormat|intval}';
	var currencyBlank = '{$currencyBlank|intval}';
	var txtProduct = "{l s='product' js=1}";
	var txtProducts = "{l s='products' js=1}";
	// ]]>
	</script>

	{capture name=path}{l s='Your payment method'}{/capture}
	{include file="$tpl_dir./breadcrumb.tpl"}
{/if}



{if !$opc}
	{assign var='current_step' value='payment'}
	{include file="$tpl_dir./order-steps.tpl"}

	{include file="$tpl_dir./errors.tpl"}
{else}
	<div id="opc_payment_methods" class="opc-main-block">
		<div id="opc_payment_methods-overlay" class="opc-overlay" style="display: none;"></div>
{/if}

{if !$opc}<h1 style="font-size:24px; font-weight:normal;margin:23px 0 -12px;"><span>{l s='Please choose your payment method'}</span></h1>{else}<h2><span>3</span> {l s='Please choose your payment method'}</h2>{/if}

<!--<div class="paiement_block"> -->

<div class="payment-block" style="margin-top:46px !important;">

<!--<h1><span>How would you like to pay? </span></h1>-->

<div><span style="color:#585858;font-size:13px;font-weight:bold;">Please click one of the following payment options</span></div>

<p class="cart_navigation clearfix submit" style="margin:-98px 0 41px;">
		<input type="hidden" name="step" value="3" />
		<input type="hidden" name="back" value="{$back}" />
		{if !$is_guest}
			{if $back}
				<!--<a href="{$link->getPageLink('order', true, NULL, "step=1&back={$back}&multi-shipping={$multi_shipping}")}" title="{l s='Previous'}" class="button">&laquo; {l s=''}</a>-->
			{else}
				<!--<a href="{$link->getPageLink('order', true, NULL, "step=1&multi-shipping={$multi_shipping}")}" title="{l s='Previous'}" class="">&laquo; {l s=''}</a>-->
			{/if}
		{else}
				<!--<a href="{$link->getPageLink('order', true, NULL, "multi-shipping={$multi_shipping}")}" title="{l s='Previous'}" class="">&laquo; {l s='Previous'}</a>-->
		{/if}
		
			<a href="#" class="btn-success btn" style="float:right;font-size:13px;" id="processpayment">Proceed to Payment </a>
		
	</p>


<div id="HOOK_TOP_PAYMENT">{$HOOK_TOP_PAYMENT}</div>



{if $HOOK_PAYMENT}
	{if $opc}<div id="opc_payment_methods-content">{/if}
		<div id="HOOK_PAYMENT" style="background:#fafafa;">{$HOOK_PAYMENT}</div>
	{if $opc}</div>{/if}
{else}
	<p class="warning">{l s='No payment modules have been installed.'}</p>
{/if}

{if !$opc}
	<p class="cart_navigation clearfix"><a href="{$link->getPageLink('order', true, NULL, "step=2")}" title="{l s='Previous'}" class="">&laquo; {l s='Previous'}</a></p>
{else}
	</div>
{/if}

	<a href="#" class="btn-success btn" style="float:right;font-size:13px;margin:-48px 0 0;" id="processpayment">Proceed to Payment</a>
</div>

<script>
$('p.payment_module input[type=radio]').click(function() {
	if($(this).attr('id') == 'paypal_process_payment') {
		$('a#processpayment').attr('onclick', "$('#paypal_payment_form').submit();");
	} else {
		$('a#processpayment').removeAttr('onclick');
	}
	$('a#processpayment').attr('href', $(this).val());
	
	
});
$('p.payment_module input[type=radio]').trigger('click');
</script>



<!-- added later by ram to display order summary on RHS -->
</div> <!-- end of center column force addedby Ram -->
<aside id="right_column" class="span3 column">
	<section>
		<div style="font-weight:bold;">Need help?</div>
		<div style="padding-bottom:10px;padding-top:1px;"><h1 style="font-size:15px;">Call: 977 980 315 6056 </h1></div>
		<div> 
		{include file="./order-overview.tpl"} 
		</div>
	</section>
</aside>
<div> 
<!-- end of right side menu -->
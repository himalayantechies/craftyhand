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

{if $opc}
	{assign var="back_order_page" value="order-opc.php"}
{else}
	{assign var="back_order_page" value="order.php"}
	{*assign var="back_order_page" value=$link->getModuleLink('cheque','payment')*}
{/if}


{capture name=path}{l s='Check payment' mod='cheque'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}


{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}



{if isset($nbProducts) && $nbProducts <= 0}
	<p class="warning">{l s='Your shopping cart is empty.'}</p>
{else}
<div class="titled_box">
<!--<div class="cheque"  style="background:#f3f3f2; border:1px solid #dddad6; border-radius:3px; color:#5a5552; font-weight:bold; padding:3px 0 3px 12px; margin-top:5px;margin-bottom:5px;"><div class="cheque logo"> <img src="{$img_dir}/cheque2.png" alt="{l s='Check' mod='cheque'}" width="86" height="54"  /></div><span>{l s='Cheque payment' mod='cheque'}</span></div>-->

<form action="{$link->getModuleLink('cheque', 'validation', [], true)}" method="post">


<p class="cart_navigation1" style="margin:0px !important;">
		<input type="submit" name="submit" value="{l s='I confirm my order' mod='cheque'}" class="btn-success btn" style="float:right; margin-top:0px;font-size:13px;"/>
		<!--<a href="{$link->getPageLink('order', true, NULL, "step=3")}" class="button_large">{l s='Other payment methods' mod='cheque'}</a>-->
	</p>	
	
			


<h2 style="font-size:16px;padding:0 0 7px;"><span>{l s='Order summary' mod='cheque'}</span></h2>

<div class="box-payment-style">
		
        <img src="{$img_dir}/cheque2.png" alt="{l s='Check' mod='cheque'}" width="86" height="54"  />
		<div class="cheque" style="color:#5a5552; font-weight:bold;font-size:13px;margin-bottom:7px; "><span>{l s='Cheque payment' mod='cheque'}</span></div>
		<em style="color:#333333;font-style:normal;" >			{l s='You have chosen to pay by check.' mod='cheque'}
		{l s='Here is a short summary of your order:' mod='cheque'}</em><br />
		<!--<i class="icon-angle-right"></i> {l s='The total amount of your order comes to:' mod='cheque'}-->
		<!--<span id="amount" class="price">{displayPrice price=$total}</span>-->
		{if $use_taxes == 1}
			<!--{l s='(tax incl.)' mod='cheque'}-->
		{/if}
		<!--<i class="icon-angle-right"></i> {if isset($currencies) && $currencies|@count > 1}-->
		<!--	{l s='We accept several currencies to receive payments by check.' mod='cheque'}-->
		{l s='Choose one of the following:' mod='cheque'}
			<select style="width:20%;margin:0px !important;" id="currency_payement" name="currency_payement" onchange="setCurrency($('#currency_payement').val());">
			{foreach from=$currencies item=currency}
				<option style="border-right:solid 1px #cccccc;" value="{$currency.id_currency}" {if isset($currencies) && $currency.id_currency == $cust_currency}selected="selected"{/if}>{$currency.name}</option>
			{/foreach}
			</select>
		{else}
			<!--{l s='We allow the following currencies to be sent by check:' mod='cheque'}&nbsp;<b>{$currencies.0.name}</b><br />-->
			<input type="hidden" name="currency_payement" value="{$currencies.0.id_currency}" />
		{/if}
	<!--<i class="icon-angle-right"></i> {l s='Check owner and address information will be displayed on the next page.' mod='cheque'}<br />-->
		<!--<i class="icon-angle-right"></i> --><div class="confirm" style="margin:0 0 0 106px !important;">{l s='Please confirm your order by clicking \'Place my order\'' mod='cheque'}.</div>

				<!--<p class="cart_navigation1">
		<input type="submit" name="submit" value="{l s='I confirm my order' mod='cheque'}" class="btn-success btn" style="float:right; margin-top:-20px;"/>
		<!--<a href="{$link->getPageLink('order', true, NULL, "step=3")}" class="button_large">{l s='Other payment methods' mod='cheque'}</a>-->
<!--	</p>	-->
	
			
		
		</div>

{/if}
<!--<div class="clearfix">&nbsp;</div> -->
{if ((!empty($delivery_option) AND !isset($virtualCart)) OR $delivery->id OR $invoice->id) AND !$opc}
<div class="order_delivery row" >

	{if !isset($formattedAddresses) || (count($formattedAddresses.invoice) == 0 && count($formattedAddresses.delivery) == 0) || (count($formattedAddresses.invoice.formated) == 0 && count($formattedAddresses.delivery.formated) == 0)}
		{if $delivery->id}
		<ul id="delivery_address" class="address item">
			<li class="address_title">{l s='Shipping address'}</li>
			{if $delivery->company}<li class="address_company">{$delivery->company|escape:'htmlall':'UTF-8'}</li>{/if}
			<li class="address_name">{$delivery->firstname|escape:'htmlall':'UTF-8'} {$delivery->lastname|escape:'htmlall':'UTF-8'}</li>
			<li class="address_address1">{$delivery->address1|escape:'htmlall':'UTF-8'}</li>
			{if $delivery->address2}<li class="address_address2">{$delivery->address2|escape:'htmlall':'UTF-8'}</li>{/if}
			<li class="address_city">{$delivery->postcode|escape:'htmlall':'UTF-8'} {$delivery->city|escape:'htmlall':'UTF-8'}</li>
			<li class="address_country">{$delivery->country|escape:'htmlall':'UTF-8'} {if $delivery_state}({$delivery_state|escape:'htmlall':'UTF-8'}){/if}</li>
			<li>
			<a style="background:none; color:#003399; border:none; text-shadow:none;margin:0 0 0 -10px;" href="{$link->getPageLink('address', true, NULL, "id_address") }{$delivery->id}&amp;back={$back_order_page}?step=3{if $back}&mod={$back}{/if}" title="{l s='Change' js=1}">{l s='Change'}</a>
			</li>
		</ul>
		{/if}
		{if $invoice->id}
		<ul id="invoice_address" class="address alternate_item">
			<li class="address_title">{l s='Billing'}&nbsp;<span class="address_alias">({$invoice->alias})</span></li>
			{if $invoice->company}<li class="address_company">{$invoice->company|escape:'htmlall':'UTF-8'}</li>{/if}
			<li class="address_name">{$invoice->firstname|escape:'htmlall':'UTF-8'} {$invoice->lastname|escape:'htmlall':'UTF-8'}</li>
			<li class="address_address1">{$invoice->address1|escape:'htmlall':'UTF-8'}</li>
			{if $invoice->address2}<li class="address_address2">{$invoice->address2|escape:'htmlall':'UTF-8'}</li>{/if}
			<li class="address_city">{$invoice->postcode|escape:'htmlall':'UTF-8'} {$invoice->city|escape:'htmlall':'UTF-8'}</li>
			<li class="address_country">{$invoice->country|escape:'htmlall':'UTF-8'} {if $invoice_state}({$invoice_state|escape:'htmlall':'UTF-8'}){/if}</li>
			<li>
			<a style="background:none; color:#003399; border:none; text-shadow:none;margin:0 0 0 -10px;" href="{$link->getPageLink('address', true, NULL, "id_address") }{$invoice->id}&amp;back={$back_order_page}?step=3{if $back}&mod={$back}{/if}" title="{l s='Change' js=1}">{l s='Change'}</a>
			</li>
			
		</ul>
		{/if}
	{else}
		{foreach from=$formattedAddresses key=k item=address}
			<ul class="address {if $address@last}last_item{elseif $address@first}first_item{/if} {if $address@index % 2}alternate_item{else}item{/if}">
				<li class="address_title">{if $k eq 'invoice'}{l s='Billing'}{elseif $k eq 'delivery' && $delivery->id}{l s='Shipping address'}{/if}
				<!--
				{if isset($address.object.alias)}&nbsp;<span class="address_alias">({$address.object.alias})</span>{/if}
				-->
				</li>
				<!--{$k}
				{$delivery->id}
				{$invoice->id} -->
				{foreach $address.ordered as $pattern}
					{assign var=addressKey value=" "|explode:$pattern}
					<li>
                    {foreach $addressKey as $key}   
						<span class="{if isset($addresses_style[$key])}{$addresses_style[$key]}{/if}">
							{if isset($address.formated[$key])}
								{$address.formated[$key]|escape:'htmlall':'UTF-8'}
							{/if}
						</span>
					{/foreach}
					</li>
					
				{/foreach}
				{if $k=='delivery'}
					<li>
					<a style="background:none; color:#003399; border:none; text-shadow:none;margin:0 0 0 0px;" href="{$link->getPageLink('address', true, NULL, "id_address") }{$delivery->id}&amp;back={$back_order_page}?step=3{if $back}&mod={$back}{/if}" title="{l s='Change Shipping Address' js=1}">{l s='Change'}</a>
				</li>
				{/if}
				{if $k=='invoice'}
					<li>
					<a style="background:none; color:#003399; border:none; text-shadow:none;margin:0 0 0 0px;" href="{$link->getPageLink('address', true, NULL, "id_address") }{$invoice->id}&amp;back={$back_order_page}?step=3{if $back}&mod={$back}{/if}" title="{l s='Change Billing Address' js=1}">{l s='Change'}</a>
				</li>
				{/if}
				{*$link->getModuleLink('cheque','payment')*}
				</ul>
		{/foreach}
		
            <div class="clearblock"></div>
	{/if}
</div>
{/if}
<div class="carrier" style="color:#619A0C; font-size:17px;">Shipping method</div>
<p>Carrier: <img src="{$carrier_logo}" /> {$carrier_name} <br/>Delivery days: {$shipping_day}</p>
</div>

<p class="cart_navigation">
		<input type="submit" name="submit" value="{l s='I confirm my order' mod='cheque'}" class="btn-success btn" style="float:right;margin:-9px 0 0 0; font-size:13px;"/>
		<a href="{$link->getPageLink('order', true, NULL, "step=3")}" class="">{l s='Other payment methods' mod='cheque'}</a>
	</p>
</form>
<!-- added later by ram to display order summary on RHS -->
</div> <!-- end of titled_box -->
</div> <!-- force closing center column -->
<aside id="right_column" class="span3 column">
	<section>
		<div style="font-weight:bold;">Need help?</div>
		<div style="padding-top:1px; margin:0 0 17px !important;"><h1 style="font-size:15px;">Call: 977 980 315 6056 </h1></div>
		<div> 
		{include file="$tpl_dir./order-overview.tpl"} 
		</div>
	</section>
</aside>	
<div>
<!-- end of right side menu -->
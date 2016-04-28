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
// <![CDATA[
var idSelectedCountry = {if isset($smarty.post.id_state)}{$smarty.post.id_state|intval}{else}{if isset($address->id_state)}{$address->id_state|intval}{else}false{/if}{/if};
var countries = new Array();
var countriesNeedIDNumber = new Array();
var countriesNeedZipCode = new Array();
{foreach from=$countries item='country'}
	{if isset($country.states) && $country.contains_states}
		countries[{$country.id_country|intval}] = new Array();
		{foreach from=$country.states item='state' name='states'}
			countries[{$country.id_country|intval}].push({ldelim}'id' : '{$state.id_state}', 'name' : '{$state.name|addslashes}'{rdelim});
		{/foreach}
	{/if}
	{if $country.need_identification_number}
		countriesNeedIDNumber.push({$country.id_country|intval});
	{/if}
	{if isset($country.need_zip_code)}
		countriesNeedZipCode[{$country.id_country|intval}] = {$country.need_zip_code};
	{/if}
{/foreach}
$(function(){ldelim}
	$('.id_state option[value={if isset($smarty.post.id_state)}{$smarty.post.id_state|intval}{else}{if isset($address->id_state)}{$address->id_state|intval}{/if}{/if}]').attr('selected', true);
{rdelim});
{literal}
	$(document).ready(function() {
		$('#company').blur(function(){
			vat_number();
		});
		vat_number();
		function vat_number()
		{
			if ($('#company').val() != '')
				$('#vat_number').show();
			else
				$('#vat_number').hide();
		}
	});
{/literal}
//]]>
</script>

{capture name=path}{l s='Your addresses'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}
	<aside id="left_column" class="span2 column">
		
	</aside>
<h1><span style="font-size:18px;font-weight:normal;">{l s='Please update the shipping addresses'}</span></h1>
<!--<div class="titled_box">
<h2>
<span>
{if isset($id_address) && (isset($smarty.post.alias) || isset($address->alias))}
	{l s='Modify address'} 
	{if isset($smarty.post.alias)}
		"{$smarty.post.alias}"
	{else}
		{if isset($address->alias)}"{$address->alias}"{/if}
	{/if}
{else}
	{l s='To add a new address, please fill out the form below.'}
{/if}
</span> 
</h2>
</div>-->
{include file="$tpl_dir./errors.tpl"}

<p class="required" style="padding:10px 0 10px 0; margin:0;"><sup>*</sup> {l s='Indicates required field'}</p>

<form action="{$link->getPageLink('address', true)}" method="post" class="std titled_box" id="add_address">
	<fieldset>
		<!--<h2><span>{if isset($id_address)}{l s='Your address'}{else}{l s='New address'}{/if}</span></h2>-->
        
        <div class="row-fluid">
        <!-- <div class="span6"> original -->
		<div class="customspan"> 
		<!--
		<div class="customspan">
			<div class="customlabel">
				<label for="dni">{l s='Identification number'} <sup>*</sup></label>
			</div>
			<div class="customInput  required text dni">
				<input type="text" class="text" name="dni" id="dni" value="{if isset($smarty.post.dni)}{$smarty.post.dni}{else}{if isset($address->dni)}{$address->dni}{/if}{/if}" />
			<span class="form_info">{l s='DNI / NIF / NIE'}</span>
			</div>
		</div>
		-->
		<!--<p class="required text dni">
			<label for="dni">{l s='Identification number'} <sup>*</sup></label>
			<input type="text" class="text" name="dni" id="dni" value="{if isset($smarty.post.dni)}{$smarty.post.dni}{else}{if isset($address->dni)}{$address->dni}{/if}{/if}" />
			<span class="form_info">{l s='DNI / NIF / NIE'}</span>
		</p>-->
        	{assign var="stateExist" value="false"}
	{foreach from=$ordered_adr_fields item=field_name}
		
		{if $field_name eq 'company'}
		
			<div class="customlabel">
				<input type="hidden" name="token" value="{$token}" />
				<label for="company">{l s=' Company:'}</label>
			</div>
			<div class="customInput text">
				<input type="text" id="company" size="20" name="company" placeholder="Leave blank if this is a residence." value="{if isset($smarty.post.company)}{$smarty.post.company}{else}{if isset($address->company)}{$address->company}{/if}{/if}" /> 
			</div>
			<!--
			<p class="text">
			<input type="hidden" name="token" value="{$token}" />
			<label for="company">{l s='Company'}</label>
			<input type="text" id="company" name="company" value="{if isset($smarty.post.company)}{$smarty.post.company}{else}{if isset($address->company)}{$address->company}{/if}{/if}" />
		</p> -->
        {/if} 
		{if $field_name eq 'vat_number'}
			<!--<div id="vat_area">
				<div id="vat_number">
					<p class="text">
						<label for="vat_number">{l s='VAT number'}</label>
						<input type="text" class="text" name="vat_number" value="{if isset($smarty.post.vat_number)}{$smarty.post.vat_number}{else}{if isset($address->vat_number)}{$address->vat_number}{/if}{/if}" />
					</p>
				</div>
			</div>-->
		{/if}
		{if $field_name eq 'firstname'}
			<div class="customlabel">
				<label for="firstname"> <sup>*</sup> {l s='Full Name:'} </label>
			</div>
			<div class="customInput required text">
				<input type="text" name="firstname" id="firstname" value="{if isset($smarty.post.firstname)}{$smarty.post.firstname}{else}{if isset($address->firstname)}{$address->firstname}{/if}{/if}" />
			</div>
		
		<!--<p class="required text">
			<label for="firstname">{l s='First name'} <sup>*</sup></label>
			<input type="text" name="firstname" id="firstname" value="{if isset($smarty.post.firstname)}{$smarty.post.firstname}{else}{if isset($address->firstname)}{$address->firstname}{/if}{/if}" />
		</p>-->
		{/if}        
		{if $field_name eq 'lastname'}
		<div style="display:none;">
			<div class="customlabel">
				<label for="lastname"><sup>*</sup> {l s='Last name:'}</label>
			</div>
			<div class="customInput required text">
				<input type="text" id="lastname" name="lastname" value="{if isset($smarty.post.lastname)}{$smarty.post.lastname}{else}{if isset($address->lastname)}{$address->lastname}{/if}{/if}" />
			</div>
		</div>
		<!--<p class="required text">
			<label for="lastname">{l s='Last name'} <sup>*</sup></label>
			<input type="text" id="lastname" name="lastname" value="{if isset($smarty.post.lastname)}{$smarty.post.lastname}{else}{if isset($address->lastname)}{$address->lastname}{/if}{/if}" />
		</p> -->
		{/if}
		{if $field_name eq 'address1'}
			<div class="customlabel">
				<label for="address1"><sup>*</sup> {l s='Address:'} </label>
			</div>
			<div class="customInput required text">
				<input type="text" id="address1" name="address1" value="{if isset($smarty.post.address1)}{$smarty.post.address1}{else}{if isset($address->address1)}{$address->address1}{/if}{/if}" />
			</div>
		<!--
		<p class="required text">
			<label for="address1">{l s='Address'} <sup>*</sup></label>
			<input type="text" id="address1" name="address1" value="{if isset($smarty.post.address1)}{$smarty.post.address1}{else}{if isset($address->address1)}{$address->address1}{/if}{/if}" />
		</p> -->
		{/if}
		{if $field_name eq 'address2'}
			<div class="customlabel">
				<label for="address2">{l s='Address (Line 2):'}</label>
			</div>
			<div class="customInput text">
				<input type="text" id="address2" name="address2" value="{if isset($smarty.post.address2)}{$smarty.post.address2}{else}{if isset($address->address2)}{$address->address2}{/if}{/if}" />
			</div>
		<!--
		<p class="required text">
			<label for="address2">{l s='Address (Line 2)'}</label>
			<input type="text" id="address2" name="address2" value="{if isset($smarty.post.address2)}{$smarty.post.address2}{else}{if isset($address->address2)}{$address->address2}{/if}{/if}" />
		</p>-->
		{/if}  
		{if $field_name eq 'postcode'}
		
			<div class="customlabel">
			<label for="postcode"><sup>*</sup> {l s='Zip / Postal Code:'} </label>
			</div>
			<div class="customInput required postcode">
				<input type="tel" id="postcode" name="postcode" value="{if isset($smarty.post.postcode)}{$smarty.post.postcode}{else}{if isset($address->postcode)}{$address->postcode}{/if}{/if}" onkeyup="$('#postcode').val($('#postcode').val().toUpperCase());" />
			</div>
		<!--<p class="required postcode text">
			<label for="postcode">{l s='Zip / Postal Code'} <sup>*</sup></label>
			<input type="tel" id="postcode" name="postcode" value="{if isset($smarty.post.postcode)}{$smarty.post.postcode}{else}{if isset($address->postcode)}{$address->postcode}{/if}{/if}" onkeyup="$('#postcode').val($('#postcode').val().toUpperCase());" />
		</p>-->
		{/if}
		{if $field_name eq 'city'}
			<div class="customlabel">
				<label for="city"><sup>*</sup>&nbsp;{l s='City:'} </label>
			</div>
			<div class="customInput required text">
				<input type="text" name="city" id="city" value="{if isset($smarty.post.city)}{$smarty.post.city}{else}{if isset($address->city)}{$address->city}{/if}{/if}" maxlength="64" />
			</div>
		<!--<p class="required text">
			<label for="city">{l s='City'} <sup>*</sup></label>
			<input type="text" name="city" id="city" value="{if isset($smarty.post.city)}{$smarty.post.city}{else}{if isset($address->city)}{$address->city}{/if}{/if}" maxlength="64" />
		</p>-->
		{*
			if customer hasn't update his layout address, country has to be verified
			but it's deprecated
		*}
		{/if}
		{if $field_name eq 'Country:name' || $field_name eq 'country'}
		<!--<div class="customspan  required select" style="min-height:40px;"> -->
			<div class="customlabel">
			<label for="id_country"><sup>*</sup> {l s='Country:'} </label>
			</div>
			<div class="customInput required select" style="min-height:40px;">
				<select id="id_country" name="id_country">{$countries_list}</select>
			</div>
		<!--</div> -->
		<!--<p class="required select">
			<label for="id_country">{l s='Country'} <sup>*</sup></label>
			<select id="id_country" name="id_country">{$countries_list}</select>
		</p>-->
		{if $vatnumber_ajax_call}
		<script type="text/javascript">
		var ajaxurl = '{$ajaxurl}';
		{literal}
				$(document).ready(function(){
					$('#id_country').change(function() {
						$.ajax({
							type: "GET",
							url: ajaxurl+"vatnumber/ajax.php?id_country="+$('#id_country').val(),
							success: function(isApplicable){
								if(isApplicable == "1")
								{
									$('#vat_area').show();
									$('#vat_number').show();
								}
								else
								{
									$('#vat_area').hide();
								}
							}
						});
					});
				});
		{/literal}
		</script>
		{/if}
		{/if}        
		{if $field_name eq 'State:name'}
		{assign var="stateExist" value="true"}
		<!--<div class="customspan required id_state select"> -->
			<div class="customlabel">
			<label for="id_state"><sup>*</sup> {l s='State:'} </label>
			</div>
			<div class="customInput required id_state select">
				<select name="id_state" id="id_state">
				<option value="">-</option>
			</select>
			</div>
		<!--</div> -->
		<!--<p class="required id_state select">
			<label for="id_state">{l s='State'} <sup>*</sup></label>
			<select name="id_state" id="id_state">
				<option value="">-</option>
			</select>
		</p>-->
		{/if}
		{/foreach}
         <!--</div> --> <!-- end of span6 -->
           <!--<div class="span6"> -->
		 <!--<div class="customspan"> -->
		{if $stateExist eq "false"}
			<div class="customlabel required id_state select">
				<label for="id_state"><sup>*</sup> {l s='State:'}</label>
			</div>
			<div class="customInput required id_state select" style="min-height:40px;">
				<select name="id_state" id="id_state">
					<option value="">-</option>
				</select>
			</div>
		<!--
		<p class="required id_state select">
			<label for="id_state">{l s='State'} <sup>*</sup></label>
			<select name="id_state" id="id_state">
				<option value="">-</option>
			</select>
		</p>-->
		{/if}  
		
			<div class="customlabel required text dni">
				<label for="dni">{l s='Identification number'} <sup>*</sup></label>
			</div>
			<div class="customInput required text dni">
				<input type="text" class="text" name="dni" id="dni" value="{if isset($smarty.post.dni)}{$smarty.post.dni}{else}{if isset($address->dni)}{$address->dni}{/if}{/if}" />
			<span class="form_info">{l s='DNI / NIF / NIE'}</span>
			</div>
			<!--
			<div class="customlabel">
				<label for="other">{l s='Additional information:'}</label>
			</div>
			<div class="customInput textarea">
				<textarea id="other" name="other" cols="26" rows="3">{if isset($smarty.post.other)}{$smarty.post.other}{else}{if isset($address->other)}{$address->other}{/if}{/if}</textarea>
			</div>
			-->
		<!--
		<p class="textarea">
			<label for="other">{l s='Additional information'}</label>
			<textarea id="other" name="other" cols="26" rows="3">{if isset($smarty.post.other)}{$smarty.post.other}{else}{if isset($address->other)}{$address->other}{/if}{/if}</textarea>
		</p> -->
		{if isset($one_phone_at_least) && $one_phone_at_least}
		<!--<div class="customspan inline-infos required">
			{l s='Please supply at least one  phone number so we can call if there are any problems using this address.'}
		</div>	-->
		<div class="customlabel" style="font-color:green;">
				<label for="phone">{l s='Important:'}</label>
			</div>
			<div style="font-weight:bold;font-size:11px;">
				{l s='Please supply at least one  phone number so we can call if there are any problems using this address.'}
			</div>
		{/if}
		
			<div class="customlabel">
				<label for="phone">{l s='Home phone:'}</label>
			</div>
			<div class="customInput">
				<input type="tel" id="phone" name="phone" value="{if isset($smarty.post.phone)}{$smarty.post.phone}{else}{if isset($address->phone)}{$address->phone}{/if}{/if}" />
			</div>
		
		<!--
		<p class="text">
			<label for="phone">{l s='Home phone'}</label>
			<input type="tel" id="phone" name="phone" value="{if isset($smarty.post.phone)}{$smarty.post.phone}{else}{if isset($address->phone)}{$address->phone}{/if}{/if}" />
		</p>-->
		
			<div class="customlabel"  class="{if isset($one_phone_at_least) && $one_phone_at_least}required {/if}text">
				<label for="phone_mobile"> <sup>*</sup> {l s='Mobile phone:'}{if isset($one_phone_at_least) && $one_phone_at_least}{/if}</label>
			</div>
			<div class="customInput" class="{if isset($one_phone_at_least) && $one_phone_at_least}required {/if}text">
				<input type="tel" id="phone_mobile" name="phone_mobile" value="{if isset($smarty.post.phone_mobile)}{$smarty.post.phone_mobile}{else}{if isset($address->phone_mobile)}{$address->phone_mobile}{/if}{/if}" />
			</div>
		
		<!--
		<p class="{if isset($one_phone_at_least) && $one_phone_at_least}required {/if}text">
			<label for="phone_mobile">{l s='Mobile phone'}{if isset($one_phone_at_least) && $one_phone_at_least} <sup>*</sup>{/if}</label>
			<input type="tel" id="phone_mobile" name="phone_mobile" value="{if isset($smarty.post.phone_mobile)}{$smarty.post.phone_mobile}{else}{if isset($address->phone_mobile)}{$address->phone_mobile}{/if}{/if}" />
		</p> -->
		
			<div class="customlabel">
				<label for="alias"><sup>*</sup> {l s='Address title for future reference:'}</label>
			</div>
			<div class="customInput required text">
				<input type="text" id="alias" name="alias" value="{if isset($smarty.post.alias)}{$smarty.post.alias}{else if isset($address->alias)}{$address->alias}{elseif !$select_address}{l s='My address'}{/if}" />
			</div>
		<!--
		<p class="required text" id="adress_alias">
			<label for="alias">{l s='Please assign an address title for future reference.'} <sup>*</sup></label>
			<input type="text" id="alias" name="alias" value="{if isset($smarty.post.alias)}{$smarty.post.alias}{else if isset($address->alias)}{$address->alias}{elseif !$select_address}{l s='My address'}{/if}" />
		</p>-->
        </div>    
		
		</div>
	</fieldset>
	<p class="submit2">
		{if isset($id_address)}<input type="hidden" name="id_address" value="{$id_address|intval}" />{/if}
		{if isset($back)}<input type="hidden" name="back" value="{$back}" />{/if}
		{if isset($mod)}<input type="hidden" name="mod" value="{$mod}" />{/if}
		{if isset($select_address)}<input type="hidden" name="select_address" value="{$select_address|intval}" />{/if}
		<input style="float:right;margin:0 174px 0 0;" type="submit" name="submitAddress" id="submitAddress" value="{l s='Save'}" class="btn btn-success save" />
	</p>
</form>

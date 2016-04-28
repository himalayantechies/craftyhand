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

<!-- Block currencies module -->
<!--
<section id="currencies_block_top" class="header-box header-button">
<form id="setCurrency" action="{$request_uri}" method="post">

		{*<label>	{l s='Currency' mod='blockcurrencies'}</label>*}
		<p  class="inner-carrencies icon_wrapp">
		<span>Currency</span>
        <input type="hidden" name="id_currency" id="id_currency" value=""/>
		<input type="hidden" name="SubmitCurrency" value="" />
        {$blockcurrencies_sign}
        <i class="arrow_header_top icon-caret-down"></i>    
		</p>
		<ul id="first-currencies" class="currencies_ul list_header">
			{foreach from=$currencies key=k item=f_currency}
				<li {if $cookie->id_currency == $f_currency.id_currency}class="selected"{/if}>
                {if $cookie->id_currency == $f_currency.id_currency}
							
                            <span>{$f_currency.sign} </span>{$f_currency.name}
                {else}
					<a href="javascript:setCurrency({$f_currency.id_currency});" title="{$f_currency.name}"><span>{$f_currency.sign}</span>{$f_currency.name}</a>
                    
        
                    
                    			
                    {/if}
				</li>
			{/foreach}
		</ul>
	</form>
</section>

-->
<!-- Block currencies module -->
<section id="currencies_block_top" >
<div id="currencies_block_top2">
	
    <form id="setCurrency" action="{$request_uri}" method="post">
            <input type="hidden" name="id_currency" id="id_currency" value=""/>
            <input type="hidden" name="SubmitCurrency" value="" />
        <ul>
			<li  style="display:inline-block; margin-right:5px;font-weight:normal;border:0px;">Currency</li>
			{foreach from=$currencies key=k item=f_currency}
                <li {if $cookie->id_currency == $f_currency.id_currency}class="selected"{/if} style="display:inline-block; margin-right:5px;">
                    <a href="javascript:setCurrency({$f_currency.id_currency});" title="{$f_currency.name}" rel="nofollow">{$f_currency.sign}</a>
                </li>
            {/foreach}
        </ul>
    </form>
</div>
</section>
<!-- /Block currencies module -->

<!-- /Block currencies module -->
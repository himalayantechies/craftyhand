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

<p class="payment_module">
	<!--<a href="{$link->getModuleLink('cheque', 'payment', [], true)}" title="{l s='Pay by cheque' mod='cheque'}">-->
	<a  title="{l s='Pay by cheque' mod='cheque'}">
		<input class="delivery_option_radio" name="payment_module" checked="checked" type="radio"  value="{$link->getModuleLink('cheque', 'payment', [], true)}" />
		<!--<img src="{$img_dir}/cheque.jpg" alt="{l s='Pay by check.' mod='cheque'}" width="86" height="54" />-->
		<img src="{$img_dir}/cheque2.png" alt="{l s='Pay by check.' mod='cheque'}" width="86" height="54" />
		{l s='Pay by check </br><process>Order processing will take more time</process>' mod='cheque'}
	</a>
</p>

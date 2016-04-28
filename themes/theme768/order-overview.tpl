<table class="order-overview-container">
		<tr><td colspan="2"><span class="order-overview-title">Order Overview</span></td></tr>
		{foreach $products as $product}
			{assign var='productId' value=$product.id_product}
			{assign var='productAttributeId' value=$product.id_product_attribute}
			{assign var='quantityDisplayed' value=0}
			{assign var='odd' value=$product@iteration%2}
			{assign var='ignoreProductLast' value=isset($customizedDatas.$productId.$productAttributeId) || count($gift_products)}
			{* Display the product line *}
			{include file="$tpl_dir./order-overview-shopping-cart-product-line.tpl" productLast=$product@last productFirst=$product@first}
			{* Then the customized datas ones*}
			{if isset($customizedDatas.$productId.$productAttributeId)}
				{foreach $customizedDatas.$productId.$productAttributeId[$product.id_address_delivery] as $id_customization=>$customization}
					<tr id="product_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}" class="bordercolor product_customization_for_{$product.id_product}_{$product.id_product_attribute}_{$product.id_address_delivery|intval} {if $odd}odd{else}even{/if} customization alternate_item {if $product@last && $customization@last && !count($gift_products)}last_item{/if}">
						<td >
							{foreach $customization.datas as $type => $custom_data}
								{if $type == $CUSTOMIZE_FILE}
									<div class="customizationUploaded">
										<ul class="customizationUploaded">
											{foreach $custom_data as $picture}
												<li><img src="{$pic_dir}{$picture.value}_small" alt="" class="customizationUploaded" /></li>
											{/foreach}
										</ul>
									</div>
								{elseif $type == $CUSTOMIZE_TEXTFIELD}
									<ul class="typedText">
										{foreach $custom_data as $textField}
											<li>
												{if $textField.name}
													{$textField.name}
												{else}
													{l s='Text #'}{$textField@index+1}
												{/if}
												{l s=':'} {$textField.value}
											</li>
										{/foreach}
										
									</ul>
								{/if}

							{/foreach}
						</td>
						<td class="cart_quantity">
							{if isset($cannotModify) AND $cannotModify == 1}
								<span style="float:left">{if $quantityDisplayed == 0 AND isset($customizedDatas.$productId.$productAttributeId)}{$customizedDatas.$productId.$productAttributeId|@count}{else}{$product.cart_quantity-$quantityDisplayed}{/if}</span>
							{else}
								<div id="cart_quantity_button" class="cart_quantity_button" style="float:left">
																{if $product.minimal_quantity < ($customization.quantity -$quantityDisplayed) OR $product.minimal_quantity <= 1}
								<a rel="nofollow" class="cart_quantity_down" id="cart_quantity_down_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}" href="{$link->getPageLink('cart', true, NULL, "add&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_address_delivery={$product.id_address_delivery}&amp;id_customization={$id_customization}&amp;op=down&amp;token={$token_cart}")}" title="{l s='Subtract'}">
									<img src="{$img_dir}icon/quantity_down.gif" alt="{l s='Subtract'}" width="23" height="24" />
								</a>
								{else}
								<a class="cart_quantity_down"  id="cart_quantity_down_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}" href="#" title="{l s='Subtract'}">
									<img src="{$img_dir}icon/quantity_down.gif" alt="{l s='Subtract'}" width="23" height="24" />
								</a>
								{/if}
                                <input type="hidden" value="{$customization.quantity}" name="quantity_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_hidden"/>
								<input size="2" type="text" value="{$customization.quantity}" class="cart_quantity_input" name="quantity_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}"/>
                                <a rel="nofollow" class="cart_quantity_up" id="cart_quantity_up_{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}" href="{$link->getPageLink('cart', true, NULL, "add&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_address_delivery={$product.id_address_delivery}&amp;id_customization={$id_customization}&amp;token={$token_cart}")}" title="{l s='Add'}"><img src="{$img_dir}icon/quantity_up.gif" alt="{l s='Add'}" width="23" height="24" /></a>

								</div>
						
							{/if}
                            				{if isset($cannotModify) AND $cannotModify == 1}
							{else}
								<div class="div_cart_quantity_delete">
									<a rel="nofollow" class="cart_quantity_delete" id="{$product.id_product}_{$product.id_product_attribute}_{$id_customization}_{$product.id_address_delivery|intval}" href="{$link->getPageLink('cart', true, NULL, "delete&amp;id_product={$product.id_product|intval}&amp;ipa={$product.id_product_attribute|intval}&amp;id_customization={$id_customization}&amp;id_address_delivery={$product.id_address_delivery}&amp;token={$token_cart}")}"><i class="icon-trash"></i></a>
								</div> 
							{/if}
						</td>
					
					</tr>
					{assign var='quantityDisplayed' value=$quantityDisplayed+$customization.quantity}
				{/foreach}
				{* If it exists also some uncustomized products *}
				{if $product.quantity-$quantityDisplayed > 0}{include file="./shopping-cart-product-line.tpl" productLast=$product@last productFirst=$product@first}{/if}
			{/if}
		{/foreach}
		{assign var='last_was_odd' value=$product@iteration%2}
		{foreach $gift_products as $product}
			{assign var='productId' value=$product.id_product}
			{assign var='productAttributeId' value=$product.id_product_attribute}
			{assign var='quantityDisplayed' value=0}
			{assign var='odd' value=($product@iteration+$last_was_odd)%2}
			{assign var='ignoreProductLast' value=isset($customizedDatas.$productId.$productAttributeId)}
			{assign var='cannotModify' value=1}
			{* Display the gift product line *}
			{include file="./shopping-cart-product-line.tpl" productLast=$product@last productFirst=$product@first}
		{/foreach}
		<tr><td colspan="2">
		<table width="100%">
		{if $use_taxes}
			{if $priceDisplay}
				<tr >
				<td width="60%">{if $display_tax_label}{l s='Subtotal'}{else}{l s='Subtotal'}{/if}</td>
				<td id="total_product" style="float:right;">{displayPrice price=$total_products}</td>
						
				</tr>
			{else}
				<tr >
					<td width="60%">{if $display_tax_label}{l s='Subtotal'}{else}{l s='Subtotal'}{/if}</td>
					<td id="total_product"  style="float:right;">{displayPrice price=$total_products_wt}</td>
				</tr>
			{/if}
		{else}
			<tr>
				<td width="60%">{l s='Subtotal'}</td>
				<td id="total_product"  style="float:right;">{displayPrice price=$total_products}</td>
			</tr>
		{/if}
		
		<tr {if $total_wrapping == 0} style="display: none;"{/if}>
			<td >
			{if $use_taxes}
				{if $display_tax_label}{l s='Total gift wrapping (tax incl.):'}{else}{l s='Total gift-wrapping cost:'}{/if}
			{else}
				{l s='Total gift-wrapping cost:'}
			{/if}
			</td>
			<td id="total_discount">
			{if $use_taxes && !$priceDisplay}
				{assign var='total_discounts_negative' value=$total_discounts * -1}
			{else}
				{assign var='total_discounts_negative' value=$total_discounts_tax_exc * -1}
			{/if}
			{displayPrice price=$total_discounts_negative}
			</td>
		</tr>

		<tr  {if $total_wrapping == 0}style="display: none;"{/if}>
				<td class="order-summary-label">
				{if $use_taxes}
					{if $display_tax_label}{l s='Total gift-wrapping (tax incl.):'}{else}{l s='Total gift-wrapping:'}{/if}
				{else}
					{l s='Total gift-wrapping:'}
				{/if}
				</td>
				<td class="order-summary-price" id="total_wrapping">
                {if $use_taxes}
					{if $priceDisplay}
						{displayPrice price=$total_wrapping_tax_exc}
					{else}
						{displayPrice price=$total_wrapping}
					{/if}
				{else}
					{displayPrice price=$total_wrapping_tax_exc}
				{/if}
				</td>
			</tr>
		
		{if $total_shipping_tax_exc <= 0 && !isset($virtualCart)}
				<tr class="cart_total_delivery" style="{if !isset($carrier->id) || is_null($carrier->id)}display:none;{/if}">
					<td class="order-summary-label">{l s='Shipping'}</td>
					<td class="order-summary-price" id="total_shipping"  style="float:right;">{l s='Free Shipping!'}</td>
				</tr>
		{else}
			{if $use_taxes}
				{if $priceDisplay}
					<tr {if $total_shipping_tax_exc <= 0} style="display:none;"{/if}>
						<td class="order-summary-label">{if $display_tax_label}{l s='Shipping'}{else}{l s='Shipping'}{/if}</td>
						<td class="order-summary-price" id="total_shipping"  style="float:right;">{displayPrice price=$total_shipping_tax_exc}</td>
					</tr>
				{else}
					<tr {if $total_shipping <= 0} style="display:none;"{/if}>
						<td class="order-summary-label">{if $display_tax_label}{l s='Shipping'}{else}{l s='Total shipping'}{/if}</td>
						<td class="order-summary-price" id="total_shipping"   style="float:right;">{displayPrice price=$total_shipping}</td>
					</tr>
				{/if}
			{else}
				<tr {if $total_shipping_tax_exc <= 0} style="display:none;"{/if}>
					<td class="order-summary-label">{l s='Shipping'}</td>
					<td class="order-summary-price" id="total_shipping"  style="float:right;">{displayPrice price=$total_shipping_tax_exc}</td>
				</tr>
			{/if}
		{/if}
		{if $total_tax>0}
		<tr >
			<td class="order-summary-label">{l s='Total (tax excl.)'}</td>
			<td class="order-summary-price" id="total_price_without_tax">
			{displayPrice price=$total_price_without_tax}
			</td>
		</tr>
		<tr >
			<td class="order-summary-label">{l s='Total tax'}</td>
			<td class="order-summary-price" id="total_tax">{displayPrice price=$total_tax}</td>
		</tr>
		{/if}	
		<tr >
				{if $use_taxes}
				<td  id="total_price_container" style="color:#b22804; font-weight:bold;">
				{l s=' Order Total'}
                </td>	
				<td id="total_price" style="color:#b22804;float:right">	
				{displayPrice price=$total_price}
                </td>
				</td>
				{else}
				<td  class="total_price_container" id="total_price_container" >
                {l s='Total'}
				</td>	
				<td class="price">
                {displayPrice price=$total_price_without_tax}
                </td>
				</td>
				{/if}
			</tr>
		
		</table>
		
		</td></tr>
		
		</table>
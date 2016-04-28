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

		{if !$content_only} <!-- and $page_name !='order' added by Ram later to display order summary on right hand side -->
				</div>  <!-- end of center_column -->
		
<!-- testing closing div added or not 	
		{if !$content_only}		
				<br>center closing div added
		{/if}		
end of testing -->			

<!-- Right -->
<!--
{if isset($HOOK_RIGHT_COLUMN) && (str_replace(" ","",$HOOK_RIGHT_COLUMN)) !=''}{assign var='RightColumn' value=3}{/if}
	{if isset($RightColumn) && $RightColumn !=0}
	<aside id="right_column"  class="span3 column right_home">   
				  {$HOOK_RIGHT_COLUMN}
	</aside>
	{/if}
-->	
</div>  <!-- end of loader_page -->  
	</div> <!-- end of row -->  
    	</div>  <!-- end of id=columns -->  
<div class="footer-bg-mob">
    <footer class="container ">
       <div class="row modules">
           {$HOOK_FOOTER}
      </div>
    </footer> 
</div>        <!-- end of footer-bg-mob -->  
	</div><!-- end of wrapp_2 -->
		</div> <!-- end of wrapp -->
  {/if}
</body>
</html>

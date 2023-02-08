{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *}

{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}

{if $requestedPage == 'index'}
	{assign var=additionalFooterContent value=$currentContext->getLocalizedData("additionalHomeContent")}
{else}
    {assign var=additionalFooterContent value=$activeTheme->getOption("additionalFooterInfo")}
{/if}
<div class="container {if $sidebarCode || $additionalFooterContent}border-top {/if}mt-5 px-4 pb-4">
	{if $sidebarCode || $additionalFooterContent}
		<div class="row mt-4 footer-additional-content">
			{if $sidebarCode}
				<div class="{if $additionalFooterContent}col-md-6{else}col-12{/if}">
					{$sidebarCode}
				</div>
			{/if}
			{if $additionalFooterContent}
				<div class="{if $sidebarCode}col-md-6 border-start ps-md-5{else}col-12{/if}">
					{$additionalFooterContent|strip_unsafe_html}
				</div>
			{/if}
		</div>
	{/if}
</div>
</section>

<section class="footer container-fluid">
	<div class="container py-3">
		<div class="row">
			<div class="col-12">
          		{if $pageFooter}
					{$pageFooter}
				{/if}
			</div>
			<div class="col-12 text-md-end text-center" role="complementary">
				<a href="{url page="about" op="aboutThisPublishingSystem"}">
					<img
						class="pkp-brand-footer"
						alt="{translate key="about.aboutThisPublishingSystem"}"
						src="{$baseUrl}/{$brandImage}"
					>
				</a>
			</div>
		</div>
	</div>
	<div class="row bottom-bar py-3"></div>
</section>

{load_script context="frontend"}

{* TODO: Where should this go and what does it load/add *}
{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>

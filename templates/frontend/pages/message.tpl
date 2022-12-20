{**
 * templates/frontend/pages/message.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Generic message page.
 * Displays a simple message and (optionally) a return link.
 *}
{include file="frontend/components/header.tpl"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}

<div class="container mt-4 mt-md-5 px-4">
	<h2>
		{translate key=$pageTitle}
	</h2>

	<div class="row">
        {if $messageTranslated}
			<p>{$messageTranslated}</p>
        {else}
			<p>{translate key=$message}</p>
        {/if}

		{if $backLink}
			<p><a href="{$backLink}">{translate key=$backLinkLabel}</a></p>
		{/if}
	</div>
</div>

{include file="frontend/components/footer.tpl"}

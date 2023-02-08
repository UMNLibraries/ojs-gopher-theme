{**
 * templates/frontend/pages/information.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Information page.
 *
 *}
{if !$contentOnly}
    {include file="frontend/components/header.tpl" pageTitle=$pageTitle}
{/if}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}

<div class="container mt-4 mt-md-5 px-4">
	<div class="d-flex justify-content-between">
		<h2>
			{translate key=$pageTitle}
		</h2>
        {include file="frontend/components/editLink.tpl" page="management" op="settings" path="website" anchor="setup/information" sectionTitleKey="manager.website.information"}
	</div>

	<div class="row">
		<p>{$content}</p>
	</div>
</div>

{if !$contentOnly}
    {include file="frontend/components/footer.tpl"}
{/if}

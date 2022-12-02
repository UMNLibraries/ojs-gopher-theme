{**
 * frontend/pages/navigationMenuItemViewContent.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display NavigationMenuItem content
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$title|escape}

<div class="container mt-4 mt-md-5 px-4">
	<h2>
		{$title|escape}
	</h2>

	<div class="row">
		{$content}
	</div>
</div>

{include file="frontend/components/footer.tpl"}

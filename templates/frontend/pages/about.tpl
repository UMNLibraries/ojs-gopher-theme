{**
 * templates/frontend/pages/about.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a journal's or press's description, contact
 *  details, policies and more.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="about.aboutContext"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.aboutContext"}

<div class="container mt-4 mt-md-5 px-4">
	<div class="d-flex justify-content-between">
		<h2>
			{translate key="about.aboutContext"}
		</h2>
        {include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="about.aboutContext"}
	</div>
	<div class="row">
		{$currentContext->getLocalizedData('about')}
	</div>
</div>

{include file="frontend/components/footer.tpl"}

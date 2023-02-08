{**
 * templates/frontend/pages/aboutThisPublishingSystem.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view details about the OJS software.
 *
 * @uses $currentContext Journal The journal currently being viewed
 * @uses $appVersion string Current version of OJS
 * @uses $contactUrl string URL to the journal's contact page
 *}
{include file="frontend/components/header.tpl" pageTitle="about.aboutSoftware"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.aboutSoftware"}

<div class="container mt-4 mt-md-5 px-4">
	<div class="d-flex justify-content-between">
		<h2>
            {translate key="about.aboutSoftware"}
		</h2>
	</div>
	<div class="row">
		<p>
            {if $currentContext}
                {translate key="about.aboutOJSJournal" ojsVersion=$appVersion contactUrl=$contactUrl}
            {else}
                {translate key="about.aboutOJSSite" ojsVersion=$appVersion}
            {/if}
		</p>
	</div>
</div>

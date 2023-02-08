{**
 * templates/frontend/pages/privacy.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the privacy policy.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="manager.setup.privacyStatement"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="manager.setup.privacyStatement"}

<div class="container mt-4 mt-md-5 px-4">
	<div class="d-flex justify-content-between">
		<h2>
            {translate key="manager.setup.privacyStatement"}
		</h2>
	</div>
	<div class="row">
        {$privacyStatement}
	</div>
</div>

{include file="frontend/components/footer.tpl"}

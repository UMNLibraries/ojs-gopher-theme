{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the latest announcements
 *
 * @uses $announcements array List of announcements
 *}
{include file="frontend/components/header.tpl" pageTitle="announcement.announcements"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="announcement.announcements"}

<div class="container mt-4 mt-md-5 px-4">
	<div class="d-flex justify-content-between">
		<h2>
            {translate key="announcement.announcements"}
		</h2>
        {include file="frontend/components/editLink.tpl" page="management" op="settings" path="announcements" anchor="announcements" sectionTitleKey="announcement.announcements"}
	</div>
	<div class="row">
		{$announcementsIntroduction}

		<hr class="mt-3">

		{include file="frontend/components/announcements.tpl"}
	</div>
</div>

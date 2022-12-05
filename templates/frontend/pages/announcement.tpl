{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page which represents a single announcement
 *
 * @uses $announcement Announcement The announcement to display
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$announcement->getLocalizedTitle()|escape}

{include file="frontend/components/breadcrumbs_announcement.tpl" currentTitle=$announcement->getLocalizedTitle()}

{include file="frontend/objects/announcement_full.tpl"}

{include file="frontend/components/footer.tpl"}

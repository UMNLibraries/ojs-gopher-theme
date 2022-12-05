{**
 * templates/frontend/components/breadcrumbs_announcement.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a breadcrumb nav item for announcements.
 *
 * @uses $currentTitle string The title to use for the current page.
 * @uses $currentTitleKey string Translation key for title of current page.
 *}

<div class="container px-4 pt-4">
	<nav role="navigation" aria-label="{translate key="navigation.breadcrumbLabel"}">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="{url page="index" router=$smarty.const.ROUTE_PAGE}">
                    {translate key="common.homepageNavigationLabel"}
				</a>
			</li>
			<li class="breadcrumb-item">
				<a href="{url page="announcement" router=$smarty.const.ROUTE_PAGE}">
                    {translate key="announcement.announcements"}
				</a>
			</li>
			<li class="breadcrumb-item active" aria-current="page">
				<span aria-current="page">{$currentTitle|escape}</span>
			</li>
		</ol>
	</nav>
</div>

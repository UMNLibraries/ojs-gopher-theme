{**
 * templates/frontend/components/breadcrumbs.tpl
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a breadcrumb nav item showing the current page. This basic
 *  version is for top-level pages which only need to show the Home link. For
 *  category- and series-specific breadcrumb generation, see
 *  templates/frontend/components/breadcrumbs_catalog.tpl.
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
			<li class="breadcrumb-item active" aria-current="page">
				<span aria-current="page">
					{if $currentTitleKey}
                        {translate key=$currentTitleKey}
                    {else}
                        {$currentTitle|escape}
                    {/if}
				</span>
			</li>
		</ol>
	</nav>
</div>

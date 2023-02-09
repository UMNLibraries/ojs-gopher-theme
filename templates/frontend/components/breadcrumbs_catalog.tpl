{**
 * templates/frontend/components/breadcrumbs_catalog.tpl
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a breadcrumb nav item showing the location in the catalog.
 *  This only supports one-level of nesting, as does the category hierarchy data.
 *
 * @uses $type string What kind of page should we use to construct urls
 *       (category, series, new)?
 * @uses $parent Category A parent category if one exists
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
			{if $parent}
				<li class="breadcrumb-item">
					<a href="{url op=$type path=$parent->getPath()}">
                        {$parent->getLocalizedTitle()|escape}
					</a>
				</li>
			{/if}
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

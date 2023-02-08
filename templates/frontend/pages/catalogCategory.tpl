{**
 * templates/frontend/pages/catalogCategory.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a category of the catalog.
 *
 * @uses $category Category Current category being viewed
 * @uses $publishedSubmissions array List of published submissions in this category
 * @uses $parentCategory Category Parent category if one exists
 * @uses $subcategories array List of subcategories if they exist
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published submissions in this category
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$category->getLocalizedTitle()}

{* Breadcrumbs *}
{include file="frontend/components/breadcrumbs_catalog.tpl" type="category" parent=$parentCategory currentTitle=$category->getLocalizedTitle()}

<div class="container pt-4 px-4">
	<div class="row">

		<h2>{$category->getLocalizedTitle()|escape}</h2>

		{* Image and description *}
		{assign var="image" value=$category->getImage()}
		{assign var="description" value=$category->getLocalizedDescription()|strip_unsafe_html}
		<div class="col-xl-10 col-lg-8 col-md-7">
			{$description|strip_unsafe_html}
		</div>
		<div class="col-xl-2 col-lg-4 col-md-5 mb-3 mb-md-0">
			{* Count of articles in this category *}
			<p class="mb-4">{translate key="catalog.browseTitles" numTitles=$total}</p>
			{if $image}
				<a href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="fullSize" type="category" id=$category->getId()}">
					<img class="img-cover" src="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="thumbnail" type="category" id=$category->getId()}" alt="null" />
				</a>
			{/if}
		</div>
	</div>

	{if $subcategories|@count}
		<hr class="my-4">
		<nav role="navigation">
			<h3>{translate key="catalog.category.subcategories"}</h3>
			<ul class="list-unstyled">
                {foreach from=$subcategories item=subcategory}
					<li>
						<a href="{url op="category" path=$subcategory->getPath()}">
                            {$subcategory->getLocalizedTitle()|escape}
						</a>
					</li>
                {/foreach}
			</ul>
		</nav>
	{/if}

	<hr class="my-4">
	<h3 class="mb-3">
        {translate key="catalog.category.heading"}
	</h3>

	{* No published titles in this category *}
	{if empty($publishedSubmissions)}
		<p>{translate key="catalog.category.noItems"}</p>
	{else}
		<ul class="list-unstyled">
			{foreach from=$publishedSubmissions item=article}
				<li>
                    {include file="frontend/objects/article_summary.tpl" article=$article hideGalleys=true}
				</li>
			{/foreach}
		</ul>

        {* Pagination *}
        {if $prevPage > 1}
            {capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()|to_array:$prevPage}{/capture}
        {elseif $prevPage === 1}
            {capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()}{/capture}
        {/if}
        {if $nextPage}
            {capture assign=nextUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()|to_array:$nextPage}{/capture}
        {/if}
        {include
        file="frontend/components/pagination.tpl"
        prevUrl=$prevUrl
        nextUrl=$nextUrl
        showingStart=$showingStart
        showingEnd=$showingEnd
        total=$total
        }
	{/if}

</div>

{include file="frontend/components/footer.tpl"}

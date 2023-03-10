{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published monographs
 *}
{capture assign="pageTitle"}
    {if $prevPage}
        {translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
    {else}
        {translate key="archive.archives"}
    {/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

{include file="frontend/components/breadcrumbs.tpl" currentTitle=$pageTitle}

<div class="container px-4 pt-4">
	<h2>
		{$pageTitle|escape}
	</h2>

	{* No issues have been published *}
	{if empty($issues)}
		<p>{translate key="current.noCurrentIssueDesc"}</p>

	{* List issues *}
	{else}
		<div class="row mt-5 gx-md-5">
			{foreach from=$issues item="issue"}
				{include file="frontend/objects/issue_summary.tpl"}
			{/foreach}
		</div>

        {* Pagination *}
        {if $prevPage > 1}
            {capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$prevPage}{/capture}
        {elseif $prevPage === 1}
            {capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}{/capture}
        {/if}
        {if $nextPage}
            {capture assign=nextUrl}{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$nextPage}{/capture}
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

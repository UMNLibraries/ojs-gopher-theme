{**
 * templates/frontend/pages/search.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to search and view search results.
 *
 * @uses $query Value of the primary search query
 * @uses $authors Value of the authors search filter
 * @uses $dateFrom Value of the date from search filter (published after).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $dateTo Value of the date to search filter (published before).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $yearStart Earliest year that can be used in from/to filters
 * @uses $yearEnd Latest year that can be used in from/to filters
 *}
{include file="frontend/components/header.tpl" pageTitle="common.search"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="common.search"}

{* TODO: See if this should be `col-md-8` or `container` *}
<div class="col-md-8 mt-4 mt-md-5 px-4">
	<h2>{translate key="common.search"}</h2>

    {capture name="searchFormUrl"}{url escape=false}{/capture}
    {assign var=formUrlParameters value=[]}{* Prevent Smarty warning *}
    {$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
	<form id="search" method="get" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}">
        {foreach from=$formUrlParameters key=paramKey item=paramValue}
			<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
        {/foreach}

		<div class="my-4">
			<label class="visually-hidden" for="query">
				{translate key="search.searchFor"}
			</label>
			{block name=searchQuery}
				<input
					type="text"
					id="query"
					name="query"
					value="{$query|escape}"
					class="form-control"
					placeholder="{translate key="common.search"}"
				/>
			{/block}
		</div>

		{* Advanced search *}
		<fieldset form="search">
			<legend>
				<h3>{translate key="search.advancedFilters"}</h3>
			</legend>
			<div class="mb-3 mt-4">
				{* Date From *}
				<div class="my-3">
					<label class="form-label" for="dateFrom">
						{translate key="search.dateFrom"}
					</label>
					<div id="dateFrom">
						{* TODO: From and after require custom CSS to bring in-line with stylings *}
                        {html_select_date prefix="dateFrom" time=$dateFrom start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
					</div>
				</div>

				{* Date After *}
				<div class="my-3">
					<label class="form-label" for="dateAfter">
						{translate key="search.dateTo"}
					</label>
					<div id="dateFrom">
                        {html_select_date prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
					</div>
				</div>

				{* Filter Authors *}
				<div class="my-3">
					<label class="form-label" for="authors">
						{translate key="search.author"}
					</label>
					{block name=searchAuthors}
						<input
							type="text"
							name="authors"
							id="authors"
							value="{$authors|escape}"
							class="form-control"
						/>
					{/block}
				</div>

				{call_hook name="Templates::Search::SearchResults::AdditionalFilters"}
			</div>
		</fieldset>

		<button type="submit" class="btn btn-primary d-table submit-btn small">
			{translate key="common.search"}
		</button>
	</form>
</div>

<div class="container mt-4 mt-md-5 px-4">
	{call_hook name="Templates::Search::SearchResults::PreResults"}

	<h2 class="visually-hidden">
		{translate key="search.searchResults"}
	</h2>

	{* Results pagination *}
    {if !$results->wasEmpty()}
        {assign var="count" value=$results->count}
		<div class="visually-hidden" role="status">
            {if $results->count > 1}
                {translate key="search.searchResults.foundPlural" count=$results->count}
            {else}
                {translate key="search.searchResults.foundSingle"}
            {/if}
		</div>
    {/if}

	{* Search results, finally! *}
    {iterate from=results item=result}
        {include file="frontend/objects/article_summary.tpl" headingLevel="h1" article=$result.publishedSubmission journal=$result.journal showDatePublished=true hideGalleys=true hideAbstract=true}
    {/iterate}

    {* No results found *}
    {if $results->wasEmpty()}
        {if $error}
            {include file="frontend/components/notification.tpl" type="error" message=$error|escape}
        {else}
            {include file="frontend/components/notification.tpl" type="secondary" messageKey="search.noResults"}
        {/if}

        {* Results pagination *}
    {else}
		<hr>
        {page_info iterator=$results}
        {page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear}
    {/if}
</div>

{include file="frontend/components/footer.tpl"}

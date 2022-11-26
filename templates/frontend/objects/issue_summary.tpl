{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists. Must be contained within a .row class.
 *
 * @uses $issue Issue The issue
 *}
{if $issue->getShowTitle()}
    {assign var=issueTitle value=$issue->getLocalizedTitle()}
{/if}
{assign var=issueSeries value=$issue->getIssueSeries()}
{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}

<div class="col-xxl-3 col-xl-4 col-lg-4 col-md-6 text-center mb-5">
	{if $issueCover}
		<a href="{url op="view" path=$issue->getBestIssueId()}">
			<img src="{$issueCover|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}" class="issue-summary-cover img-fluid mb-4">
		</a>
	{/if}

	<h3 class="mb-1">
		<a class="issue-summary-title" href="{url op="view" path=$issue->getBestIssueId()}">
            {if $issueTitle}
                {$issueTitle|escape}
            {else}
                {$issueSeries|escape}
            {/if}
		</a>
	</h3>

	{if $issueTitle && $issueSeries}
		<h4 class="mb-3">
			{$issueSeries|escape}
		</h4>
	{/if}

	{* TODO: Include character limit and add "Read more" link *}
	{$issue->getLocalizedDescription()|strip_unsafe_html}
</div>

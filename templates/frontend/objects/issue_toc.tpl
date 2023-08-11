{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $publishedSubmissions array Lists of articles published in this issue
 *   sorted by section.
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 * @uses $heading string HTML heading element, default: h2
 *}

{*  Issue introduction area above articles *}
<div class="container pt-4 px-4">
	{if !$labelAsCurrentIssue}
		{assign var=labelAsCurrentIssue value=false}
	{/if}

	<div class="row">
	{if $issue->getPublished()}
		<h2>
			{if $labelAsCurrentIssue}
				{translate key="journal.currentIssue"}
			{else}
				{$issue->getIssueIdentification()|strip_unsafe_html}
			{/if}
		</h2>
	{/if}
		{* TODO: Investigate margin/spacing around alert to see if too crowded *}
        {* Indicate if this is only a preview *}
        {if !$issue->getPublished()}
            {include file="frontend/components/notification.tpl" type="info" messageKey="editor.issues.preview"}
        {/if}

		{* Issue cover iamge *}
		{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}

		{if $issueCover}
			<div class="col-xl-2 col-lg-4 col-md-5 mb-3 mb-md-0">
				<a href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
                    {capture assign="defaultAltText"}
                        {translate key="issue.viewIssueIdentification" identification=$issue->getIssueIdentification()|escape}
                    {/capture}
					<img src="{$issueCover|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:$defaultAltText}" class="w-100 img-cover">
				</a>
			</div>
		{/if}

		<div class="{if $issueCover}col-xl-10 col-lg-8 col-md-7{/if}">
			{if $labelAsCurrentIssue}
				<p class="bold m-0">{$issue->getIssueIdentification()|strip_unsafe_html}</p>
			{/if}

			{* Published date *}
			{if $issue->getDatePublished()}
				<p>
					<span class="label">
						{translate key="submissions.published"}:
					</span>
					<span class="value">
						{$issue->getDatePublished()|date_format:$dateFormatShort}
					</span>
				</p>
			{/if}

			{* Pub IDs (eg - DOI) *}
            {foreach from=$pubIdPlugins item=pubIdPlugin}
				{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
				{if $pubId}
					{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
					<p>
						<span class="label">
							{$pubIdPlugin->getPubIdDisplayType()|escape}:
						</span>
						<span class="value">
							{if $doiUrl}
								<a class="btn-link" href="{$doiUrl|escape}">
								{$doiUrl}
							</a>
                            {else}
                                {$pubId}
                            {/if}
						</span>
					</p>
				{/if}
			{/foreach}

			{*  Description *}
			{if $issue->hasDescription()}
				{$issue->getLocalizedDescription()|strip_unsafe_html}
			{/if}
		</div>
	</div>
</div>

{* TODO: Full-issue galleys *}

{* Articles *}
{foreach name=sections from=$publishedSubmissions item=section}
	<div class="container px-4 pt-0 pt-md-4">
		<hr>
		{if $section.articles}
			{if $section.title}
				<h3>{$section.title|escape}</h3>
			{/if}
			{foreach from=$section.articles item=article}
				{include file="frontend/objects/article_summary.tpl" isFirstItem=$article@first}
			{/foreach}
		{/if}
	</div>
{/foreach}

<div class="container px-4 pt-2 pt-md-4">
	<hr class="mb-1">
	<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="btn btn-link chevron-btn">
        {translate key="journal.viewAllIssues"}
	</a>
</div>



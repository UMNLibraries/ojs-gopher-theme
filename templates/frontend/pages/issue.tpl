{**
 * templates/frontend/pages/issue.tpl
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a landing page for a single issue. It will show the table of contents
 *  (toc) or a cover image, with a click through to the toc.
 *
 * @uses $issue Issue The issue
 * @uses $issueIdentification string Label for this issue, consisting of one or
 *       more of the volume, number, year and title, depending on settings
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $primaryGenreIds array List of file genre IDs for primary types
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$issueIdentification}

{* Display a message if no current issue exists *}
{if !$issue}
    {include file="frontend/components/breadcrumbs_issue.tpl" currentTitleKey="current.noCurrentIssue"}

	<div class="container px-4 pt-4">
		<div class="row">
			<h2>
                {translate key="current.noCurrentIssue"}
			</h2>
            {include file="frontend/components/notification.tpl" type="warning" messageKey="current.noCurrentIssueDesc"}
		</div>
	</div>

{* Display an issue with the Table of Contents *}
{else}
    {include file="frontend/components/breadcrumbs_issue.tpl" currentTitle=$issueIdentification}

	{include file="frontend/objects/issue_toc.tpl"}
{/if}

{include file="frontend/components/footer.tpl"}

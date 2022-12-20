{**
* templates/frontend/pages/indexJournal.tpl
*
* Copyright (c) 2014-2021 Simon Fraser University
* Copyright (c) 2003-2021 John Willinsky
* Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
*
* @brief Display the index page for a journal
*
* @uses $currentJournal Journal This journal
* @uses $journalDescription string Journal description from HTML text editor
* @uses $homepageImage object Image to be displayed on the homepage
* @uses $additionalHomeContent string Arbitrary input from HTML text editor
* @uses $announcements array List of announcements
* @uses $numAnnouncementsHomepage int Number of announcements to display on the
*       homepage
* @uses $issue Issue Current issue
*}

{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

{* TODO: Add `{call_hook name="Templates::Index::journal"}` *}

<div class="container px-4 home-sec-1">
	{* TODO: Sort out rest of index page content *}
	<div class="row">
		{if !empty($displayPageHeaderLogo)}
			<div class="col-xl-5 col-md-6 mb-3 mb-md-0">
				<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" alt="" class="w-100 img-cover">
			</div>
		{/if}
		<div class="{if !empty($displayPageHeaderLogo)}col-xl-7 col-md-6{/if}">

			{if $currentJournal->getData('onlineIssn')}
				{assign var=issn value=$currentJournal->getData('onlineIssn')}
			{elseif $currentJournal->getData('printIssn')}
                {assign var=issn value=$currentJournal->getData('printIssn')}
			{else}
				{assign var=issn value=""}
			{/if}

			{if !empty($issn)}
				<p class="bold">ISSN: {$issn}</p>
			{/if}
			{if $currentContext->getLocalizedDescription()}
				{$currentContext->getLocalizedDescription()}
			{/if}
		</div>
	</div>
    {if !$currentContext->getData('disableSubmissions')}
		<div class="row pt-3">
			<div class="col-xl-5 col-md-6 d-flex justify-content-between">
				<a href="{url page="about" op="submissions"}" class="btn btn-primary w-50 me-2">{translate key="plugins.themes.umn.makeSubmission"}</a>
			</div>
		</div>
	{/if}
</div>

<div class="border-top">
	{include file="frontend/objects/issue_toc.tpl" labelAsCurrentIssue=true}
</div>

{include file="frontend/components/footer.tpl"}

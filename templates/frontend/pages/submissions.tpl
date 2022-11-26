{**
 * templates/frontend/pages/submissions.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $submissionChecklist array List of requirements for submissions
 *}
{include file="frontend/components/header.tpl" pageTitle="about.submissions"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.submissions"}

<div class="container px-4 pt-4">
	<div class="d-flex justify-content-between">
		<h2>
            {translate key="about.submissions"}
		</h2>
{*        {include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="about.aboutContext"}*}
	</div>
	<div class="row">
		<p>
			{if $sections|@count == 0 || $currentContext->getData('disableSubmissions')}
				{translate key="author.submit.notAccepting"}
			{else}
				{if $isUserLoggedIn}
					{capture assign="newSubmission"}<a href="{url page="submission" op="wizard"}">{translate key="about.onlineSubmissions.newSubmission"}</a>{/capture}
					{capture assign="viewSubmissions"}<a href="{url page="submissions"}">{translate key="about.onlineSubmissions.viewSubmissions"}</a>{/capture}
					{translate key="about.onlineSubmissions.submissionActions" newSubmission=$newSubmission viewSubmissions=$viewSubmissions}
				{else}
					{capture assign="login"}<a href="{url page="login"}">{translate key="about.onlineSubmissions.login"}</a>{/capture}
					{capture assign="register"}<a href="{url page="user" op="register"}">{translate key="about.onlineSubmissions.register"}</a>{/capture}
					{translate key="about.onlineSubmissions.registrationRequired" login=$login register=$register}
				{/if}
			{/if}
		</p>
	</div>

	{if $submissionChecklist}
		<div class="row pt-3">
			<div class="d-flex justify-content-between">
				<h3>
					{translate key="about.submissionPreparationChecklist"}
				</h3>
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="workflow" anchor="submission/submissionChecklist" sectionTitleKey="about.submissionPreparationChecklist"}
			</div>
			<p>{translate key="about.submissionPreparationChecklist.description"}</p>
			<ul>
				{foreach from=$submissionChecklist item=checklistItem}
					{* TODO: Investigate size difference between this and <p> and why <p> needed for padding to be inlcuded *}
					<li>
						{$checklistItem.content|nl2br}
					</li>
				{/foreach}
			</ul>
		</div>
	{/if}

	{if $currentContext->getLocalizedData('authorGuidelines')}
		<div class="row pt-3">
			<div class="d-flex justify-content-between">
				<h3>
                    {translate key="about.authorGuidelines"}
				</h3>
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="workflow" anchor="submission/authorGuidelines" sectionTitleKey="about.authorGuidelines"}
			</div>
			{$currentContext->getLocalizedData('authorGuidelines')}
		</div>
	{/if}

	{foreach from=$sections item="section"}
		{if $section->getLocalizedPolicy}
			<div class="row pt-3">
				<h3>{$section->getLocalizedTitle()|escape}</h3>
                {$section->getLocalizedPolicy()}
                {if $isUserLoggedIn}
                    {capture assign="sectionSubmissionUrl"}{url page="submission" op="wizard" sectionId=$section->getId()}{/capture}
					<p>
                        {translate key="about.onlineSubmissions.submitToSection" name=$section->getLocalizedTitle() url=$sectionSubmissionUrl}
					</p>
                {/if}
			</div>
		{/if}
	{/foreach}

    {if $currentContext->getLocalizedData('copyrightNotice')}
		<div class="row pt-3">
			<div class="d-flex justify-content-between">
				<h3>
					{translate key="about.copyrightNotice"}
				</h3>
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="workflow" anchor="submission/authorGuidelines" sectionTitleKey="about.copyrightNotice"}
			</div>
            {$currentContext->getLocalizedData('copyrightNotice')}
		</div>
    {/if}

    {if $currentContext->getLocalizedData('privacyStatement')}
		<div class="row pt-3">
			<div class="d-flex justify-content-between">
				<h3>
					{translate key="about.privacyStatement"}
				</h3>
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="website" anchor="setup/privacy" sectionTitleKey="about.privacyStatement"}
			</div>
            {$currentContext->getLocalizedData('privacyStatement')}
		</div>
    {/if}
</div>

{include file="frontend/components/footer.tpl"}

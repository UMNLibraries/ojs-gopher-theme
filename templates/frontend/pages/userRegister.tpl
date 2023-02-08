{**
 * templates/frontend/pages/userRegister.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 * @uses $primaryLocale string The primary locale for this journal/press
 *}
{include file="frontend/components/header.tpl" pageTitle="user.register"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.register"}

<div class="col-md-8 mt-4 mt-md-5 px-4">
	<h2 class="{if $isError}mb-3{else}mb-5{/if}">
		{translate key="user.register"}
	</h2>

	<form id="register" method="post" action="{url op="register"}">
		{csrf}

        {include file="common/formErrors.tpl"}

		{if $source}
			<input type="hidden" name="source" value="{$source|escape}" />
		{/if}

		{* TODO: Decide whether to use {include file="common/formErrors.tpl"} or not *}

        {include file="frontend/components/registrationForm.tpl"}

		{* When a user is registering with a specific journal *}
		<fieldset form="register">
			{if $currentContext}

				{if $currentContext->getData('privacyStatement')}
					{* Require the user to agree to the terms of the privacy policy *}
					<div class="form-check mt-5 mb-3">
						<input
							type="checkbox"
							class="form-check-input"
							name="privacyConsent"
							id="privacyConsent"
							value="1"
							{if $privacyConsent}checked="checked"{/if}
							{* TODO: See if this should use HTML5 required *}
						/>
						<label class="form-check-label" for="privacyConsent">
							{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
							{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
						</label>
					</div>
				{/if}
				<div class="form-check my-3">
					<input
						type="checkbox"
						class="form-check-input"
						name="emailConsent"
						id="emailConsent"
						value="1"
						{if $emailConsent}checked="checked"{/if}
					/>
					<label class="form-check-label" for="emailConsent">
						{translate key="user.register.form.emailConsent"}
					</label>
				</div>

				{* Allow the user to sign up as a reviewer *}
				{assign var=contextId value=$currentContext->getId()}
				{assign var=userCanRegisterReviewer value=0}
				{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
					{if $userGroup->getPermitSelfRegistration()}
						{assign var=userCanRegisterReviewer value=$userCanRegisterReviewer+1}
					{/if}
				{/foreach}
				{if $userCanRegisterReviewer}
					{if $userCanRegisterReviewer > 1}
						<legend>
							{* TODO: See how this legend should be formatted *}
							{translate key="user.reviewerPrompt"}
						</legend>
						{capture assign="checkboxLocaleKey"}user.reviewerPrompt.userGroup{/capture}
					{else}
						{capture assign="checkboxLocaleKey"}user.reviewerPrompt.optin{/capture}
					{/if}

					{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
						{if $userGroup->getPermitSelfRegistration()}
							<div class="form-check my-3">
								{assign var="userGroupId" value=$userGroup->getId()}
								<input
									class="form-check-input"
									type="checkbox"
									name="reviewerGroup[{$userGroupId}]"
									id=name="reviewerGroup[{$userGroupId}]"
									value="1"
									{if in_array($userGroupId, $userGroupIds)}
										checked="checked"
									{/if}
								/>
								<label class="form-check-label" for="reviewerGroup[{$userGroupId}]">
									{translate key=$checkboxLocaleKey userGroup=$userGroup->getLocalizedName()}
								</label>
							</div>
						{/if}
					{/foreach}

					<div class="mb-3 mt-4">
						<label class="form-label" for="interests">
							{translate key="user.interests"}
						</label>
						<input
							class="form-control"
							type="text"
							name="interests"
							id="interests"
							value="{$interests|escape}"
						/>
					</div>
				{/if}
			{/if}
		</fieldset>

		{include file="frontend/components/registrationFormContexts.tpl"}

		<fieldset form="register">
            {* When a user is registering for no specific journal, allow them to
		   enter their reviewer interests *}
            {if !$currentContext}
				<div class="mb-3 mt-4">
					<label class="form-label" for="interests">
                        {translate key="user.register.noContextReviewerInterests"}
					</label>
					<input
						class="form-control"
						type="text"
						name="interests"
						id="interests"
						value="{$interests|escape}"
					/>
				</div>

				{* Require the user to agree to the terms of the privacy policy *}
                {if $siteWidePrivacyStatement}
					<div class="form-check my-3">
						<input
								type="checkbox"
								class="form-check-input"
								name="privacyConsent[{$smarty.const.CONTEXT_ID_NONE}]"
								id="privacyConsent[{$smarty.const.CONTEXT_ID_NONE}]"
								value="1"
                                {if $privacyConsent[$smarty.const.CONTEXT_ID_NONE]}checked="checked"{/if}
                                {* TODO: See if this should use HTML5 required *}
						/>
						<label class="form-check-label" for="privacyConsent[{$smarty.const.CONTEXT_ID_NONE}]">
                            {capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
                            {translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
						</label>
					</div>
                {/if}

				{* Ask the user to opt into public email notifications *}
				<div class="form-check my-3">
					<input
						type="checkbox"
						class="form-check-input"
						name="emailConsent"
						id="emailConsent"
						value="1"
						{if $emailConsent}checked="checked"{/if}
					/>
					<label class="form-check-label" for="emailConsent">
                        {translate key="user.register.form.emailConsent"}
					</label>
				</div>
            {/if}

			{* recaptcha spam blocker *}
			{if $reCaptchaHtml}
				{* TODO: Double-check formatting here *}
				<div class="my-3">
					{$reCaptchaHtml}
				</div>
			{/if}
		</fieldset>

		<div class="d-flex mt-4">
			<button
				type="submit"
				class="btn btn-primary d-table submit-btn small me-3"
			>
				{translate key="user.register"}
			</button>
            {capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}
			<a
				href="{url page="login" source=$rolesProfileUrl}"
				class="btn btn-secondary d-table submit-btn small"
			>
				{translate key="user.login"}
			</a>
		</div>
	</form>
</div>

{include file="frontend/components/footer.tpl"}

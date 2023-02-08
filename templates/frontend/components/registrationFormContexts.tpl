{**
 * templates/frontend/components/registrationFormContexts.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display role selection for all of the journals/presses on this site
 *
 * @uses $contexts array List of journals/presses on this site that have enabled registration
 * @uses $readerUserGroups array Associative array of user groups with reader
 *  permissions in each context.
 * @uses $authorUserGroups array Associative array of user groups with author
 *  permissions in each context.
 * @uses $reviewerUserGroups array Associative array of user groups with reviewer
 *  permissions in each context.
 * @uses $userGroupIds array List group IDs this user is assigned
 *}

{* Only display the context role selection when registration is taking place
   outside of the context of any one journal/press. *}
{if !$currentContext}
<fieldset form="register" name="contexts">
	<legend>
		<h3 class="mt-5">
			{translate key="user.register.contextsPrompt"}
		</h3>
	</legend>

	<div class="my-3">
		<ul class="list-unstyled">
			{foreach from=$contexts item=context}
                {assign var=contextId value=$context->getId()}
                {assign var=isSelected value=false}
				<li class="form-label">
					{$context->getLocalizedName()}
					<fieldset form="register" name="roles">
						<legend class="visually-hidden">
                            {translate key="user.register.otherContextRoles"}
						</legend>
						{foreach from=$readerUserGroups[$contextId] item=userGroup}
							{if $userGroup->getPermitSelfRegistration()}
								{assign var="userGroupId" value=$userGroup->getId()}
								<div class="form-check form-check-inline">
									<input
										type="checkbox"
										class="form-check-input"
										name="readerGroup[{$userGroupId}]"
										id="readerGroup[{$userGroupId}]"
										{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}
									/>
									<label class="form-check-label" for="readerGroup[{$userGroupId}]">
										{$userGroup->getLocalizedName()}
									</label>
								</div>
								{if in_array($userGroupId, $userGroupIds)}
									{assign var=isSelected value=true}
								{/if}
							{/if}
						{/foreach}
						{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
							{if $userGroup->getPermitSelfRegistration()}
								{assign var="userGroupId" value=$userGroup->getId()}
								<div class="form-check form-check-inline">
									<input
										type="checkbox"
										class="form-check-input"
										name="reviewerGroup[{$userGroupId}]"
										id="reviewerGroup[{$userGroupId}]"
										{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}
									/>
									<label class="form-check-label" for="reviewerGroup[{$userGroupId}]">
										{$userGroup->getLocalizedName()}
									</label>
								</div>
								{if in_array($userGroupId, $userGroupIds)}
									{assign var=isSelected value=true}
								{/if}
							{/if}
						{/foreach}

                        {* Require the user to agree to the terms of the context's privacy policy *}
                        {if !$enableSiteWidePrivacyStatement && $context->getData('privacyStatement')}
							<div class="form-check my-3 {if !$isSelected}visually-hidden{/if}">
								<input
										type="checkbox"
										class="form-check-input"
										name="privacyConsent[{$contextId}]"
										id="privacyConsent[{$contextId}]"
										value="1"
                                        {if $privacyConsent[$contextId]}checked="checked"{/if}
                                        {* TODO: See if this should use HTML5 required *}
								/>
								<label class="form-check-label" for="privacyConsent[{$contextId}]">
                                    {capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE context=$context->getPath() page="about" op="privacy"}{/capture}
                                    {translate key="user.register.form.privacyConsentThisContext" privacyUrl=$privacyUrl}
								</label>
							</div>
						{/if}
					</fieldset>
				</li>
			{/foreach}
		</ul>
	</div>
</fieldset>
{/if}

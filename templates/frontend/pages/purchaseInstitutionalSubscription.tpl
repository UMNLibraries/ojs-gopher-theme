{**
 * templates/payments/userInstitutionalSubscriptionForm.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * User purchase institutional subscription form
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.subscriptions.purchaseInstitutionalSubscription"}

<div class="container px-4 pt-4">
	<h2 class="mb-5">
        {translate key="user.subscriptions.purchaseInstitutionalSubscription"}
	</h2>

	<div class="col-md-8 mt-4 mt-md-5">
        {assign var="formPath" value="institutional"}
        {if $subscriptionId}
            {assign var="formPath" value="institutional"|to_array:$subscriptionId}
        {/if}
		<form method="post" id="subscriptionForm" action="{url op="payPurchaseSubscription" path=$formPath}">
			{csrf}

            {include file="common/formErrors.tpl"}

			<fieldset form="subscriptionForm">
				<legend>
					<h3>
						{translate key="payment.subscription.purchase"}
					</h3>
				</legend>

				<div class="mb-3 mt-4">
					<label for="typeId" class="form-label">
                        {translate key="user.subscriptions.form.typeId"}
						<span aria-hidden="true">*</span>
						<span class="visually-hidden">
							{translate key="common.required"}
						</span>
					</label>
					<select class="form-select" name="typeId" id="typeId" required>
                        {foreach name=types from=$subscriptionTypes item=subscriptionType}
							<option value="{$subscriptionType->getId()}"{if $typeId == $subscriptionType->getId()} selected{/if}>{$subscriptionType->getLocalizedName()|escape}</option>
                        {/foreach}
					</select>
				</div>

				<div class="mb-3 mt-4">
					<label for="membership" class="form-label">
						{translate key="user.subscriptions.form.membership"}
					</label>
					<input
						type="text"
						name="membership"
						id="membership"
						class="form-control"
						value="{$membership|escape}"
						aria-describedby="subscriptionMembershipDescription"
					/>
					<div class="form-text" id="subscriptionMembershipDescription">
                        {translate key="user.subscriptions.form.membershipInstructions"}
					</div>
				</div>

				<div class="mb-3 mt-4">
					<label for="institutionName" class="form-label">
                        {translate key="user.subscriptions.form.institutionName"}
					</label>
					<input
							type="text"
							name="institutionName"
							id="institutionName"
							class="form-control"
							value="{$institutionName|escape}"
					/>
				</div>

				<div class="mb-3 mt-4">
					<label for="institutionMailingAddress" class="form-label">
                        {translate key="user.subscriptions.form.institutionMailingAddress"}					</label>
					<textarea
							name="institutionMailingAddress"
							id="institutionMailingAddress"
							class="form-control"
							rows="3"
					>
						{$institutionalMailingAddress|escape}
					</textarea>
				</div>
			</fieldset>

			<fieldset form="subscriptionForm">
				<div class="mb-3 mt-4">
					<label class="form-label" for="domain">
						{translate key="user.subscriptions.form.domain"}
					</label>
					<input
						type="text"
						name="domain"
						id="domain"
						class="form-control"
						value="{$domain|escape}"
						aria-describedby="subscriptionDomainDescription"
					/>
					<div class="form-text" id="subscriptionDomainDescription">
                        {translate key="user.subscriptions.form.domainInstructions"}
					</div>
				</div>

				<div class="mb-3 mt-4">
					<label class="form-label" for="ipRanges">
						{translate key="user.subscriptions.form.ipRange"}
					</label>
					<input
						class="form-control"
						type="text"
						name="ipRanges"
						id="ipRanges"
						value="{$ipRanges|escape}"
						aria-describedby="subscriptionIPDescription"
					/>
					<div class="form-text" id="subscriptionIPDescription">
                        {translate key="user.subscriptions.form.ipRangeInstructions"}
					</div>
				</div>
			</fieldset>

			<div class="d-flex mt-4">
				<button type="submit" class="btn btn-primary d-table submit-btn small me-3">
					{translate key="common.continue"}
				</button>
				<a
					class="btn btn-primary d-table submit-btn small"
					href="{url page="user" op="subscriptions"}"
				>
					{translate key="common.cancel"}
				</a>
			</div>
		</form>
	</div>
</div>

{include file="frontend/components/footer.tpl"}

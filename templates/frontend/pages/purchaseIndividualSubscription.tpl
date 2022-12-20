{**
 * templates/frontend/pages/purchaseIndividualSubscription.tpl
 *
 * Copyright (c) 2013-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * User purchase individual subscription form
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.subscriptions.purchaseIndividualSubscription"}

<div class="container px-4 pt-4">
	<div class="col-md-8 mt-4 mt-md-5">
		<form method="post" id="subscriptionForm" action="{url op="payPurchaseSubscription" path="individual"|to_array:$subscriptionId}">
			{csrf}

			<fieldset name="subscriptionForm">
				<legend>
					<h2 class="mb-5">
						{translate key="payment.subscription.purchase"}
					</h2>
				</legend>

				<div class="mb-3 mt-4">
					<label for="typeId" class="form-label">
						{translate key="user.subscriptions.form.typeId"}
					</label>
					<select
						name="typeId"
						id="typeId"
						class="form-select"
					>
						{foreach name=types from=$subscriptionTypes key=thisTypeId item=subscriptionType}
							<option value="{$thisTypeId|escape}"{if $typeId == $thisTypeId} selected{/if}>{$subscriptionType|escape}</option>
						{/foreach}
					</select>
				</div>

				<div class="mb-3 mt-4">
					<label for="membership" class="form-label">
                        {translate key="user.subscriptions.form.membership"}
					</label>
					<input
						type="text"
						class="form-control"
						name="membership"
						id="membership"
						value="{$membership|escape}"
					/>
				</div>
			</fieldset>

			<div class="d-flex mt-4">
				<button class="btn btn-primary d-table submit-btn small">
                    {translate key="common.save"}
				</button>
			</div>
		</form>
	</div>
</div>

{include file="frontend/components/footer.tpl"}

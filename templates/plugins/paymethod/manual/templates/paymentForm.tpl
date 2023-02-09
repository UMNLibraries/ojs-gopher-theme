{**
 * plugins/paymethod/manual/templates/paymentForm.tpl
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Manual payment page
 *}
{include file="frontend/components/header.tpl" pageTitle="plugins.paymethod.manual"}

<div class="container mt-4 mt-md-5 px-4">
	<h2>
		{translate key="plugins.paymethod.manual"}
	</h2>

	<div class="row">
		<div>
			<table class="table align-middle">
				<tr>
					<th scope="row">
                        {translate key="plugins.paymethod.manual.purchase.title"}
					</th>
					<td>
                        {$itemName|escape}
					</td>
				</tr>
                {if $itemAmount}
					<tr>
						<th scope="row">
                            {translate key="plugins.paymethod.manual.purchase.fee"}
						</th>
						<td>{$itemAmount|string_format:"%.2f"}{if $itemCurrencyCode} ({$itemCurrencyCode|escape}){/if}</td>
					</tr>
                {/if}
			</table>
		</div>

		<p>{$manualInstructions|nl2br}</p>

		<p>
			<a href="{url page="payment" op="plugin" path="ManualPayment"|to_array:"notify":$queuedPaymentId}">
                {translate key="plugins.paymethod.manual.sendNotificationOfPayment"}
			</a>
		</p>
	</div>
</div>

{include file="frontend/components/footer.tpl"}

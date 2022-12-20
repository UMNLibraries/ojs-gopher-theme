{**
 * templates/frontend/pages/subscriptions.tpl
 *
 * Copyright (c) 2013-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * About the Journal Subscriptions.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="about.subscriptions"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.subscriptions"}

<div class="container mt-4 mt-md-5 px-4">
	<h2>
		{translate key="about.subscriptions"}
	</h2>

    {include file="frontend/components/subscriptionContact.tpl"}

	{if $individualSubscriptionTypes|@count}
		<div class="row py-4">
			<h3>
				{translate key="about.subscriptions.individual"}
			</h3>
			<p>{translate key="subscriptions.individualDescription"}</p>
			<div>
				<table class="table align-middle">
					<thead>
						<tr>
							<th scope="col">{translate key="about.subscriptionTypes.name"}</th>
							<th scope="col">{translate key="about.subscriptionTypes.format"}</th>
							<th scope="col">{translate key="about.subscriptionTypes.duration"}</th>
							<th scope="col">{translate key="about.subscriptionTypes.cost"}</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$individualSubscriptionTypes item=subscriptionType}
							<tr>
								<td>
									<p>
										{$subscriptionType->getLocalizedName()|escape}
									</p>
									{$subscriptionType->getLocalizedDescription()|strip_unsafe_html}
								</td>
								<td>
									<p>
										{translate key=$subscriptionType->getFormatString()}
									</p>
								</td>
								<td>
									<p>
										{$subscriptionType->getDurationYearsMonths()|escape}</td>
									</p>
								<td>
									<p>
										{$subscriptionType->getCost()|string_format:"%.2f"}&nbsp;({$subscriptionType->getCurrencyStringShort()|escape})</td>
									</p>
							</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
			{if $isUserLoggedIn}
				<a href="{url page="user" op="purchaseSubscription" path="individual"}">
                    {translate key="user.subscriptions.purchaseNewSubscription"}
				</a>
			{/if}
		</div>
	{/if}

    {if $institutionalSubscriptionTypes|@count}
		<div class="row py-4">
			<h3>{translate key="about.subscriptions.institutional"}</h3>
			<p>{translate key="subscriptions.institutionalDescription"}</p>
			<div>
				<table class="table align-middle">
					<thead>
						<tr>
							<th scope="col">{translate key="about.subscriptionTypes.name"}</th>
							<th scope="col">{translate key="about.subscriptionTypes.format"}</th>
							<th scope="col">{translate key="about.subscriptionTypes.duration"}</th>
							<th scope="col">{translate key="about.subscriptionTypes.cost"}</th>
						</tr>
					</thead>
					<tbody>
                    {foreach from=$institutionalSubscriptionTypes item=subscriptionType}
						<tr>
							<td>
								<p>
                                    {$subscriptionType->getLocalizedName()|escape}
								</p>
								{$subscriptionType->getLocalizedDescription()|strip_unsafe_html}
							</td>
							<td>
								<p>
									{translate key=$subscriptionType->getFormatString()}</td>
								</p>
							<td>
								<p>
									{$subscriptionType->getDurationYearsMonths()|escape}</td>
								</p>
							<td>
								<p>
									{$subscriptionType->getCost()|string_format:"%.2f"}&nbsp;({$subscriptionType->getCurrencyStringShort()|escape})</td>
								</p>
						</tr>
					{/foreach}
					</tbody>
				</table>
			</div>
			{if $isUserLoggedIn}
				<a href="{url page="user" op="purchaseSubscription" path="institutional"}">
                    {translate key="user.subscriptions.purchaseNewSubscription"}
				</a>
			{/if}
		</div>
	{/if}
</div>

{include file="frontend/components/footer.tpl"}

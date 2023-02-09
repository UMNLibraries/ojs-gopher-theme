{**
 * templates/frontend/components/subscriptionContact.tpl
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the contact details for a journal's subscriptions
 *
 * @uses $subscriptionAdditionalInformation string HTML text description
 *       subcription information
 * @uses $subscriptionMailingAddress string Contact address for subscriptions
 * @uses $subscriptionName string Contact name for subscriptions
 * @uses $subscriptionPhone string Contact phone number for subscriptions
 * @uses $subscriptionEmail string Contact email address for subscriptions
 *}
<div class="row pt-3">
	{if $subscriptionAdditionalInformation}
        {$subscriptionAdditionalInformation|strip_unsafe_html}
	{/if}

    {if $subscriptionName || $subscriptionPhone || $subscriptionEmail}
		<h3>
			{translate key="about.subscriptionsContact"}
		</h3>

		{if $subscriptionName}
			<p class="mb-1">
				{$subscriptionName|escape}
			</p>
		{/if}

        {if $subscriptionMailingAddress}
			<p class="mb-1">
                {$subscriptionMailingAddress|nl2br|strip_unsafe_html}
			</p>
        {/if}

        {if $subscriptionPhone}
			<p class="mb-1">
				<span class="label">
					{translate key="about.contact.phone"}
				</span>
				<span class="value">
						{$subscriptionPhone|escape}
					</span>
			</p>
        {/if}

        {if $subscriptionEmail}
			<p class="mb-1">
				<a href="mailto:{$subscriptionEmail|escape}">
                    {$subscriptionEmail|escape}
				</a>
			</p>
        {/if}
	{/if}
</div>

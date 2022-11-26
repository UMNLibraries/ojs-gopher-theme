{**
 * templates/frontend/pages/contact.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the press's contact details.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $mailingAddress string Mailing address for the journal/press
 * @uses $contactName string Primary contact name
 * @uses $contactTitle string Primary contact title
 * @uses $contactAffiliation string Primary contact affiliation
 * @uses $contactPhone string Primary contact phone number
 * @uses $contactEmail string Primary contact email address
 * @uses $supportName string Support contact name
 * @uses $supportPhone string Support contact phone number
 * @uses $supportEmail string Support contact email address
 *}
{include file="frontend/components/header.tpl" pageTitle="about.contact"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.contact"}
<div class="container mt-4 mt-md-5 px-4">
	<div class="d-flex justify-content-between">
		<h2>
            {translate key="about.contact"}
		</h2>
        {include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="contact" sectionTitleKey="about.contact"}
	</div>
	{* Contact section *}
	<div class="row">
        {if $mailingAddress}
			<p>{$mailingAddress|nl2br|strip_unsafe_html}</p>
		{/if}

        {* Primary contact *}
        {if $contactTitle || $contactName || $contactAffiliation || $contactPhone || $contactEmail}
			<div class="contact-info-container mb-4">

				<h3>{translate key="about.contact.principalContact"}</h3>

				{if $contactName}
					<p>
						{$contactName|escape}
					</p>
				{/if}

				{if $contactTitle}
					<p>
						{$contactTitle|escape}
					</p>
				{/if}

				{if $contactAffiliation}
					<p>
						{$contactAffiliation|strip_unsafe_html}
					</p>
				{/if}

				{if $contactPhone}
					<p>
						<span class="label">
							{translate key="about.contact.phone"}
						</span>
						<span class="value">
							{$contactPhone|escape}
						</span>
					</p>
				{/if}

				{if $contactEmail}
					<p>
						{mailto address=$contactEmail encode='javascript'}
					</p>
				{/if}
			</div>
		{/if}

        {* Technical Contact *}
        {if $supportName || $supportPhone || $supportEmail}
			<div class="contact-info-container mb-4">
				<h3>{translate key="about.contact.supportContact"}</h3>

                {if $supportName}
					<p>
                        {$supportName|escape}
					</p>
                {/if}

                {if $supportPhone}
					<p>
							<span class="label">
								{translate key="about.contact.phone"}
							</span>
						<span class="value">
								{$supportPhone|escape}
							</span>
					</p>
                {/if}

                {if $supportEmail}
					<p>
                        {mailto address=$supportEmail encode='javascript'}
					</p>
                {/if}
			</div>
		{/if}
	</div>
</div>

{include file="frontend/components/footer.tpl"}

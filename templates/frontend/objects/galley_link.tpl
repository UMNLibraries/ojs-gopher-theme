{**
 * templates/frontend/objects/galley_link.tpl
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of a galley object as a link to view or download the galley, to be used
 *  in a list of galleys.
 *
 * @uses $galley Galley
 * @uses $parent Issue|Article Object which these galleys are attached to
 * @uses $publication Publication Optionally the publication (version) to which this galley is attached
 * @uses $isSupplementary bool Is this a supplementary file?
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $restrictOnlyPdf bool Is access only restricted to PDF galleys?
 * @uses $purchaseArticleEnabled bool Can this article be purchased?
 * @uses $currentJournal Journal The current journal context
 * @uses $journalOverride Journal An optional argument to override the current
 *       journal with a specific context
 *}

{* Override the $currentJournal context if desired *}
{if $journalOverride}
    {assign var="currentJournal" value=$journalOverride}
{/if}

{* Determine galley type and URL op *}
{if $galley->isPdfGalley()}
    {assign var="type" value="pdf"}
{else}
    {assign var="type" value="file"}
{/if}

{* Get page and parentId for URL *}
{if $parent instanceOf Issue}
    {assign var="page" value="issue"}
    {assign var="parentId" value=$parent->getBestIssueId()}
    {assign var="path" value=$parentId|to_array:$galley->getBestGalleyId()}
{else}
    {assign var="page" value="article"}
    {assign var="parentId" value=$parent->getBestId()}
    {* Get a versioned link if we have an older publication *}
    {if $publication && $publication->getId() !== $parent->getCurrentPublication()->getId()}
        {assign var="path" value=$parentId|to_array:"version":$publication->getId():$galley->getBestGalleyId()}
    {else}
        {assign var="path" value=$parentId|to_array:$galley->getBestGalleyId()}
    {/if}
{/if}

{* Get user access flag *}
{if !$hasAccess}
    {if $restrictOnlyPdf && $type=="pdf"}
        {assign var=restricted value="1"}
    {elseif !$restrictOnlyPdf}
        {assign var=restricted value="1"}
    {/if}
{/if}

{* Determine if button should take up full width if space *}
{if !$fullWidthStacking}
	{assign var=fullWidthStacking value=false}
{/if}

{* Don't be frightened. This is just a link *}
{* TODO: Add btn class `{if $restricted} restricted{/if}` to flag galley as restricted *}
<a class="btn btn-primary small article-btn {if $fullWidthStacking}w-100 mt-2{/if}" href="{url page=$page op="view" path=$path}"{if $labelledBy} aria-labelledby={$labelledBy}{/if}>
	{if $type=="pdf"}<i class="fa-solid fa-file-pdf"></i>{/if}

	{* Add some screen reader text to indicate if a galley is restricted *}
    {if $restricted}
		<span class="visually-hidden">
			{if $purchaseArticleEnabled}
                {translate key="reader.subscriptionOrFeeAccess"}
            {else}
                {translate key="reader.subscriptionAccess"}
            {/if}
		</span>
    {/if}

	{$galley->getGalleyLabel()|escape}

	{* TODO: Implement styling for this if necessary *}
    {if $restricted && $purchaseFee && $purchaseCurrency}
		<span class="purchase_cost">
			{translate key="reader.purchasePrice" price=$purchaseFee currency=$purchaseCurrency}
		</span>
    {/if}
</a>

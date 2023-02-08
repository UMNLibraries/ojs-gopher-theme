{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showDatePublished bool Show the date this article was published?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 * @uses $heading string HTML heading element, default: h2
 *}
{assign var=articlePath value=$article->getBestId()}
{if !$isFirstItem}
	{assign var="isFirstItem" value=false}
{/if}

{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
    {assign var="showAuthor" value=true}
{/if}

{assign var=publication value=$article->getCurrentPublication()}

<div class="row {if !$isFirstItem}pt-4{/if}">
	{* TODO: Publication cover image *}
	<div class="col-md-10">
		{* Title *}
		<p class="mb-0 text-primary">
			<a class="heading-link" id="article-{$article->getId()}" {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if}>
				{$article->getLocalizedTitle()|strip_unsafe_html}
				{if $article->getLocalizedSubtitle()}
					<span class="subtitle">
						{$article->getLocalizedSubtitle()|escape}
					</span>
				{/if}
			</a>
		</p>

		{* Authors *}
		{if $showAuthor}
			<p class="mb-0 mb-md-1 ">{$article->getAuthorString()|escape}</p>
		{/if}
	</div>

	{* Page numbers for this article *}
	{if $article->getPages()}
		<div class="col-md-2 text-md-end text-start">
			<p class="mb-1 mb-md-0">{$article->getPages()|escape}</p>
		</div>
	{/if}

	{* TODO: See if date published should apepar anywhere here *}
</div>
{if !$hideGalleys}
	<div class="container px-0">
        {foreach from=$article->getGalleys() item=galley}
			{if $primaryGenreIds}
				{assign var="file" value=$galley->getFile()}
				{if !$galley->getRemoteUrl() && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
					{continue}
				{/if}

                {assign var="hasArticleAccess" value=$hasAccess}
                {if $currentContext->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN || $publication->getData('accessStatus') == $smarty.const.ARTICLE_ACCESS_OPEN}
                    {assign var="hasArticleAccess" value=1}
                {/if}
                {include file="frontend/objects/galley_link.tpl" parent=$article labelledBy="article-{$article->getId()}" hasAccess=$hasArticleAccess purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
			{/if}
		{/foreach}
	</div>
{/if}

{* TODO: See what to do about `	{call_hook name="Templates::Issue::Issue::Article"}` *}

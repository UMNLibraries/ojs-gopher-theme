{**
 * templates/frontend/objects/article_details.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article which displays all details about the article.
 *  Expected to be primary object on the page.
 *
 * Many journals will want to add custom data to this object, either through
 * plugins which attach to hooks on the page or by editing the template
 * themselves. In order to facilitate this, a flexible layout markup pattern has
 * been implemented. If followed, plugins and other content can provide markup
 * in a way that will render consistently with other items on the page. This
 * pattern is used in the .main_entry column and the .entry_details column. It
 * consists of the following:
 *
 * <!-- Wrapper class which provides proper spacing between components -->
 * <div class="item">
 *     <!-- Title/value combination -->
 *     <div class="label">Abstract</div>
 *     <div class="value">Value</div>
 * </div>
 *
 * All styling should be applied by class name, so that titles may use heading
 * elements (eg, <h3>) or any element required.
 *
 * <!-- Example: component with multiple title/value combinations -->
 * <div class="item">
 *     <div class="sub_item">
 *         <div class="label">DOI</div>
 *         <div class="value">12345678</div>
 *     </div>
 *     <div class="sub_item">
 *         <div class="label">Published Date</div>
 *         <div class="value">2015-01-01</div>
 *     </div>
 * </div>
 *
 * <!-- Example: component with no title -->
 * <div class="item">
 *     <div class="value">Whatever you'd like</div>
 * </div>
 *
 * Core components are produced manually below, but can also be added via
 * plugins using the hooks provided:
 *
 * Templates::Article::Main
 * Templates::Article::Details
 *
 * @uses $article Submission This article
 * @uses $publication Publication The publication being displayed
 * @uses $firstPublication Publication The first published version of this article
 * @uses $currentPublication Publication The most recently published version of this article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $categories Category The category this article is assigned to
 * @uses $primaryGalleys array List of article galleys that are not supplementary or dependent
 * @uses $supplementaryGalleys array List of article galleys that are supplementary
 * @uses $keywords array List of keywords assigned to this article
 * @uses $pubIdPlugins Array of pubId plugins which this article may be assigned
 * @uses $licenseTerms string License terms.
 * @uses $licenseUrl string URL to license. Only assigned if license should be
 *   included with published submissions.
* @uses $ccLicenseBadge string An image and text with details about the license
 *}
<article class="container mt-4 mt-md-5 px-4">
	<div class="row flex-column-reverse flex-md-row g-md-5">
		{* Left sidebar *}
		<div class="col-xxl-3 col-md-4 sidebar-left">
			{* Article/Issue cover image *}
            {if $publication->getLocalizedData('coverImage') || ($issue && $issue->getLocalizedCoverImage())}
				{if $publication->getLocalizedData('coverImage')}
					{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
					<img
						src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
						alt="{$coverImage.altText|escape|default:''}"
						class="img-fluid d-block mx-auto"
					>
				{else}
					<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
						<img
							src="{$issue->getLocalizedCoverImageUrl()|escape}"
							alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}"
							class="img-fluid d-block mx-auto"
						>
					</a>
					{/if}
			{/if}

			{* Article Galleys *}
			{if $primaryGalleys}
				{foreach from=$primaryGalleys item=galley}
                    {include file="frontend/objects/galley_link.tpl" parent=$article publication=$publication galley=$galley purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency') fullWidthStacking=true}
				{/foreach}
			{/if}
			{* TODO: Should supplementary galleys be labeled as such with a heading? *}
			{if $supplementaryGalleys}
				{foreach from=$supplementaryGalleys item=galley}
                    {include file="frontend/objects/galley_link.tpl" parent=$article publication=$publication galley=$galley isSupplementary="1" fullWidthStacking=true}
				{/foreach}
			{/if}

			{* Dates and versions *}
			{if $publication->getData('datePublished')}
				<div class="container px-0 mt-4">
					<h4>{translate key="submissions.published"}</h4>
					<p>
						{* If this is the original version *}
                        {if $firstPublication->getID() === $publication->getId()}
							{$firstPublication->getData('datePublished')|date_format:$dateFormatShort}
                            {* If this is an updated version *}
                        {else}
							{translate key="submission.updatedOn" datePublished=$firstPublication->getData('datePublished')|date_format:$dateFormatShort dateUpdated=$publication->getData('datePublished')|date_format:$dateFormatShort}
                        {/if}
					</p>
				</div>

				{if count($article->getPublishedPublications()) > 1}
					<div class="container px-0 mt-4">
						<h4>{translate key="submission.versions"}</h4>
						<ul class="list-unstyled">
                            {foreach from=array_reverse($article->getPublishedPublications()) item=iPublication}
                                {capture assign="name"}{translate key="submission.versionIdentity" datePublished=$iPublication->getData('datePublished')|date_format:$dateFormatShort version=$iPublication->getData('version')}{/capture}
								<li>
                                    {if $iPublication->getId() === $publication->getId()}
                                        {$name}
                                    {elseif $iPublication->getId() === $currentPublication->getId()}
										<a href="{url page="article" op="view" path=$article->getBestId()}">{$name}</a>
                                    {else}
										<a href="{url page="article" op="view" path=$article->getBestId()|to_array:"version":$iPublication->getId()}">{$name}</a>
                                    {/if}
								</li>
                            {/foreach}
						</ul>
					</div>
				{/if}
			{/if}

			{if $issue}
				<div class="container px-0 mt-4">
					<h4>{translate key="issue.issue"}</h4>
					<p>
						<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
							{$issue->getIssueIdentification()}
						</a>
					</p>
				</div>
			{/if}

			{if $section}
				<div class="container px-0 mt-4">
					<h4>{translate key="section.section"}</h4>
					<p>
						{$section->getLocalizedTitle()|escape}
					</p>
				</div>
			{/if}

			{if $categories}
				<div class="container px-0 mt-4">
					<h4>{translate key="category.category"}</h4>
					<ul class="list-unstyled">
                        {foreach from=$categories item=category}
							<li>
								<a href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()|escape}">
									{$category->getLocalizedTitle()|escape}
								</a>
							</li>
                        {/foreach}
					</ul>
				</div>
			{/if}

			{* PubIds (requires plugins) *}
            {foreach from=$pubIdPlugins item=pubIdPlugin}
                {if $pubIdPlugin->getPubIdType() == 'doi'}
                    {continue}
                {/if}

                {assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
				{if $pubId}
					<div class="container px-4 mt-4">
						<h4>{$pubIdPlugin->getPubIdDisplayType()|escape}</h4>
						<p>
                            {if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
								<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">
                                    {$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
								</a>
                            {else}
                                {$pubId|escape}
                            {/if}
						</p>
					</div>
				{/if}
			{/foreach}

            {* Licensing info *}
            {if $currentContext->getLocalizedData('licenseTerms') || $publication->getData('licenseUrl')}
				<div class="container px-0 mt-4">
					<h4>{translate key="submission.license"}</h4>
                    {if $publication->getData('licenseUrl')}
                        {if $ccLicenseBadge}
                            {if $publication->getLocalizedData('copyrightHolder')}
								<p>{translate key="submission.copyrightStatement" copyrightHolder=$publication->getLocalizedData('copyrightHolder') copyrightYear=$publication->getData('copyrightYear')}</p>
                            {/if}
                            {$ccLicenseBadge}
                        {else}
							<a href="{$publication->getData('licenseUrl')|escape}" class="copyright">
                                {if $publication->getLocalizedData('copyrightHolder')}
                                    {translate key="submission.copyrightStatement" copyrightHolder=$publication->getLocalizedData('copyrightHolder') copyrightYear=$publication->getData('copyrightYear')}
                                {else}
                                    {translate key="submission.license"}
                                {/if}
							</a>
                        {/if}
                    {/if}
                    {$currentContext->getLocalizedData('licenseTerms')}
				</div>
			{/if}

            {* How to cite *}
            {if $citation}
				<div class="container px-0 mt-4">
					<h4>{translate key="submission.howToCite"}</h4>
					<div id="citationOutput" role="region" aria-live="polite">
                        {$citation}
					</div>
					<div class="dropdown my-3">
						<button
								class="btn btn-secondary dropdown-toggle"
								id="citationFormatsDropdown"
								aria-controls="cslCitationFormats"
								aria-expanded="false"
								data-csl-dropdown="true"
								data-bs-toggle="dropdown"
								type="button"
						>
                            {translate key="submission.howToCite.citationFormats"}
						</button>
						<ul class="dropdown-menu" aria-labelledby="citationFormatsDropdown">
                            {foreach from=$citationStyles item="citationStyle"}
								<li>
									<a
											class="dropdown-item"
											aria-controls="citationOutput"
											href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}"
											data-load-citation
											data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}"
									>
                                        {$citationStyle.title|escape}
									</a>
								</li>
                            {/foreach}
                            {if count($citationDownloads)}
								<li><hr class="dropdown-divider"></li>
								<li><span class="dropdown-item">{translate key="submission.howToCite.downloadCitation"}</span></li>
                                {foreach from=$citationDownloads item="citationDownload"}
									<li>
										<a
												class="dropdown-item"
												href="{url page="citationstylelanguage" op="download" path=$citationDownload.id params=$citationArgs}"
										>
											<span class="fa fa-download"></span>
                                            {$citationDownload.title|escape}
										</a>
									</li>
                                {/foreach}
                            {/if}
						</ul>
					</div>
				</div>
            {/if}

			<div class="container px-0 mt-4">
            	{call_hook name="Templates::Article::Details"}
			</div>
		</div>

		{* Main content *}
		<div class="col-xxl-9 col-md-8 ps-md-4 mb-4 mb-md-0">
			{* Heading *}
			<h2>
				{$publication->getLocalizedTitle()|escape}
			</h2>
			{if $publication->getLocalizedData('subtitle')}
				<h2 class="normal">
					{$publication->getLocalizedData('subtitle')|escape}
				</h2>
			{/if}

			{* Authors *}
			{if $publication->getData('authors')}
				{foreach from=$publication->getData('authors') item=author}
					{assign var=hasSubInfo value=($author->getLocalizedData('affiliation')||$author->getData('orcid'))}
					<p class="bold {if $hasSubInfo}mb-0{/if}">
						{$author->getFullName()|escape}
					</p>
					{* TODO: Confirm ROR looks as intendend*}
					{if $author->getLocalizedData('affiliation')}
						<p>
							{$author->getLocalizedData('affiliation')|escape}
							{if $author->getData('rorId')}
								<a href="{$author->getData('rorId')|escape}">{$rorIdIcon}</a>
							{/if}
						</p>
					{/if}
					{* TODO: Confirm ORCID looks as intended *}
					{if $author->getData('orcid')}
						<p class="orcid">
							{$orcidIcon}
							<a href="{$author->getData('orcid')|escape}" target="_blank">
								{$author->getData('orcid')|escape}
							</a>
						</p>
					{/if}
				{/foreach}
			{/if}

			{* DOI (requires plugin) *}
			{foreach from=$pubIdPlugins item=pubIdPlugin}
				{if $pubIdPlugin->getPubIdType() != 'doi'}
					{continue}
				{/if}
				{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
				{if $pubId}
					{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
					<p>
						<span class="bold">
							{capture assign=translatedDOI}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
							{translate key="semicolon" label=$translatedDOI}
						</span>
						<a href="{$doiUrl}">
							{$doiUrl}
						</a>
					</p>
				{/if}
			{/foreach}

			{* Keywords *}
			{if !empty($publication->getLocalizedData('keywords'))}
				<p>
					<span class="bold">
						{capture assign=translatedKeywords}{translate key="article.subject"}{/capture}
						{translate key="semicolon" label=$translatedKeywords}
					</span>
					{foreach name="keywords" from=$publication->getLocalizedData('keywords') item="keyword"}
						{$keyword|escape}{if !$smarty.foreach.keywords.last}{translate key="common.commaListSeparator"}{/if}
					{/foreach}
				</p>
			{/if}

			{* Abstract *}
			{if $publication->getLocalizedData('abstract')}
				<hr class="mt-5">
				<h3>{translate key="article.abstract"}</h3>
				{$publication->getLocalizedData('abstract')|strip_unsafe_html}
			{/if}

			{call_hook name="Templates::Article::Main"}

            {* Author biographies *}
            {assign var="hasBiographies" value=0}
            {foreach from=$publication->getData('authors') item=author}
                {if $author->getLocalizedData('biography')}
                    {assign var="hasBiographies" value=$hasBiographies+1}
                {/if}
            {/foreach}
			{if $hasBiographies}
				<hr class="mt-5">
				<h3>
                    {if $hasBiographies > 1}
                        {translate key="submission.authorBiographies"}
                    {else}
                        {translate key="submission.authorBiography"}
                    {/if}
				</h3>
            	{foreach from=$publication->getData('authors') item=author}
            		{if $author->getLocalizedData('biography')}
						<h4 class="article-details-biography">
                            {if $author->getLocalizedData('affiliation')}
                                {capture assign="authorName"}{$author->getFullName()|escape}{/capture}
                                {capture assign="authorAffiliation"}<span class="affiliation">{$author->getLocalizedData('affiliation')|escape}</span>{/capture}
                                {translate key="submission.authorWithAffiliation" name=$authorName affiliation=$authorAffiliation}
                            {else}
                                {$author->getFullName()|escape}
                            {/if}
						</h4>
                        {$author->getLocalizedData('biography')|strip_unsafe_html}
					{/if}
				{/foreach}
			{/if}

			{* References *}
			{if $parsedCitations || $publication->getData('citationsRaw')}
				<hr class="mt-5">
				<h3>{translate key="submission.citations"}</h3>
				{if $parsedCitations}
					{foreach from=$parsedCitations item="parsedCitation"}
						<p>{$parsedCitation->getCitationWithLinks()|strip_unsafe_html} {call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
					{/foreach}
				{else}
                    {$publication->getData('citationsRaw')|escape|nl2br}
				{/if}
			{/if}
		</div>
	</div>
</article>

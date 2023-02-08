{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{include file="frontend/components/header.tpl"}

{if $about}
	<div class="container mt-4 mt-md-5 px-4">
		<div class="row">
			{$about}
		</div>
	</div>
{/if}
<div class="container pt-4 px-4 border-top">
	<h2 class="visually-hidden">
		{translate key="context.contexts"}
	</h2>
	{if !$journals|@count}
		<p>{translate key="site.noJournals"}</p>
	{else}
		<ul class="list-unstyled">
			{foreach from=$journals item=journal}
                {capture assign="url"}{url journal=$journal->getPath()}{/capture}
                {assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
                {assign var="description" value=$journal->getLocalizedDescription()}
				<li class="row">
					{if $thumb}
						<div class="col-xl-2 col-lg-4 col-md-5 mb-3 mb-md-0">
							<a href="{$url|escape}">
								<img
									class="w-100 img-cover"
									src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"
									{if $thumb.altText} alt="{$thumb.altText|escape|default:''}"{/if}
								>
							</a>
						</div>
					{/if}

					<div class="{if $thumb}col-xl-10 col-lg-8 col-md-7{/if}">
						<h3>
							<a class="heading-link" href="{$url|escape}" rel="bookmark">
								{$journal->getLocalizedName()}
							</a>
						</h3>

						{if $description}
							{$description}
						{/if}

						<ul class="list-unstyled site-index-quick-links">
							<li>
								<a href="{$url|escape}">
									{translate key="site.journalView"}
								</a>
							</li>
							<li>
								<a href="{url|escape journal=$journal->getPath() page="issue" op="current"}">
									{translate key="site.journalCurrent"}
								</a>
							</li>
						</ul>
					</div>
				</li>
				{if !$journal@last}
					<hr class="my-4">
				{/if}
			{/foreach}
		</ul>
	{/if}
</div>

{include file="frontend/components/footer.tpl"}

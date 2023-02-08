{**
 * templates/frontend/objects/announcement_summary.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a summary view of an announcement
 *
 * @uses $announcement Announcement The announcement to display
 * @uses $heading string HTML heading element, default: h2
 *}

<article class="row pt-4">
	<h3>
		<a class="heading-link" href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
            {$announcement->getLocalizedTitle()|escape}
		</a>
	</h3>

	<div class="small">
		<i class="fa-solid fa-calendar pe-2"></i>
        {$announcement->getDatePosted()|date_format:$dateFormatShort}
	</div>

	<div class="mt-2">
	    {$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
		<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}" class="read_more">
			<span aria-hidden="true" role="presentation">
				{translate key="common.readMore"}
			</span>
			<span class="visually-hidden">
				{translate key="common.readMoreWithTitle" title=$announcement->getLocalizedTitle()|escape}
			</span>
		</a>
	</div>
</article>

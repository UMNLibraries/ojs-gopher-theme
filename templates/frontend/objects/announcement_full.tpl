{**
 * templates/frontend/objects/announcement_full.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the full view of an announcement, when the announcement is
 *  the primary element on the page.
 *
 * @uses $announcement Announcement The announcement to display
 *}

<article class="container mt-4 mt-md-5 px-4">
	<h2>
		{$announcement->getLocalizedTitle()|escape}
	</h2>

	<div>
		<i class="fa-solid fa-calendar pe-2"></i>
		{$announcement->getDatePosted()|date_format:$dateFormatShort}
	</div>
	<div class="row mt-4">
        {if $announcement->getLocalizedDescription()}
            {$announcement->getLocalizedDescription()|strip_unsafe_html}
        {else}
            {$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
        {/if}
	</div>

</article>

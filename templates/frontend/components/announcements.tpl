{**
 * templates/frontend/components/announcements.tpl
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of announcements
 *
 * @uses $announcements array List of announcements
 *}

<ul class="list-unstyled">
	{foreach from=$announcements item=announcement}
		<li>
			{include file="frontend/objects/announcement_summary.tpl"}
		</li>
	{/foreach}
</ul>

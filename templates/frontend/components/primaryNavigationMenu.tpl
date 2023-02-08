{**
 * templates/frontend/components/primaryNavigationMenu.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Primary navigation menu list for OJS
 *
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}
{if $navigationMenu}
	<ul id="{$id|escape}" class="navbar-nav">
		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{* Skip undisplayed menu items *}
			{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				{continue}
			{/if}
			{* Menu items with children *}
			{if $navigationMenuItemAssignment->navigationMenuItem->getIsChildVisible()}
				<li class="nav-item dropdown">
					<a
						id="{$field}"
						class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"
						aria-expanded="false"
						role="button"
						href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}"
					>
						{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
					</a>
				 	{* Children Items *}
					<ul class="dropdown-menu" aria-labelledby="{$field}">
						{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
							{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
								<li>
									<a
										class="dropdown-item"
										href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}"
									>
										{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
									</a>
								</li>
							{/if}
						{/foreach}
					</ul>
				</li>
			{else}
				<li class="nav-item">

				</li>
				<a class="nav-link" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">
					{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
				</a>
			{/if}
		{/foreach}
	</ul>
{/if}

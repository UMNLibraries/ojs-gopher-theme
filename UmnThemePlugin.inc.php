<?php

/**
 * @file plugins/themes/umn/UmnThemePlugin.inc.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class UmnThemePlugin
 * @ingroup plugins_themes_umn
 *
 * @brief UMN theme
 */

import('lib.pkp.classes.plugins.ThemePlugin');

class UmnThemePlugin extends ThemePlugin
{
	/**
	 * The primary method themes should use to add styles, scripts and fonts,
	 * or register hooks. This method is only fired for the currently active
	 * theme.
	 *
	 * @return void
	 */
	public function init()
	{
		$this->addMenuArea(['primary', 'user']);
	}

	/**
	 * Get the display name for this plugin.
	 *
	 * @return string
	 */
	public function getDisplayName()
	{
		return __('plugins.themes.umn.name');
	}

	/**
	 * Get a description of this plugin.
	 *
	 * @return string
	 */
	public function getDescription()
	{
		return __('plugins.themes.umn.description');
	}

}

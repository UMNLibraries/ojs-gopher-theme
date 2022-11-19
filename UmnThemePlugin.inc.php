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

		// CSS and JS
		// TODO: Uncommented for dev
//		$this->addStyle(
//			'font-body',
//			"https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300;400;500;600;700;800&display=swap",
//			['baseUrl' => '']
//		);

		// TODO: Should use minified version instead
		$this->addStyle('font-awesome', 'css/fa_all.css');
		$this->addStyle('bootstrap-css', 'css/bootstrap.min.css');
		$this->addStyle('custom-css', 'css/custom.css');

		$this->addScript('jquery', 'js/jquery.js');

		// TODO: Should point to CDN minified version rather than local
		$this->addScript('bootstrap-js', 'js/bootstrap.bundle.min.js');
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

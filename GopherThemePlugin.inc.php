<?php

/**
 * @file plugins/themes/gopher/GopherThemePlugin.inc.php
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class GopherThemePlugin
 * @ingroup plugins_themes_gopher
 *
 * @brief Gopher theme
 */

import('lib.pkp.classes.plugins.ThemePlugin');

class GopherThemePlugin extends ThemePlugin
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
		$this->addOption('baseColour', 'FieldColor', [
			'label' => __('plugins.themes.gopher.option.colour.label'),
			'description' => __('plugins.themes.gopher.option.colour.description'),
			'default' => '#7a0019'
		]);

		$this->addOption('additionalFooterInfo', 'FieldRichTextarea', [
			'label' => __('plugins.themes.gopher.option.footerInfo.label'),
			'description' => __('plugins.themes.gopher.option.footerInfo.description'),
		]);

		$this->addMenuArea(['primary', 'user']);

		// CSS and JS
		$this->addStyle(
			'font-body',
			"https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300;400;500;600;700;800&display=swap",
			['baseUrl' => '']
		);

		$this->addStyle('font-awesome', 'css/fa_all.min.css');
		$this->addStyle('font-face', 'css/v4-font-face.css');
		$this->addStyle('bootstrap-css', 'css/bootstrap.min.css');
		$this->addStyle('custom-css', 'css/custom.css');
		$themeColor = $this->getOption('baseColour');
		$this->addStyle(
			'colors',
			":root { --color-primary: $themeColor;}",
			[
				'inline' => true,
			],
		);

		$this->addScript('jquery', 'js/jquery.js');

		// FIXME: Could point to CDN minified version rather than local
		$this->addScript('bootstrap-js', 'js/bootstrap.bundle.min.js');
		$this->addScript('custom-js', 'js/custom.js');

		HookRegistry::register('TemplateManager::display', [$this, 'siteWideData']);
	}

	/**
	 * Get the display name for this plugin.
	 *
	 * @return string
	 */
	public function getDisplayName()
	{
		return __('plugins.themes.gopher.name');
	}

	/**
	 * Get a description of this plugin.
	 *
	 * @return string
	 */
	public function getDescription()
	{
		return __('plugins.themes.gopher.description');
	}

	/**
	 * Injects data that is accessible site-wide into the template manager
	 *
	 * @param $hookName string
	 * @param $args array [
	 * 		@option TemplateManager
	 * 		@option string relative path to the template
	 * ]
	 */
	public function siteWideData($hoodName, $args)
	{
		$templateMgr = $args[0];
		$request = Application::get()->getRequest();
		$site = $request->getSite();

		$issueDao = DAORegistry::getDAO("IssueDAO");
		$journal = $request->getContext();
		$currentIssue = null;
		if ($journal)
			$currentIssue = $issueDao->getCurrent($journal->getId());

		$templateMgr->assign(array(
			'siteWideDisplayPageHeaderLogo' => $site->getLocalizedData('pageHeaderTitleImage'),
			'siteWideDisplayPageHeaderLogoAltText' => $site->getLocalizedData('pageHeaderLogoImageAltText'),
			'currentIssue' => $currentIssue,
		));
	}
}

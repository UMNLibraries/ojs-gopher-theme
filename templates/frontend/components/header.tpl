{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2023 Simon Fraser University
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *}

<!doctype html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body>
{* Branded Header & Navbar *}
<section class="header container-fluid py-4">
	<div class="container px-3 px-md-4">
		<div class="row align-items-center align-items-md-start">
			<div class="col-sm-5 ps-md-3 p-0"><img src="{$sitePublicFilesDir}/{$siteWideDisplayPageHeaderLogo.uploadName|escape:"url"}" alt="{$siteWideDisplayPageHeaderLogoAltText|escape}" class="img-fluid"></div>
			<div class="col-sm-7 text-end right-col pe-0 pe-md-2 mt-sm-0 mt-4">
				{load_menu name="user" path="frontend/components/userNavigationMenu.tpl"}
			</div>
		</div>
	</div>
</section>

<section class="container shadow p-0">
	<div class="container page-header py-3 py-lg-4 px-4">
		{capture assign="homeUrl"}
			{url page="index" router=$smarty.const.ROUTE_PAGE}
		{/capture}
		<h1>
            {if $currentContext}
				<a class="heading-link" href="{$homeUrl}"}>
                	{$displayPageHeaderTitle|escape}
				</a>
            {else}
				<a class="heading-link" href="{$homeUrl}"}>
                	{$siteTitle|escape}
				</a>
            {/if}
		</h1>
	</div>
	<div class="container border-bottom menu-row px-xl-4 px-2 position-relative">
		<nav class="navbar navbar-expand-xl navbar-dark">
			<div class="container-fluid p-0">
				<button
					class="navbar-toggler"
					type="button"
					data-bs-toggle="collapse"
					data-bs-target="#collapsibleNavbar"
					aria-controls="collapsibleNavbar"
					aria-expanded="false"
					aria-label="Toggle navigation"
				>
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
                    {load_menu name="primary" path="frontend/components/primaryNavigationMenu.tpl"}
				</div>
			</div>
		</nav>
		{* Search button *}
		{if $currentContext && $requestedPage !== 'serach'}
			<a href="{url page="search"}" class="btn btn-primary small">{translate key="common.search"}</a>
		{/if}
	</div>

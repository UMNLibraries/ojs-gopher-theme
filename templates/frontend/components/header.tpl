{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
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
			<div class="col-sm-5 ps-md-3 p-0"><img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" alt="" class="img-fluid"></div>
			<div class="col-sm-7 text-end right-col pe-0 pe-md-2 mt-sm-0 mt-4">
				<a href="#">Login</a>
				<a href="#">Register</a>
				<a href="#" class="dropdown-toggle" data-bs-toggle="dropdown"> User Name</a>
				<div class="user-details">
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Dashboard</a></li>
						<li><a class="dropdown-item" href="#">View Profile</a></li>
						<li><a class="dropdown-item" href="#">Administration</a></li>
						<li><a class="dropdown-item" href="#">Logout</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="container shadow p-0">
	<div class="container page-header py-3 py-lg-4 px-4">
		<h1>Journal Name (as entered in metadata - H1)</h1>
	</div>
	<div class="container border-bottom menu-row px-xl-4 px-2 position-relative">
		<nav class="navbar navbar-expand-xl navbar-dark">
			<div class="container-fluid p-0">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="#">CURRENT ISSUE</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">PAST ISSUES</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">About</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Policies</a></li>
								<li><a class="dropdown-item" href="#">Mission</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">ANNOUNCEMENTS</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">SUBMISSIONS</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">AUTHOR & REVIEWER ACCOUNTS</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<a href="#" class="btn btn-primary small">Search</a>
	</div>

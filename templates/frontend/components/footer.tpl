{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *}


<div class="container border-top mt-5 px-4 pb-4">
	<div class="row mt-4 footer-additional-content">
		<div class="col-md-6">
			<p>Additional Content - embeds, widgets, images, maps, social media feeds</p>
		</div>
		<div class="col-md-6 border-start ps-md-5">
			<p>Additional Content - embeds, widgets, images, maps, social media feeds</p>
		</div>
	</div>
</div>
</section>

<section class="footer container-fluid">
	<div class="container py-3">
		<div class="row">
			<div class="col-md-6">
				<p>Additional Text</p>
				<p>Copyright Notice</p>
			</div>
			<div class="col-md-6 text-md-end text-center">
				<img src="images/footer-logo.jpg" alt="" class="img-fluid">
			</div>
		</div>
	</div>
	<div class="row bottom-bar py-3"></div>
</section>

{load_script context="frontend"}

{* TODO: Where should this go and what does it load/add *}
{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>

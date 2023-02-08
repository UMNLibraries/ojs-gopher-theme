{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2000-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}

<div class="col-md-8 mt-4 mt-md-5 px-4">
	<h2 class="mb-5">
        {translate key="user.login"}
	</h2>

	{* A login message may be displayed if the user was redireceted to the
	login page from another request. Examples include if login is required
	before dowloading a file. *}
	{if $loginMessage}
		<p>
			{translate key=$loginMessage}
		</p>
	{/if}


	<form id="login" method="post" action="{$loginUrl}">
		{csrf}

		{if $error}
			<div class="alert alert-danger" role="alert">
				{translate key=$error reason=$reason}
			</div>
		{/if}

		<input type="hidden" name="source" value="{$source|escape}" />

		<div class="mb-3 mt-4">
			<label for="username" class="form-label">
				{translate key="user.username"}
				<span aria-hidden="true">*</span>
				<span class="visually-hidden">
					{translate key="common.required"}
				</span>
			</label>
			<input
				type="text"
				name="username"
				id="username"
				class="form-control"
				value="{$username|escape}"
				maxlength="32"
				required
				aria-required="true"
			/>
		</div>

		<div class="mb-3 mt-4">
			<label for="password" class="form-label">
				{translate key="user.password"}
				<span aria-hidden="true">*</span>
				<span class="visually-hidden">{translate key="common.required"}</span>
			</label>
			<input
				type="password"
				name="password"
				id="password"
				class="form-control"
				value="{$password|escape}"
				maxlength="32"
				required
				aria-required="true"
			/>
			<a href="{url page="login" op="lostPassword"}" class="small">
				{translate key="user.login.forgotPassword"}
			</a>
		</div>

		<div class="form-check my-4">
			<input
				class="form-check-input"
				type="checkbox"
				name="remember"
				id="remember"
				value="1"
				checked="{$remember}"
			/>
			<label class="form-check-label" for="remember">
				{translate key="user.login.rememberUsernameAndPassword"}
			</label>
		</div>

		<div class="d-flex">
			{if !$disableUserReg}
				{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
				<a class="btn btn-secondary d-table submit-btn small me-3" href="{$registerUrl}">
					{translate key="user.login.registerNewAccount"}
				</a>
			{/if}
			<button type="submit" class="btn btn-primary d-table submit-btn small">
				{translate key="user.login"}
			</button>
		</div>
	</form>
</div>

{include file="frontend/components/footer.tpl"}

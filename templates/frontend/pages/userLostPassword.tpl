{**
 * templates/frontend/pages/userLostPassword.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login.resetPassword"}

<div class="col-md-8 mt-4 mt-md-5 px-4">
    {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login.resetPassword"}

	<h2 class="mb-5">
		{translate key="user.login.resetPassword"}
	</h2>

	<p>{translate key="user.login.resetPasswordInstructions"}</p>

	<form id="lostPasswordForm" method="post" action="{url page="login" op="requestResetPassword"}">
		{csrf}

		{if $error}
			<div class="alert alert-danger" role="alert">
				{translate key=$error}
			</div>
		{/if}

		<div class="mb-3 mt-4">
			<label for="email" class="form-label">
				{translate key="user.login.registeredEmail"}
				<span aria-hidden="true">*</span>
				<span class="visually-hidden">
					{translate key="common.required"}
				</span>
			</label>
			<input
				type="email"
				name="email"
				id="email"
				class="form-control"
				value="{$email|escape}"
				required
				aria-required="true"
			/>
		</div>

		<div class="d-flex">
            {if !$disableUserReg}
                {capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
				<a class="btn btn-secondary d-table submit-btn small me-3" href="{$registerUrl}">
                    {translate key="user.login.registerNewAccount"}
				</a>
            {/if}
			<button
				class="btn btn-primary d-table submit-btn small"
				type="submit"
			>
                {translate key="user.login.resetPassword"}
			</button>
		</div>
	</form>
</div>

{include file="frontend/components/footer.tpl"}

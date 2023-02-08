{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Copyright (c) 2023 University of Minnesota
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the basic registration form fields
 *
 * @uses $locale string Locale key to use in the affiliate field
 * @uses $givenName string First name input entry if available
 * @uses $familyName string Last name input entry if available
 * @uses $countries array List of country options
 * @uses $country string The selected country if available
 * @uses $email string Email input entry if available
 * @uses $username string Username input entry if available
 *}

<fieldset form="register">
	<legend>
		<h3>
			{translate key="user.profile"}
		</h3>
	</legend>

	{* Given Name *}
	<div class="mb-3 mt-4">
		<label for="givenName" class="form-label">
			{translate key="user.givenName"}
			<span aria-hidden="true">*</span>
			<span class="visually-hidden">
				{translate key="common.required"}
			</span>
		</label>
		<input
			class="form-control"
			type="text"
			name="givenName"
			autocomplete="given-name"
			id="givenName"
			value="{$givenName|escape}"
			maxlength="255"
			required
			aria-required="true"
		/>
	</div>

	{* Family Name *}
	<div class="mb-3 mt-4">
		<label for="familyName" class="form-label">
            {translate key="user.familyName"}
		</label>
		<input
			class="form-control"
			type="text"
			name="familyName"
			autocomplete="family-name"
			id="familyName"
			value="{$familyName|escape}"
			maxlength="255"
		/>
	</div>

    {* Affiliation *}
	<div class="mb-3 mt-4">
		<label for="affiliation" class="form-label">
            {translate key="user.affiliation"}
		</label>
		<input
			class="form-control"
			type="text"
			name="affiliation"
			autocomplete="family-name"
			id="affiliation"
			value="{$affiliation|escape}"
			maxlength="255"
		/>
	</div>

	{* Country *}
	<div class="mb-3 mt-4">
		<label for="country" class="form-label">
			{translate key="common.country"}
			<span aria-hidden="true">*</span>
			<span class="visually-hidden">
				{translate key="common.required"}
			</span>
		</label>
		<select
			class="form-select"
			name="country"
			id="country"
			required
			aria-required="true"
		>
			<option></option>
			{html_options options=$countries selected=$country}
		</select>
	</div>
</fieldset>

<fieldset form="register">
	<legend>
		<h3 class="mt-5">
            {translate key="user.login"}
		</h3>
	</legend>

	{* Email *}
	<div class="mb-3 mt-4">
		<label for="email" class="form-label">
            {translate key="user.email"}
			<span aria-hidden="true">*</span>
			<span class="visually-hidden">
				{translate key="common.required"}
			</span>
		</label>
		<input
			class="form-control"
			type="email"
			name="email"
			autocomplete="email"
			id="email"
			value="{$email|escape}"
			maxlength="90"
			required
			aria-required="true"
		/>
	</div>

	{* Username *}
	<div class="mb-3 mt-4">
		<label for="username" class="form-label">
            {translate key="user.username"}
			<span aria-hidden="true">*</span>
			<span class="visually-hidden">
				{translate key="common.required"}
			</span>
		</label>
		<input
			class="form-control"
			type="text"
			name="username"
			autocomplete="username"
			id="username"
			value="{$username|escape}"
			maxlength="32"
			required
			aria-required="true"
		/>
	</div>

	{* Password *}
	<div class="mb-3 mt-4">
		<label for="password" class="form-label">
            {translate key="user.password"}
			<span aria-hidden="true">*</span>
			<span class="visually-hidden">
				{translate key="common.required"}
			</span>
		</label>
		<input
			class="form-control"
			type="password"
			name="password"
			id="password"
			maxlength="32"
			required
			aria-required="true"
		/>
	</div>

    {* Password repeat *}
	<div class="mb-3 mt-4">
		<label for="password2" class="form-label">
            {translate key="user.repeatPassword"}
			<span aria-hidden="true">*</span>
			<span class="visually-hidden">
				{translate key="common.required"}
			</span>
		</label>
		<input
			class="form-control"
			type="password"
			name="password2"
			id="password2"
			maxlength="32"
			required
			aria-required="true"
		/>
	</div>
</fieldset>

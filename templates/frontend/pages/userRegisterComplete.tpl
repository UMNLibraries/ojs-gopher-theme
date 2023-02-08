{**
 * templates/frontend/pages/userRegisterComplete.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2000-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief A landing page displayed to users upon successful registration
 *}
{include file="frontend/components/header.tpl"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}

<div class="container mt-4 mt-md-5 px-4">
	<h2>
		{translate key=$pageTitle}
	</h2>

	<div class="row">
		<ul>
            {if array_intersect(array(ROLE_ID_MANAGER, ROLE_ID_SUB_EDITOR, ROLE_ID_ASSISTANT, ROLE_ID_REVIEWER), (array)$userRoles)}
				<li>
					<a href="{url page="submissions"}">
                        {translate key="user.login.registrationComplete.manageSubmissions"}
					</a>
				</li>
			{/if}

			{if $currentContext}
				<li>
					<a href="{url page="submission" op="wizard"}">
						{translate key="user.login.registrationComplete.newSubmission"}
					</a>
				</li>
			{/if}

			<li>
				<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="profile"}">
                    {translate key="user.editMyProfile"}
				</a>
			</li>
			<li>
				<a href="{url page="index"}">
                    {translate key="user.login.registrationComplete.continueBrowsing"}
				</a>
			</li>
		</ul>
	</div>
</div>

{include file="frontend/components/footer.tpl"}

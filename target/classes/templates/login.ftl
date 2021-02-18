<#import "parts/common.ftl" as c>
<#import "parts/loginmacro.ftl" as l>

<@c.page>
<h3>Login page</h3>

<#if message??>
	<div class="alert alert-warning mt-2" role="alert">
		 ${message}
	</div>
</#if>

<@l.login path="/login" act="Sign In"/>

</@c.page>
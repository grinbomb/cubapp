<#macro login path act>


<form action="${path}" method="post">
  <div class="form-group">
    <label for="username">User Name:</label>
    <div class="col-sm-6">
    	<input type="text" class="form-control" name="username" id="username" aria-describedby="usernamehelp" placeholder="Enter User Name" value="<#if username??>${username}</#if>">
    </div>
    <div class="col-sm-6">
    <#if errorUsername??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorUsername}
			</div>
		</#if>
	</div>
  </div>
  <div class="form-group">
    <label for="password">Password:</label>
    <div class="col-sm-6">
    	<input type="password" class="form-control" name="password" id="password" placeholder="Enter password" value="<#if password??>${password}</#if>">
    </div>
    <div class="col-sm-6">
    <#if errorPassword??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorPassword}
			</div>
		</#if>
	</div>
  </div>
  <#if act!="Sign In">
  <div class="form-group">
    <label for="email">Email:</label>
    <div class="col-sm-6">
    	<input type="email" class="form-control" name="email" id="email" placeholder="name@somemail.com" value="<#if email??>${email}</#if>">
    </div>
    <div class="col-sm-6">
    <#if errorEmail??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorEmail}
			</div>
		</#if>
		</div>
  </div>
  </#if>
  <input type="hidden" name="_csrf" value="${_csrf.token}" />
  <button type="submit" class="btn btn-primary">${act}</button>
  <#if act=="Sign In">
  	<a class="btn btn-primary" href="/registration" role="button">Registration</a>
  </#if>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <input type="submit" value="Sign Out"/>
</form>
</#macro>
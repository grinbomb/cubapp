<#import "parts/common.ftl" as c>

<@c.page>
<form action="/user" method="post">
  <div class="form-group">
    <label for="username">User Name:</label>
    <input type="text" class="form-control" name="username" id="username" aria-describedby="usernamehelp" value="${user.username}">
  </div>
  <label for="checkboxrole">Roles:</label>
  <#list roles as role>
  	<div class="form-check">
    	<input type="checkbox" class="form-check-input" id="checkboxrole" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
  	</div>
  </#list>
  <!-- <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" name="password" id="password" placeholder="Password">
  </div> -->
  <input type="hidden" name="_csrf" value="${_csrf.token}" />
  <input type="hidden" value="${user.id}" name="userId">
  <button type="submit" class="btn btn-primary">Save</button>
</form>
</@c.page>
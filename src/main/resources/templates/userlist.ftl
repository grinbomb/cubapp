<#import "parts/common.ftl" as c>

<@c.page>
<table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">Role</th>
    </tr>
  </thead>
  <tbody>
  	<#list users as user>
	    <tr>
	    <form method="post" action="/user/delete/${user.id}">
	      <th scope="row">${user.id}</th>
	      <td>${user.username}</td>
	      <td><#list user.roles as role>${role}<#sep>, </#list></td>
	      <td><a href="/user/${user.id}">edit</a></td>
	      <td>
			<input type="hidden" name="_csrf" value="${_csrf.token}" />
			<#if !user.isAdmin()>
				<input type="submit" class="btn btn-secondary" value="Delete">
			</#if>
		  </td>
		</form>
	    </tr>
    </#list>
  </tbody>
</table>
</@c.page>
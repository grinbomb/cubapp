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
	      <th scope="row">${user.id}</th>
	      <td>${user.username}</td>
	      <td><#list user.roles as role>${role}<#sep>, </#list></td>
	      <td><a href="/user/${user.id}">edit</a></td>
	    </tr>
    </#list>
  </tbody>
</table>
</@c.page>
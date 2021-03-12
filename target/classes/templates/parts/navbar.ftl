<#include "security.ftl">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/"><h1 class="text-hide" style="background-image: url('https://i.ibb.co/s3DLrRy/1.png'); width: 50px; height: 50px;">CuB</h1></a>
    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/calculator">Calculator</a>
            </li>
            <#if isAuthorized>
            <li class="nav-item">
                <a class="nav-link" href="/selectedmenu">Your menu</a>
            </li>
            </#if>
            <#if isAdmin>
	            <li class="nav-item">
	                <a class="nav-link" href="/createcard">Add new card</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="/user">User list</a>
	            </li>
            </#if>
        </ul>
        <span class="navbar-text">
      		<ul class="navbar-nav mr-auto">
      			<#if user??>
	      			<li>
	   			 		<a class="nav-link" href="/user/profile">${name}</a>
	   			 	</li>
   			 	</#if>
   			 	<#if !isAuthorized>
		            <li class="nav-item">
		                <a class="nav-link" href="/login">Sign In</a>
		            </li>
		        	<li class="nav-item">
		                <a class="nav-link">/</a>
	            	</li>
		            <li class="nav-item">
		                <a class="nav-link" href="/registration">Registration</a>
	            	</li>
	            </#if>
	            <#if isAuthorized>
	   			 	<li class="nav-item">
					    <form action="/logout" method="post">
					        <input type="hidden" name="_csrf" value="${_csrf.token}" />
					        <button type="submit" class="btn btn-secondary">Sign Out</button>
					    </form>
	   			 	</li>
   			 	</#if>
        	</ul>
    	</span>
    </div>
</nav>

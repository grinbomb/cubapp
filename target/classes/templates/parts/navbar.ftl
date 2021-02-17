<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">CUB</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/calculator">Calculator</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/createcard">Add new card</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user">User list</a>
            </li>
        </ul>
        <span class="navbar-text">
      		<ul class="navbar-nav mr-auto">
	            <li class="nav-item">
	                <a class="nav-link" href="/login">Sign In</a>
	            </li>
	        	<li class="nav-item">
	                <a class="nav-link">/</a>
            	</li>
	            <li class="nav-item">
	                <a class="nav-link" href="/registration">Registration</a>
            	</li>
            	<li class="nav-item">
				    <form action="/logout" method="post">
				        <input type="hidden" name="_csrf" value="${_csrf.token}" />
				        <button type="submit" class="btn btn-secondary">Sign Out</button>
				    </form>
   			 	</li>
        	</ul>
    	</span>
    </div>
</nav>

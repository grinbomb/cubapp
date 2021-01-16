<#macro category datatarget modelnameng changeng name>
<div data-toggle="collapse" data-target="#${datatarget}">
      			<div class="btn-group-toggle  mx-1" data-toggle="buttons">
  					<label class="btn btn-outline-light" style="color:black;">
    					<input type="checkbox" checked autocomplete="off" ng-model="${modelnameng}" ng-change="change('${changeng}')"> ${name}
  					</label>
				</div>
			</div>
</#macro>
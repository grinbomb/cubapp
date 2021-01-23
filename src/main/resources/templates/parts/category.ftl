<#macro category datatarget modelnameng indextoarray name productcategory>
<div data-toggle="collapse" data-target="#${datatarget}">
      			<div class="btn-group-toggle  mx-1" data-toggle="buttons">
  					<label class="btn btn-outline-light" style="color:black;">
    					<input type="checkbox" checked autocomplete="off" ng-model="${modelnameng}" ng-change="change('${indextoarray}','${productcategory}')"> ${name}
  					</label>
				</div>
			</div>
</#macro>
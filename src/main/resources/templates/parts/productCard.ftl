<#macro card idcss name productid>
  <div class="collapse" id="${idcss}">
		<h5>Choose what you like from the ${name} category:</h5>
		<div class="row">
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #B8DAFC;" ng-repeat="item in testeat[${productid}]">
  			<img class="card-img-top" src={{item.fileName}} alt="Card image cap" style="background-color: white;">
  				<div class="card-body" style="background-color: white;">
    				<h5 class="card-title">{{item.name}}</h5>
    				<p class="card-text">For example id is {{item.id}}</p>
  				</div>
  				<div class="card-footer" style="background-color: white;">
  					<div class="btn-group-toggle text-center" data-toggle="buttons">
  						<label class="btn btn-outline-success" style="min-width:80%;">
    						<input type="checkbox" autocomplete="off"> Select
  						</label>
					</div>
  				</div>
			</div>
		</div> 
	</div>
</#macro>
<#macro card idcss name indexfromarray meal>
  <div class="collapse" id="${idcss}">
		<h5>Choose what you like from the ${name} category:</h5>
		<div class="row">
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #B8DAFC;" ng-repeat="item in cards[${indexfromarray}]">
  			<img class="card-img-top" ng-src={{item.fileName}} alt="Card image cap" style="background-color: white;">
  				<div class="card-body" style="background-color: white;">
    				<h5 class="card-title">{{item.name}}</h5>
    				<div class="card-text" style="font-size:15px;">
					<table style="min-width:100%;">
						<tr>
					    	<td class="text-left">Calories</td><td class="text-right">{{(item.caloriesPG*${meal}recgram[item.id]).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					    	<td class="text-left">Proteins</td><td class="text-right">{{(item.proteinsPG*${meal}recgram[item.id]).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					    	<td class="text-left">Fats</td><td class="text-right">{{(item.fatsPG*${meal}recgram[item.id]).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					    	<td class="text-left">Carbohydrates</td><td class="text-right">{{(item.carbohydratesPG*${meal}recgram[item.id]).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					   		<td>Grams</td><td><input type="number" style="width:100%; text-align: right;" ng-model="${meal}recgram[item.id]" ng-change="recount(item.id, ${meal}recgram[item.id], '${meal}'); calculateEat(item.caloriesPG, ${meal}recgram[item.id], '${meal}', item.id);" ng-init="${meal}recgram[item.id]=1"></td>
					   	</tr>
					</table>
				</div>
  				</div>
  				<div class="card-footer" style="background-color: white;">
  					<div class="btn-group-toggle text-center" data-toggle="buttons">
  						<label class="btn btn-outline-success" style="min-width:80%;">
    						<input type="checkbox" autocomplete="off" ng-model="${meal}[item.id]" ng-change="calculateEat(item.caloriesPG, ${meal}recgram[item.id], '${meal}', item.id);" name="productCards" value="{{${meal}recgram[item.id]}},{{item.id}},${meal}" > Select
  						</label>
					</div>
  				</div>
			</div>
		</div> 
	</div>
</#macro>
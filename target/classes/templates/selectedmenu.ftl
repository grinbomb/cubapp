<#import "parts/common.ftl" as c>

<@c.page>
<form class="form-inline" method="post" enctype="multipart/form-data">
  <div class="form-group mx-2">
    	<label for="inputDate">Select date:</label>
    	<input type="date" class="form-control" name="selectedDate" value="<#if selectedDate??>${selectedDate}</#if>">
  </div>
  <button type="submit" class="btn btn-primary">Check date</button>
  <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>

<#if breakfastCards??>
<h2 class="text-center">Breakfast</h2>
<div class="row">
	<#list breakfastCards as card>
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #B8DAFC;">
	  			<img class="card-img-top" src="${card.card.fileName}" alt="${card.card.name}" style="background-color: white;">
	  				<div class="card-body" style="background-color: white;">
	    				<h5 class="card-title">${card.card.name}</h5>
	    				<div class="card-text" style="font-size:16px;">
							<table style="min-width:100%;">
								<tr>
							    	<td class="text-left">Calories</td><td class="text-right">${card.card.caloriesPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Proteins</td><td class="text-right">${card.card.proteinsPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Fats</td><td class="text-right">${card.card.fatsPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Carbohydrates</td><td class="text-right">${card.card.carbohydratesPG*card.gram}</td>
							   	</tr>
							   	<tr>
							   		<td class="text-left">Grams</td><td class="text-right">${card.gram}</td>
							   	</tr>
							</table>
						</div>
	  				</div>
			</div>
	</#list>
</div>
</#if>

<#if brunchCards??>
<h2 class="text-center">Brunch</h2>
<div class="row">
	<#list brunchCards as card>
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #B8DAFC;">
	  			<img class="card-img-top" src="${card.card.fileName}" alt="${card.card.name}" style="background-color: white;">
	  				<div class="card-body" style="background-color: white;">
	    				<h5 class="card-title">${card.card.name}</h5>
	    				<div class="card-text" style="font-size:16px;">
							<table style="min-width:100%;">
								<tr>
							    	<td class="text-left">Calories</td><td class="text-right">${card.card.caloriesPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Proteins</td><td class="text-right">${card.card.proteinsPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Fats</td><td class="text-right">${card.card.fatsPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Carbohydrates</td><td class="text-right">${card.card.carbohydratesPG*card.gram}</td>
							   	</tr>
							   	<tr>
							   		<td class="text-left">Grams</td><td class="text-right">${card.gram}</td>
							   	</tr>
							</table>
						</div>
	  				</div>
			</div>
	</#list>
</div>
</#if>

<#if lunchCards??>
<h2 class="text-center">Lunch</h2>
<div class="row">
	<#list lunchCards as card>
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #B8DAFC;">
	  			<img class="card-img-top" src="${card.card.fileName}" alt="${card.card.name}" style="background-color: white;">
	  				<div class="card-body" style="background-color: white;">
	    				<h5 class="card-title">${card.card.name}</h5>
	    				<div class="card-text" style="font-size:16px;">
							<table style="min-width:100%;">
								<tr>
							    	<td class="text-left">Calories</td><td class="text-right">${card.card.caloriesPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Proteins</td><td class="text-right">${card.card.proteinsPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Fats</td><td class="text-right">${card.card.fatsPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Carbohydrates</td><td class="text-right">${card.card.carbohydratesPG*card.gram}</td>
							   	</tr>
							   	<tr>
							   		<td class="text-left">Grams</td><td class="text-right">${card.gram}</td>
							   	</tr>
							</table>
						</div>
	  				</div>
			</div>
	</#list>
</div>
</#if>

<#if linnerCards??>
<h2 class="text-center">Linner</h2>
<div class="row">
	<#list linnerCards as card>
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #B8DAFC;">
	  			<img class="card-img-top" src="${card.card.fileName}" alt="${card.card.name}" style="background-color: white;">
	  				<div class="card-body" style="background-color: white;">
	    				<h5 class="card-title">${card.card.name}</h5>
	    				<div class="card-text" style="font-size:16px;">
							<table style="min-width:100%;">
								<tr>
							    	<td class="text-left">Calories</td><td class="text-right">${card.card.caloriesPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Proteins</td><td class="text-right">${card.card.proteinsPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Fats</td><td class="text-right">${card.card.fatsPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Carbohydrates</td><td class="text-right">${card.card.carbohydratesPG*card.gram}</td>
							   	</tr>
							   	<tr>
							   		<td class="text-left">Grams</td><td class="text-right">${card.gram}</td>
							   	</tr>
							</table>
						</div>
	  				</div>
			</div>
	</#list>
</div>
</#if>

<#if dinnerCards??>
<h2 class="text-center">Dinner</h2>
<div class="row">
	<#list dinnerCards as card>
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #B8DAFC;">
	  			<img class="card-img-top" src="${card.card.fileName}" alt="${card.card.name}" style="background-color: white;">
	  				<div class="card-body" style="background-color: white;">
	    				<h5 class="card-title">${card.card.name}</h5>
	    				<div class="card-text" style="font-size:16px;">
							<table style="min-width:100%;">
								<tr>
							    	<td class="text-left">Calories</td><td class="text-right">${card.card.caloriesPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Proteins</td><td class="text-right">${card.card.proteinsPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Fats</td><td class="text-right">${card.card.fatsPG*card.gram}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Carbohydrates</td><td class="text-right">${card.card.carbohydratesPG*card.gram}</td>
							   	</tr>
							   	<tr>
							   		<td class="text-left">Grams</td><td class="text-right">${card.gram}</td>
							   	</tr>
							</table>
						</div>
	  				</div>
			</div>
	</#list>
</div>
</#if>

<#if !breakfastCards??&&!brunchCards??&&!lunchCards??&&!linnerCards??&&!dinnerCards??>
<div class="d-flex justify-content-center align-items-center m-2">
<h3>You haven't made a menu for yourself at <#if selectedDate??>${selectedDate}</#if>!</h3>
</div>
<div class="d-flex justify-content-center align-items-center m-2">
<a href="/calculator" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Do it now</a>
</div>
</#if>
</@c.page>
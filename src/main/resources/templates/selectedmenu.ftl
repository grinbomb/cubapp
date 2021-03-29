<#import "parts/common.ftl" as c>

<@c.page>
<div class="row">
<form class="form-inline" method="post" enctype="multipart/form-data">
  <div class="form-group mx-2">
    	<label for="inputDate">Select date:</label>
    	<input type="date" class="form-control" name="selectedDate" value="<#if selectedDate??>${selectedDate}</#if>" onchange="showButton()">
  </div>
  <button type="submit" class="btn btn-primary" name="action" value="check">Check date</button>
  
  	<#if breakfastCards??||brunchCards??||lunchCards??||linnerCards??||dinnerCards??>
		<div class="mx-2">
			<button type="button" class="btn btn-danger" id="deleteButton" data-toggle="modal" data-target="#deleteModal">Delete menu</button>
		</div>
		<div>
			<p id="deleteText" style="display: none; color:red;">You have changed the date! Check it out before deleting the menu!</p>
		</div>
	</#if>
  
  <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete confirmation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to delete the menu for the date </p>
        <p>${selectedDate}?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        <button type="submit" class="btn btn-danger" name="action" value="delete">Yes</button>
      </div>
    </div>
  </div>
</div>
  <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>

</div>

  <#if sumCalories??&&sumFats??&&sumCalories??&&sumCalories??>
        <table class="table table-striped mt-2">
  			<thead>
    			<tr>
			      <th class="table-warning" scope="col">Proteins</th>
			      <th class="table-warning" scope="col">Fats</th>
			      <th class="table-warning" scope="col">Carbohydrates</th>
			      <th class="table-warning" scope="col">Calories</th>
 			   </tr>
		 	</thead>
  			<tbody>
			    <tr>
			      <td class="table-warning">${sumProteins} gm.</td>
			      <td class="table-warning">${sumFats} gm.</td>
			      <td class="table-warning">${sumCarbohydrates} gm.</td>
			      <td class="table-warning">${sumCalories}</td>
			    </tr>
			 </tbody>
		</table>
  </#if>

<#if breakfastCards??>
<h2 class="text-center">Breakfast</h2>
<div class="row">
	<#list breakfastCards as card>
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #022601;">
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
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #022601;">
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
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #022601;">
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
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #022601;">
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
			<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #022601;">
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
<div class="d-flex justify-content-center align-items-center m-3">
<h3>You haven't made a menu for yourself at <#if selectedDate??><b>${selectedDate}</b></#if>!</h3>
</div>
<div class="d-flex justify-content-center align-items-center m-3">
<a href="/calculator" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Do it now</a>
</div>
</#if>
</@c.page>
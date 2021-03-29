<#macro cardReadOnly category cards >
<h3>${category}</h3>
<div class="row">
<#list cards as card>
<#if card.productCategory=="${category}">
	<form method="post" action="/createcard/delete/${card.id}" style="width: 19.2%; max-height: 25%;">
			<div class="card m-1" style="border:2px solid #022601;">
	  			<img class="card-img-top" src="${card.fileName}" alt="${card.name}" style="background-color: white;">
	  				<div class="card-body" style="background-color: white;">
	    				<h5 class="card-title">${card.name}</h5>
	    				<div class="card-text" style="font-size:16px;">
							<table style="min-width:100%;">
								<tr>
							    	<td class="text-left">Calories</td><td class="text-right">${card.caloriesPG*100}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Proteins</td><td class="text-right">${card.proteinsPG*100}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Fats</td><td class="text-right">${card.fatsPG*100}</td>
							   	</tr>
							   	<tr>
							    	<td class="text-left">Carbohydrates</td><td class="text-right">${card.carbohydratesPG*100}</td>
							   	</tr>
							   	<tr>
							   		<td class="text-left">Grams</td><td class="text-right">100</td>
							   	</tr>
							</table>
						</div>
	  				</div>
	  				<div class="card-footer" style="background-color: white;">
  					<div class="text-center">
  						<input type="submit" class="btn btn-danger" value="Delete">
					</div>
  				</div>
			</div>
			<input type="hidden" name="_csrf" value="${_csrf.token}" />
		</form>
	</#if>
	</#list>
	</div>

</#macro>
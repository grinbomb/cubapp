<#import "parts/common.ftl" as c>

<@c.page>
<div ng-app="AppNewCard" ng-controller="ControllerNewCard">
	<form method="post" enctype="multipart/form-data">
	
	<div class="form-row">
    	<div class="form-group col-md-6">
      		<label for="inputProductName">Product name</label>
      		<input type="text" name = "productName" autocomplete="off" class="form-control ${(errorProductName??)?string('is-invalid', '')}" id="inputProductName" ng-model="product.name">
      		<#if errorProductName??>
	   			<div class="alert alert-danger text-center" role="alert">
 					 ${errorProductName}
				</div>
			</#if>
    	</div>
    	<div class="form-group col-md-6">
      		<label for="inputProductCategory">Product category</label>
      <input type="text" name = "productCategory" autocomplete="off" class="form-control ${(errorProductCategory??)?string('is-invalid', '')}" id="inputProductCategory" ng-model="product.category">
      	<#if errorProductCategory??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorProductCategory}
			</div>
		</#if>
		</div>
  </div> 
  <div class="form-row">
    	<div class="form-group col-md-3">
      		<label for="inputCalories">Calories per gram</label>
      		<input type="number" name = "calories" autocomplete="off" class="form-control ${(errorCalories??)?string('is-invalid', '')}" id="inputCalories" ng-model="product.calories" step="0.001">
      		<#if errorCalories??>
	   			<div class="alert alert-danger text-center" role="alert">
 					 ${errorCalories}
				</div>
			</#if>
    	</div>
    	<div class="form-group col-md-3">
      		<label for="inputProteins">Proteins per gram</label>
      		<input type="number" name = "proteins" autocomplete="off" class="form-control ${(errorProteins??)?string('is-invalid', '')}" id="inputProteins" ng-model="product.proteins" step="0.001">
      		<#if errorProteins??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorProteins}
			</div>
		</#if>
		</div>
		<div class="form-group col-md-3">
      		<label for="inputFats">Fats per gram</label>
      		<input type="number" name = "fats" autocomplete="off" class="form-control ${(errorFats??)?string('is-invalid', '')}" id="inputFats" ng-model="product.fats" step="0.001">
      		<#if errorFats??>
	   			<div class="alert alert-danger text-center" role="alert">
 					 ${errorFats}
				</div>
			</#if>
    	</div>
    	<div class="form-group col-md-3">
      		<label for="inputCarbohydrates">Carbohydrates per gram</label>
      		<input type="number" name = "carbohydrates" autocomplete="off" class="form-control ${(errorCarbohydrates??)?string('is-invalid', '')}" id="inputCarbohydrates" ng-model="product.carbohydrates" step="0.001">
      		<#if errorCarbohydrates??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorCarbohydrates}
			</div>
		</#if>
		</div>
  </div> 
    <div class="form-row">
    	<div class="form-group col-md-12">
			<label for="inputImgLink">Image link</label>
      		<input type="text" name = "imgLink" autocomplete="off" class="form-control ${(errorImgLink??)?string('is-invalid', '')}" id="inputImgLink" ng-model="product.img">
      		<#if errorImgLink??>
	   			<div class="alert alert-danger text-center" role="alert">
 					 ${errorImgLink}
				</div>
			</#if>
		</div>
  	</div>
  		<button type="submit" class="btn btn-primary">Create</button>
	</form>
	
		<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #B8DAFC;">
  		<img class="card-img-top" src={{product.img}} alt="EXAMPLE IMG" style="background-color: white;">
  			<div class="card-body" style="background-color: white;">
    			<h5 class="card-title">{{product.name}}</h5>
    			<div class="card-text" style="font-size:16px;">
					<table style="min-width:100%;">
						<tr>
					    	<td class="text-left">Calories</td><td class="text-right">{{(product.calories*product.gram).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					    	<td class="text-left">Proteins</td><td class="text-right">{{(product.proteins*product.gram).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					    	<td class="text-left">Fats</td><td class="text-right">{{(product.fats*product.gram).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					    	<td class="text-left">Carbohydrates</td><td class="text-right">{{(product.carbohydrates*product.gram).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					   		<td>Gram</td><td><input type="number" style="width:100%;" ng-model="product.gram"></td>
					   	</tr>
					</table>
				</div>
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
</@c.page>
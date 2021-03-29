<#import "parts/common.ftl" as c>
<#import "parts/productCardReadOnly.ftl" as prod>

<@c.page>
	<form method="post" enctype="multipart/form-data">
	<div ng-app="AppNewCard" ng-controller="ControllerNewCard">
	<div class="form-row">
    	<div class="form-group col-md-6">
      		<label for="inputProductName">Product name</label>
      		<input type="text" name = "name" autocomplete="off" class="form-control ${(nameError??)?string('is-invalid', '')}" id="inputProductName" ng-model="product.name">
      		<#if nameError??>
	   			<div class="invalid-feedback">
 					 ${nameError}
				</div>
			</#if>
    	</div>
    	<div class="form-group col-md-6">
    	
    		<label for="inputProductCategory">Product category</label>
	    	<select class="form-control ${(productCategoryError??)?string('is-invalid', '')}" name="productCategory" id="inputProductCategory" ng-model="product.category">
		    	<option hidden=""></option>
		      	<option>MEATANDPOULTRY</option>
		      	<option>FISH</option>
		      	<option>SEAFOOD</option>
		      	<option>VEGETABLES</option>
		      	<option>FRUITS</option>
		      	<option>BERRIES</option>
		      	<option>GREENS</option>
		      	<option>MUSHROOMS</option>
		      	<option>GROATS</option>
		      	<option>EGGS</option>
		      	<option>DAIRY</option>
		      	<option>FLOUR</option>
		      	<option>DRINKS</option>
		      	<option>OTHER</option>
		    </select>
    		
      	<#if productCategoryError??>
	   		<div class="invalid-feedback">
 				 ${productCategoryError}
			</div>
		</#if>
		</div>
  </div> 
  <div class="form-row">
    	<div class="form-group col-md-3">
      		<label for="inputCalories">Calories per gram</label>
      		<input type="number" name = "caloriesPG" autocomplete="off" class="form-control ${(caloriesPGError??)?string('is-invalid', '')}" id="inputCalories" ng-model="product.calories" step="0.001">
      		<#if caloriesPGError??>
	   			<div class="invalid-feedback">
 					 ${caloriesPGError}
				</div>
			</#if>
    	</div>
    	<div class="form-group col-md-3">
      		<label for="inputProteins">Proteins per gram</label>
      		<input type="number" name = "proteinsPG" autocomplete="off" class="form-control ${(proteinsPGError??)?string('is-invalid', '')}" id="inputProteins" ng-model="product.proteins" step="0.001">
      		<#if proteinsPGError??>
	   		<div class="invalid-feedback">
 				 ${proteinsPGError}
			</div>
		</#if>
		</div>
		<div class="form-group col-md-3">
      		<label for="inputFats">Fats per gram</label>
      		<input type="number" name = "fatsPG" autocomplete="off" class="form-control ${(fatsPGError??)?string('is-invalid', '')}" id="inputFats" ng-model="product.fats" step="0.001">
      		<#if fatsPGError??>
	   			<div class="invalid-feedback">
 					 ${fatsPGError}
				</div>
			</#if>
    	</div>
    	<div class="form-group col-md-3">
      		<label for="inputCarbohydrates">Carbohydrates per gram</label>
      		<input type="number" name = "carbohydratesPG" autocomplete="off" class="form-control ${(carbohydratesPGError??)?string('is-invalid', '')}" id="inputCarbohydrates" ng-model="product.carbohydrates" step="0.001">
      		<#if carbohydratesPGError??>
	   		<div class="invalid-feedback">
 				 ${carbohydratesPGError}
			</div>
		</#if>
		</div>
  </div> 
    <div class="form-row">
    	<div class="form-group col-md-12">
			<label for="inputImgLink">Image link <small>(beforehand you should upload your image to the image hosting, for example "<a href="https://imgbb.com">https://imgbb.com</a>")</small></label>
      		<input type="text" name = "fileName" autocomplete="off" class="form-control ${(fileNameError??)?string('is-invalid', '')}" id="inputImgLink" ng-model="product.img">
      		<#if fileNameError??>
	   			<div class="invalid-feedback">
 					 ${fileNameError}
				</div>
			</#if>
		</div>
  	</div>
 <!-- 
  	<input id="filePath" name="filePath" type='file' base-sixty-four-input>
  	<button type="button" class="btn btn-primary" ng-model="testApiButton" ng-click="sendHttpToImgBB()">TEST</button> --> <!-- TRYING TO CONFIGURATE API -->
  	<button type="submit" class="btn btn-primary">Create</button>
  	
  	<div class="row d-flex justify-content-center align-items-center m-2">
		<div class="card m-1" style="width: 19.2%; max-height: 25%; border:2px solid #022601;">
  		<img class="card-img-top" ng-src={{product.img}} alt="EXAMPLE IMG" style="background-color: white;">
  			<div class="card-body" style="background-color: white;">
    			<h5 class="card-title">{{product.name}}</h5>
    			<div class="card-text" style="font-size:16px;">
					<table style="min-width:100%;">
						<tr>
					    	<td class="text-left">Calories</td><td class="text-right">{{(product.calories*gram).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					    	<td class="text-left">Proteins</td><td class="text-right">{{(product.proteins*gram).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					    	<td class="text-left">Fats</td><td class="text-right">{{(product.fats*gram).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					    	<td class="text-left">Carbohydrates</td><td class="text-right">{{(product.carbohydrates*gram).toFixed(3);}}</td>
					   	</tr>
					   	<tr>
					   		<td>Grams</td><td><input type="number" style="width:100%; text-align: right;" ng-model="gram" ng-change="recountTestCard(gram)"></td>
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
  	</div>
  	<input type="hidden" name="_csrf" value="${_csrf.token}" />
	</form>
	
		<@prod.cardReadOnly category="MEATANDPOULTRY"	cards=cards/>
		<@prod.cardReadOnly category="FISH"				cards=cards/>
		<@prod.cardReadOnly category="SEAFOOD"			cards=cards/>
		<@prod.cardReadOnly category="VEGETABLES"		cards=cards/>
		<@prod.cardReadOnly category="FRUITS"			cards=cards/>
		<@prod.cardReadOnly category="BERRIES"			cards=cards/>
		<@prod.cardReadOnly category="GREENS"			cards=cards/>
		<@prod.cardReadOnly category="MUSHROOMS"		cards=cards/>
		<@prod.cardReadOnly category="GROATS"			cards=cards/>
		<@prod.cardReadOnly category="EGGS"				cards=cards/>
		<@prod.cardReadOnly category="DAIRY"			cards=cards/>
		<@prod.cardReadOnly category="FLOUR"			cards=cards/>
		<@prod.cardReadOnly category="DRINKS"			cards=cards/>
		<@prod.cardReadOnly category="OTHER"			cards=cards/>
	
</@c.page>
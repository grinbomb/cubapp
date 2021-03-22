<#import "parts/common.ftl" as c>
<#import "parts/productCard.ftl" as prod>
<#import "parts/category.ftl" as cat>
<#include "parts/security.ftl">

<@c.page>
  
<form method="post" enctype="multipart/form-data">
<div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputWeight">Your weight <small>(in kilograms)</small></label>
      <input type="number" name = "weight" value="<#if weight??>${weight}</#if>" autocomplete="off" class="form-control ${(errorValueWeight??)?string('is-invalid', '')}" id="inputWeight">
      	<#if errorValueWeight??>
	   		<div class="invalid-feedback">
 				 ${errorValueWeight}
			</div>
		</#if>
    </div>
    <div class="form-group col-md-4">
      <label for="inputHeight">Your height <small>(in centimeters)</small></label>
      <input type="number" name = "height" value="<#if height??>${height}</#if>" autocomplete="off" class="form-control ${(errorValueHeight??)?string('is-invalid', '')}" id="inputHeight">
      	<#if errorValueHeight??>
	   		<div class="invalid-feedback">
 				 ${errorValueHeight}
			</div>
		</#if>
	</div>
	<div class="form-group col-md-4">
      <label for="inputAge">Your age <small>(in years)</small></label>
      <input type="number" name = "age" value="<#if age??>${age}</#if>" autocomplete="off" class="form-control ${(errorValueAge??)?string('is-invalid', '')}" id="inputAge">
      	<#if errorValueAge??>
	   		<div class="invalid-feedback">
 				 ${errorValueAge}
			</div>
		</#if>
	</div>
  </div>
  
  <div class="form-row">
  
  	<div class = "form-group col-md-4">
  	<label>Choose your gender</label>
  	
		<div class="btn-group btn-group-toggle px-0 py-0 form-control ${(errorValueGender??)?string('is-invalid', '')}" style="width:100%;" data-toggle="buttons">
  			<label class="btn btn-outline-warning ${activeMaleBox}" style="min-width: 50%;">
    			<input type="radio" name="sex" id="male" value="male" ${checkedMaleBox}> <strong>Male</strong>
  			</label>
  			<label class="btn btn-outline-danger ${activeFemaleBox}" style="min-width: 50.5%;">
    			<input type="radio" name="sex" id="female" value="female" ${checkedFemaleBox}> <strong>Female</strong>
  			</label>
		</div>
		<#if errorValueGender??>
	   		<div class="invalid-feedback">
 				 ${errorValueGender}
			</div>
		</#if>
	</div>
	<div class = "form-group col-md-4">
		<label>Choose your daily intensity</label>
    	<select class="form-control ${(errorValueIntensity??)?string('is-invalid', '')}" name="intensity">
    	<option hidden=""></option>
      	<option value="Min" ${selectedMin}>Min (sedentary work that does not require significant physical exertion)</option>
      	<option value="Low" ${selectedLow}>Low (intense exercise for at least 20 minutes 1-3 times a week)</option>
      	<option value="Medium" ${selectedMedium}>Medium (intensive training for at least 30-60 minutes 3-4 times a week)</option>
      	<option value="Hard" ${selectedHard}>Hard (intense exercise and sports 5-7 days a week)</option>
      	<option value="Max" ${selectedMax}>Max (extremely active and / or very energy intensive activities)</option>
    </select>
    <#if errorValueIntensity??>
	   		<div class="invalid-feedback">
 				 ${errorValueIntensity}
			</div>
		</#if>
	</div>
	<div class = "form-group col-md-4">
	<label>Choose the number of your meals</label>
	<div class="btn-group btn-group-toggle px-0 py-0 form-control ${(errorNumOfMeals??)?string('is-invalid', '')}" style="width:100%;" data-toggle="buttons">
  			<label class="btn btn-outline-primary ${activenumOfMealsThree}" style="min-width: 50%;">
    			<input type="radio" name="numOfMeals" id="three" value="three" ${checkednumOfMealsThree}> <strong>3</strong>
  			</label>
  			<label class="btn btn-outline-primary ${activenumOfMealsFive}" style="min-width: 50.5%;">
    			<input type="radio" name="numOfMeals" id="five" value="five" ${checkednumOfMealsFive}> <strong>5</strong>
  			</label>
		</div>
		<#if errorNumOfMeals??>
	   		<div class="invalid-feedback">
 				 ${errorNumOfMeals}
			</div>
		</#if>
	</div>
  </div>
  <input type="hidden" name="_csrf" value="${_csrf.token}" />
  <button type="submit" class="btn btn-primary">Calculate</button>
  
</form>

<#if calories??>
<div class="alert alert-warning mt-2" role="alert">
 For optimal weight loss or maintenance of normal weight, you need to consume <strong style="font-size:25px;">${calories}</strong> calories daily.
</div>
</#if>

<#if proteins??&&fats??&&carbohydrates??>
<table class="table table-striped mt-1">
  <thead>
    <tr>
      <th scope="col">Proteins</th>
      <th scope="col">Fats</th>
      <th scope="col">Carbohydrates</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>${proteins} gm.</td>
      <td>${fats} gm.</td>
      <td>${carbohydrates} gm.</td>
    </tr>
  </tbody>
</table>

<h3>You can compose your daily diet by choosing the foods you like, and we will calculate how many PFC and calories you get in the end.</h3>
<form method="post" enctype="multipart/form-data" action="/savemenu">
<div id="accordion" ng-app="AppMenu" ng-controller = "AppController"> <!-- NG-CONTROLLER STARTS HERE -->

  <div class="card" style="background-color:#DCECFC;"> <!-- Pop-up area for BREAKFAST menu -->
    <div class="card-header text-center" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne" type="button">
          Breakfast 
        </button>
      </h5>
    </div>
	
    <div id="collapseOne" class="collapse" aria-labelledby="headingOne"> <!-- Menu selections area for BREAKFAST -->
      	<div class="card-body">
      	<div class="sticky-top" style="margin-bottom: 1%;">
      	<table class="table table-striped mt-1">
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
			      <td class="table-warning">{{(((meals.breakfast-sumCalories.breakfast)*0.30)/4.1).toFixed(0);}} gm.</td>
			      <td class="table-warning">{{(((meals.breakfast-sumCalories.breakfast)*0.22)/9.29).toFixed(0);}} gm.</td>
			      <td class="table-warning">{{(((meals.breakfast-sumCalories.breakfast)*0.48)/4.1).toFixed(0);}} gm.</td>
			      <#if activenumOfMealsFive=='active'>
			      <td class="table-warning" ng-init="meals.breakfast=${calories}*0.30">{{(meals.breakfast-sumCalories.breakfast).toFixed(0);}}</td>
			      <#else>
			      <td class="table-warning" ng-init="meals.breakfast=${calories}*0.37">{{(meals.breakfast-sumCalories.breakfast).toFixed(0);}}</td>
			      </#if>
			      
			    </tr>
			 </tbody>
		</table>
		
			<div class="alert alert-danger" role="alert" ng-if="meals.breakfastError>0">
 				You have got <strong>{{(meals.breakfastError).toFixed(0);}}</strong> extra calories!
			</div>
      	</div>
      	
      	<h4 style="margin-bottom: 1%;">Select the categories you would like to compose your breakfast menu:</h4>
      	
      	<div class="form-row">
      	
      	<@cat.category datatarget="breakfastMeatAndPoultry"	modelnameng="checkboxCategory.breakfast1" 	indextoarray="1" 	name="Meat and Poultry" productcategory="MEATANDPOULTRY"/>
      	<@cat.category datatarget="breakfastFish" 			modelnameng="checkboxCategory.breakfast2" 	indextoarray="2" 	name="Fish" 			productcategory="FISH"/>
      	<@cat.category datatarget="breakfastSeafood" 		modelnameng="checkboxCategory.breakfast3" 	indextoarray="3" 	name="Seafood" 			productcategory="SEAFOOD"/>
      	<@cat.category datatarget="breakfastVegetables" 	modelnameng="checkboxCategory.breakfast4" 	indextoarray="4" 	name="Vegetables" 		productcategory="VEGETABLES"/>
      	<@cat.category datatarget="breakfastFruits" 		modelnameng="checkboxCategory.breakfast5" 	indextoarray="5" 	name="Fruits" 			productcategory="FRUITS"/>
      	<@cat.category datatarget="breakfastBerries" 		modelnameng="checkboxCategory.breakfast6" 	indextoarray="6" 	name="Berries" 			productcategory="BERRIES"/>
      	<@cat.category datatarget="breakfastGreens" 		modelnameng="checkboxCategory.breakfast7" 	indextoarray="7" 	name="Greens" 			productcategory="GREENS"/>
      	<@cat.category datatarget="breakfastMushrooms" 		modelnameng="checkboxCategory.breakfast8" 	indextoarray="8" 	name="Mushrooms" 		productcategory="MUSHROOMS"/>
      	<@cat.category datatarget="breakfastGroats" 		modelnameng="checkboxCategory.breakfast9" 	indextoarray="9" 	name="Groats" 			productcategory="GROATS"/>
      	<@cat.category datatarget="breakfastEggs"			modelnameng="checkboxCategory.breakfast10" 	indextoarray="10" 	name="Eggs" 			productcategory="EGGS"/>
      	<@cat.category datatarget="breakfastDairy" 			modelnameng="checkboxCategory.breakfast11" 	indextoarray="11" 	name="Dairy" 			productcategory="DAIRY"/>
      	<@cat.category datatarget="breakfastFlour" 			modelnameng="checkboxCategory.breakfast12" 	indextoarray="12" 	name="Flour" 			productcategory="FLOUR"/>
      	<@cat.category datatarget="breakfastDrinks" 		modelnameng="checkboxCategory.breakfast13" 	indextoarray="13" 	name="Drinks" 			productcategory="DRINKS"/>
      	<@cat.category datatarget="breakfastOther" 			modelnameng="checkboxCategory.breakfast14" 	indextoarray="14" 	name="Other" 			productcategory="OTHER"/>
      	
		</div>
				
		<@prod.card idcss="breakfastMeatAndPoultry" name="meat and poultry" indexfromarray="1"	meal="breakfast"/>
		<@prod.card idcss="breakfastFish" 			name="fish" 			indexfromarray="2"	meal="breakfast"/>
		<@prod.card idcss="breakfastSeafood" 		name="seafood" 			indexfromarray="3"	meal="breakfast"/>
		<@prod.card idcss="breakfastVegetables" 	name="vegetables" 		indexfromarray="4"	meal="breakfast"/>
		<@prod.card idcss="breakfastFruits" 		name="fruits" 			indexfromarray="5"	meal="breakfast"/>
		<@prod.card idcss="breakfastBerries" 		name="berries" 			indexfromarray="6"	meal="breakfast"/>
		<@prod.card idcss="breakfastGreens" 		name="greens" 			indexfromarray="7"	meal="breakfast"/>
		<@prod.card idcss="breakfastMushrooms" 		name="mushrooms" 		indexfromarray="8"	meal="breakfast"/>
		<@prod.card idcss="breakfastGroats" 		name="groats" 			indexfromarray="9"	meal="breakfast"/>
		<@prod.card idcss="breakfastEggs" 			name="eggs" 			indexfromarray="10"	meal="breakfast"/>
		<@prod.card idcss="breakfastDairy" 			name="dairy" 			indexfromarray="11"	meal="breakfast"/>
		<@prod.card idcss="breakfastFlour" 			name="flour" 			indexfromarray="12"	meal="breakfast"/>
		<@prod.card idcss="breakfastDrinks" 		name="drinks" 			indexfromarray="13"	meal="breakfast"/>
		<@prod.card idcss="breakfastOther" 			name="other" 			indexfromarray="14"	meal="breakfast"/>
		
        </div>
    </div> <!-- Menu selections area for BREAKFAST IS OVER-->
  </div> <!-- Pop-up area for BREAKFAST menu IS OVER -->
  
  <#if activenumOfMealsFive=='active'>
    <div class="card" style="background-color:#DCECFC;"> <!-- Pop-up area for BRUNCH menu -->
    <div class="card-header text-center" id="headingOneAndHalf">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOneAndHalf" aria-expanded="false" aria-controls="collapseOneAndHalf" type="button">
          Brunch 
        </button>
      </h5>
    </div>
	
    <div id="collapseOneAndHalf" class="collapse" aria-labelledby="headingOneAndHalf"> <!-- Menu selections area for BRUNCH -->
      	<div class="card-body">
      	<div class="sticky-top" style="margin-bottom: 1%;">
      	<table class="table table-striped mt-1">
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
			      <td class="table-warning">{{(((meals.brunch-sumCalories.brunch)*0.30)/4.1).toFixed(0);}} gm.</td>
			      <td class="table-warning">{{(((meals.brunch-sumCalories.brunch)*0.22)/9.29).toFixed(0);}} gm.</td>
			      <td class="table-warning">{{(((meals.brunch-sumCalories.brunch)*0.48)/4.1).toFixed(0);}} gm.</td>
			      <td class="table-warning" ng-init="meals.brunch=${calories}*0.10">{{(meals.brunch-sumCalories.brunch).toFixed(0);}}</td>
			    </tr>
			 </tbody>
		</table>
		
			<div class="alert alert-danger" role="alert" ng-if="meals.brunchError>0">
 				You have got <strong>{{(meals.brunchError).toFixed(0);}}</strong> extra calories!
			</div>
      	</div>
      	
      	<h4 style="margin-bottom: 1%;">Select the categories you would like to compose your brunch menu:</h4>
      	
      	<div class="form-row">
      	
      	<@cat.category datatarget="brunchMeatAndPoultry"	modelnameng="checkboxCategory.brunch1" 		indextoarray="15" 	name="Meat and Poultry" productcategory="MEATANDPOULTRY"/>
      	<@cat.category datatarget="brunchFish" 				modelnameng="checkboxCategory.brunch2" 		indextoarray="16" 	name="Fish" 			productcategory="FISH"/>
      	<@cat.category datatarget="brunchSeafood" 			modelnameng="checkboxCategory.brunch3" 		indextoarray="17" 	name="Seafood" 			productcategory="SEAFOOD"/>
      	<@cat.category datatarget="brunchVegetables" 		modelnameng="checkboxCategory.brunch4" 		indextoarray="18" 	name="Vegetables" 		productcategory="VEGETABLES"/>
      	<@cat.category datatarget="brunchFruits" 			modelnameng="checkboxCategory.brunch5" 		indextoarray="19" 	name="Fruits" 			productcategory="FRUITS"/>
      	<@cat.category datatarget="brunchBerries" 			modelnameng="checkboxCategory.brunch6" 		indextoarray="20" 	name="Berries" 			productcategory="BERRIES"/>
      	<@cat.category datatarget="brunchGreens" 			modelnameng="checkboxCategory.brunch7" 		indextoarray="21" 	name="Greens" 			productcategory="GREENS"/>
      	<@cat.category datatarget="brunchMushrooms" 		modelnameng="checkboxCategory.brunch8" 		indextoarray="22" 	name="Mushrooms" 		productcategory="MUSHROOMS"/>
      	<@cat.category datatarget="brunchGroats" 			modelnameng="checkboxCategory.brunch9" 		indextoarray="23" 	name="Groats" 			productcategory="GROATS"/>
      	<@cat.category datatarget="brunchEggs"				modelnameng="checkboxCategory.brunch10" 	indextoarray="24" 	name="Eggs" 			productcategory="EGGS"/>
      	<@cat.category datatarget="brunchDairy" 			modelnameng="checkboxCategory.brunch11" 	indextoarray="25" 	name="Dairy" 			productcategory="DAIRY"/>
      	<@cat.category datatarget="brunchFlour" 			modelnameng="checkboxCategory.brunch12" 	indextoarray="26" 	name="Flour" 			productcategory="FLOUR"/>
      	<@cat.category datatarget="brunchDrinks" 			modelnameng="checkboxCategory.brunch13" 	indextoarray="27" 	name="Drinks" 			productcategory="DRINKS"/>
      	<@cat.category datatarget="brunchOther" 			modelnameng="checkboxCategory.brunch14" 	indextoarray="28" 	name="Other" 			productcategory="OTHER"/>
      	
		</div>
				
		<@prod.card idcss="brunchMeatAndPoultry"	name="meat and poultry" indexfromarray="15"	meal="brunch"/>
		<@prod.card idcss="brunchFish" 				name="fish" 			indexfromarray="16"	meal="brunch"/>
		<@prod.card idcss="brunchSeafood" 			name="seafood" 			indexfromarray="17"	meal="brunch"/>
		<@prod.card idcss="brunchVegetables" 		name="vegetables" 		indexfromarray="18"	meal="brunch"/>
		<@prod.card idcss="brunchFruits" 			name="fruits" 			indexfromarray="19"	meal="brunch"/>
		<@prod.card idcss="brunchBerries" 			name="berries" 			indexfromarray="20"	meal="brunch"/>
		<@prod.card idcss="brunchGreens" 			name="greens" 			indexfromarray="21"	meal="brunch"/>
		<@prod.card idcss="brunchMushrooms" 		name="mushrooms" 		indexfromarray="22"	meal="brunch"/>
		<@prod.card idcss="brunchGroats" 			name="groats" 			indexfromarray="23"	meal="brunch"/>
		<@prod.card idcss="brunchEggs" 				name="eggs" 			indexfromarray="24"	meal="brunch"/>
		<@prod.card idcss="brunchDairy" 			name="dairy" 			indexfromarray="25"	meal="brunch"/>
		<@prod.card idcss="brunchFlour" 			name="flour" 			indexfromarray="26"	meal="brunch"/>
		<@prod.card idcss="brunchDrinks" 			name="drinks" 			indexfromarray="27"	meal="brunch"/>
		<@prod.card idcss="brunchOther" 			name="other" 			indexfromarray="28"	meal="brunch"/>
		
        </div>
    </div> <!-- Menu selections area for BRUNCH IS OVER-->
  </div> <!-- Pop-up area for BRUNCH menu IS OVER -->
  </#if>
  
  <div class="card" style="background-color:#DCECFC;"> <!-- Pop-up area for LUNCH menu -->
    <div class="card-header text-center" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" type="button">
          Lunch
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"> <!-- Menu selections area for LUNCH -->
      <div class="card-body">
        <div class="sticky-top" style="margin-bottom: 1%;">
        
        <table class="table table-striped mt-1">
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
			      <td class="table-warning">{{(((meals.lunch-sumCalories.lunch)*0.30)/4.1).toFixed(0);}} gm.</td>
			      <td class="table-warning">{{(((meals.lunch-sumCalories.lunch)*0.22)/9.29).toFixed(0);}} gm.</td>
			      <td class="table-warning">{{(((meals.lunch-sumCalories.lunch)*0.48)/4.1).toFixed(0);}} gm.</td>
			      <#if activenumOfMealsFive=='active'>
			      <td class="table-warning" ng-init="meals.lunch=${calories}*0.30">{{(meals.lunch-sumCalories.lunch).toFixed(0);}}</td>
			      <#else>
			      <td class="table-warning" ng-init="meals.lunch=${calories}*0.37">{{(meals.lunch-sumCalories.lunch).toFixed(0);}}</td>
			      </#if>
			    </tr>
			 </tbody>
		</table>
        
        	<div class="alert alert-danger" role="alert" ng-if="meals.lunchError>0">
 				You have got <strong>{{(meals.lunchError).toFixed(0);}}</strong> extra calories!
			</div>
      	</div>
      	
      	<h4 style="margin-bottom: 1%;">Select the categories you would like to compose your lunch menu: </h4>
      	
      	<div class="form-row">
      	<@cat.category datatarget="lunchMeatAndPoultry" modelnameng="checkboxCategory.lunch1" 	indextoarray="29" 	name="Meat and Poultry" productcategory="MEATANDPOULTRY"/>
      	<@cat.category datatarget="lunchFish" 			modelnameng="checkboxCategory.lunch2" 	indextoarray="30" 	name="Fish" 			productcategory="FISH"/>
      	<@cat.category datatarget="lunchSeafood" 		modelnameng="checkboxCategory.lunch3" 	indextoarray="31" 	name="Seafood" 			productcategory="SEAFOOD"/>
      	<@cat.category datatarget="lunchVegetables" 	modelnameng="checkboxCategory.lunch4" 	indextoarray="32" 	name="Vegetables" 		productcategory="VEGETABLES"/>
      	<@cat.category datatarget="lunchFruits" 		modelnameng="checkboxCategory.lunch5" 	indextoarray="33" 	name="Fruits" 			productcategory="FRUITS"/>
      	<@cat.category datatarget="lunchBerries" 		modelnameng="checkboxCategory.lunch6" 	indextoarray="34" 	name="Berries" 			productcategory="BERRIES"/>
      	<@cat.category datatarget="lunchGreens" 		modelnameng="checkboxCategory.lunch7" 	indextoarray="35" 	name="Greens" 			productcategory="GREENS"/>
      	<@cat.category datatarget="lunchMushrooms" 		modelnameng="checkboxCategory.lunch8" 	indextoarray="36" 	name="Mushrooms" 		productcategory="MUSHROOMS"/>
      	<@cat.category datatarget="lunchGroats" 		modelnameng="checkboxCategory.lunch9" 	indextoarray="37" 	name="Groats" 			productcategory="GROATS"/>
      	<@cat.category datatarget="lunchEggs"			modelnameng="checkboxCategory.lunch10" 	indextoarray="38" 	name="Eggs" 			productcategory="EGGS"/>
      	<@cat.category datatarget="lunchDairy" 			modelnameng="checkboxCategory.lunch11" 	indextoarray="39" 	name="Dairy" 			productcategory="DAIRY"/>
      	<@cat.category datatarget="lunchFlour" 			modelnameng="checkboxCategory.lunch12" 	indextoarray="40" 	name="Flour" 			productcategory="FLOUR"/>
      	<@cat.category datatarget="lunchDrinks" 		modelnameng="checkboxCategory.lunch13" 	indextoarray="41" 	name="Drinks" 			productcategory="DRINKS"/>
      	<@cat.category datatarget="lunchOther" 			modelnameng="checkboxCategory.lunch14" 	indextoarray="42" 	name="Other" 			productcategory="OTHER"/>
      	
		</div>
				
		<@prod.card idcss="lunchMeatAndPoultry" name="meat and poultry" indexfromarray="29"	meal="lunch"/>
		<@prod.card idcss="lunchFish" 			name="fish" 			indexfromarray="30"	meal="lunch"/>
		<@prod.card idcss="lunchSeafood" 		name="seafood" 			indexfromarray="31"	meal="lunch"/>
		<@prod.card idcss="lunchVegetables" 	name="vegetables" 		indexfromarray="32"	meal="lunch"/>
		<@prod.card idcss="lunchFruits" 		name="fruits" 			indexfromarray="33"	meal="lunch"/>
		<@prod.card idcss="lunchBerries" 		name="berries" 			indexfromarray="34"	meal="lunch"/>
		<@prod.card idcss="lunchGreens" 		name="greens" 			indexfromarray="35"	meal="lunch"/>
		<@prod.card idcss="lunchMushrooms" 		name="mushrooms" 		indexfromarray="36"	meal="lunch"/>
		<@prod.card idcss="lunchGroats" 		name="groats" 			indexfromarray="37"	meal="lunch"/>
		<@prod.card idcss="lunchEggs" 			name="eggs" 			indexfromarray="38"	meal="lunch"/>
		<@prod.card idcss="lunchDairy" 			name="dairy" 			indexfromarray="39"	meal="lunch"/>
		<@prod.card idcss="lunchFlour" 			name="flour" 			indexfromarray="40"	meal="lunch"/>
		<@prod.card idcss="lunchDrinks" 		name="drinks" 			indexfromarray="41"	meal="lunch"/>
		<@prod.card idcss="lunchOther" 			name="other" 			indexfromarray="42"	meal="lunch"/>
		
        </div>
    
  	</div> <!-- Menu selections area for LUNCH IS OVER-->
  </div> <!-- Pop-up area for LUNCH menu IS OVER-->
  
  <#if activenumOfMealsFive=='active'>
    <div class="card" style="background-color:#DCECFC;"> <!-- Pop-up area for LINNER menu -->
    <div class="card-header text-center" id="headingTwoAndHalf">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseTwoAndHalf" aria-expanded="false" aria-controls="collapseTwoAndHalf" type="button">
          Linner
        </button>
      </h5>
    </div>
    <div id="collapseTwoAndHalf" class="collapse" aria-labelledby="headingTwoAndHalf"> <!-- Menu selections area for LINNER -->
      <div class="card-body">
        <div class="sticky-top" style="margin-bottom: 1%;">
        
        <table class="table table-striped mt-1">
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
			      <td class="table-warning">{{(((meals.linner-sumCalories.linner)*0.30)/4.1).toFixed(0);}} gm.</td>
			      <td class="table-warning">{{(((meals.linner-sumCalories.linner)*0.22)/9.29).toFixed(0);}} gm.</td>
			      <td class="table-warning">{{(((meals.linner-sumCalories.linner)*0.48)/4.1).toFixed(0);}} gm.</td>
			      <td class="table-warning" ng-init="meals.linner=${calories}*0.10">{{(meals.linner-sumCalories.linner).toFixed(0);}}</td>
			    </tr>
			 </tbody>
		</table>
        
        	<div class="alert alert-danger" role="alert" ng-if="meals.linnerError>0">
 				You have got <strong>{{(meals.linnerError).toFixed(0);}}</strong> extra calories!
			</div>
      	</div>
      	
      	<h4 style="margin-bottom: 1%;">Select the categories you would like to compose your linner menu: </h4>
      	
      	<div class="form-row">
      	<@cat.category datatarget="linnerMeatAndPoultry" 	modelnameng="checkboxCategory.linner1" 		indextoarray="43" 	name="Meat and Poultry" productcategory="MEATANDPOULTRY"/>
      	<@cat.category datatarget="linnerFish" 				modelnameng="checkboxCategory.linner2" 		indextoarray="44" 	name="Fish" 			productcategory="FISH"/>
      	<@cat.category datatarget="linnerSeafood" 			modelnameng="checkboxCategory.linner3" 		indextoarray="45" 	name="Seafood" 			productcategory="SEAFOOD"/>
      	<@cat.category datatarget="linnerVegetables" 		modelnameng="checkboxCategory.linner4" 		indextoarray="46" 	name="Vegetables" 		productcategory="VEGETABLES"/>
      	<@cat.category datatarget="linnerFruits" 			modelnameng="checkboxCategory.linner5" 		indextoarray="47" 	name="Fruits" 			productcategory="FRUITS"/>
      	<@cat.category datatarget="linnerBerries" 			modelnameng="checkboxCategory.linner6" 		indextoarray="48" 	name="Berries" 			productcategory="BERRIES"/>
      	<@cat.category datatarget="linnerGreens" 			modelnameng="checkboxCategory.linner7" 		indextoarray="49" 	name="Greens" 			productcategory="GREENS"/>
      	<@cat.category datatarget="linnerMushrooms" 		modelnameng="checkboxCategory.linner8" 		indextoarray="50" 	name="Mushrooms" 		productcategory="MUSHROOMS"/>
      	<@cat.category datatarget="linnerGroats" 			modelnameng="checkboxCategory.linner9" 		indextoarray="51" 	name="Groats" 			productcategory="GROATS"/>
      	<@cat.category datatarget="linnerEggs"				modelnameng="checkboxCategory.linner10" 	indextoarray="52" 	name="Eggs" 			productcategory="EGGS"/>
      	<@cat.category datatarget="linnerDairy" 			modelnameng="checkboxCategory.linner11" 	indextoarray="53" 	name="Dairy" 			productcategory="DAIRY"/>
      	<@cat.category datatarget="linnerFlour" 			modelnameng="checkboxCategory.linner12" 	indextoarray="54" 	name="Flour" 			productcategory="FLOUR"/>
      	<@cat.category datatarget="linnerDrinks" 			modelnameng="checkboxCategory.linner13" 	indextoarray="55" 	name="Drinks" 			productcategory="DRINKS"/>
      	<@cat.category datatarget="linnerOther" 			modelnameng="checkboxCategory.linner14" 	indextoarray="56" 	name="Other" 			productcategory="OTHER"/>
      	
		</div>
				
		<@prod.card idcss="linnerMeatAndPoultry"	name="meat and poultry" 	indexfromarray="43"		meal="linner"/>
		<@prod.card idcss="linnerFish" 				name="fish" 				indexfromarray="44"		meal="linner"/>
		<@prod.card idcss="linnerSeafood" 			name="seafood" 				indexfromarray="45"		meal="linner"/>
		<@prod.card idcss="linnerVegetables" 		name="vegetables" 			indexfromarray="46"		meal="linner"/>
		<@prod.card idcss="linnerFruits" 			name="fruits" 				indexfromarray="47"		meal="linner"/>
		<@prod.card idcss="linnerBerries" 			name="berries" 				indexfromarray="48"		meal="linner"/>
		<@prod.card idcss="linnerGreens" 			name="greens" 				indexfromarray="49"		meal="linner"/>
		<@prod.card idcss="linnerMushrooms" 		name="mushrooms" 			indexfromarray="50"		meal="linner"/>
		<@prod.card idcss="linnerGroats" 			name="groats" 				indexfromarray="51"		meal="linner"/>
		<@prod.card idcss="linnerEggs" 				name="eggs" 				indexfromarray="52"		meal="linner"/>
		<@prod.card idcss="linnerDairy" 			name="dairy" 				indexfromarray="53"		meal="linner"/>
		<@prod.card idcss="linnerFlour" 			name="flour" 				indexfromarray="54"		meal="linner"/>
		<@prod.card idcss="linnerDrinks" 			name="drinks" 				indexfromarray="55"		meal="linner"/>
		<@prod.card idcss="linnerOther" 			name="other" 				indexfromarray="56"		meal="linner"/>
		
        </div>
    
  	</div> <!-- Menu selections area for LINNER IS OVER-->
  </div> <!-- Pop-up area for LINNER menu IS OVER-->
  </#if>
  
  <div class="card" style="background-color:#DCECFC;"> <!-- Pop-up area for DINNER menu -->
    <div class="card-header text-center" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" type="button">
          Dinner
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree"> <!-- Menu selections area for DINNER-->
      <div class="card-body">
      	<div class="sticky-top" style="margin-bottom: 1%;">
      
      <table class="table table-striped mt-1">
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
			      <td class="table-warning">{{(((meals.dinner-sumCalories.dinner)*0.30)/4.1).toFixed(0);}} gm.</td>
			      <td class="table-warning">{{(((meals.dinner-sumCalories.dinner)*0.22)/9.29).toFixed(0);}} gm.</td>
			      <td class="table-warning">{{(((meals.dinner-sumCalories.dinner)*0.48)/4.1).toFixed(0);}} gm.</td>
			      <#if activenumOfMealsFive=='active'>
			      <td class="table-warning" ng-init="meals.dinner=${calories}*0.20">{{(meals.dinner-sumCalories.dinner).toFixed(0);}}</td>
			      <#else>
			      <td class="table-warning" ng-init="meals.dinner=${calories}*0.26">{{(meals.dinner-sumCalories.dinner).toFixed(0);}}</td>
			      </#if>
			    </tr>
			 </tbody>
		</table>
      
      		<div class="alert alert-danger" role="alert" ng-if="meals.dinnerError>0">
 				You have got <strong>{{(meals.dinnerError).toFixed(0);}}</strong> extra calories!
			</div>
      	</div>
      	
      	<h4 style="margin-bottom: 1%;">Select the categories you would like to compose your dinner menu: </h4>
      	
      	<div class="form-row">
      	
		<@cat.category datatarget="dinnerMeatAndPoultry"	modelnameng="checkboxCategory.dinner1" 		indextoarray="57" 	name="Meat and Poultry" productcategory="MEATANDPOULTRY"/>
      	<@cat.category datatarget="dinnerFish" 				modelnameng="checkboxCategory.dinner2" 		indextoarray="58" 	name="Fish" 			productcategory="FISH"/>
      	<@cat.category datatarget="dinnerSeafood" 			modelnameng="checkboxCategory.dinner3" 		indextoarray="59" 	name="Seafood" 			productcategory="SEAFOOD"/>
      	<@cat.category datatarget="dinnerVegetables" 		modelnameng="checkboxCategory.dinner4" 		indextoarray="60" 	name="Vegetables" 		productcategory="VEGETABLES"/>
      	<@cat.category datatarget="dinnerFruits" 			modelnameng="checkboxCategory.dinner5" 		indextoarray="61" 	name="Fruits" 			productcategory="FRUITS"/>
      	<@cat.category datatarget="dinnerBerries" 			modelnameng="checkboxCategory.dinner6" 		indextoarray="62" 	name="Berries" 			productcategory="BERRIES"/>
      	<@cat.category datatarget="dinnerGreens" 			modelnameng="checkboxCategory.dinner7" 		indextoarray="63" 	name="Greens" 			productcategory="GREENS"/>
      	<@cat.category datatarget="dinnerMushrooms" 		modelnameng="checkboxCategory.dinner8" 		indextoarray="64" 	name="Mushrooms" 		productcategory="MUSHROOMS"/>
      	<@cat.category datatarget="dinnerGroats" 			modelnameng="checkboxCategory.dinner9" 		indextoarray="65" 	name="Groats" 			productcategory="GROATS"/>
      	<@cat.category datatarget="dinnerEggs"				modelnameng="checkboxCategory.dinner10" 	indextoarray="66" 	name="Eggs" 			productcategory="EGGS"/>
      	<@cat.category datatarget="dinnerDairy" 			modelnameng="checkboxCategory.dinner11" 	indextoarray="67" 	name="Dairy" 			productcategory="DAIRY"/>
      	<@cat.category datatarget="dinnerFlour" 			modelnameng="checkboxCategory.dinner12" 	indextoarray="68" 	name="Flour" 			productcategory="FLOUR"/>
      	<@cat.category datatarget="dinnerDrinks" 			modelnameng="checkboxCategory.dinner13" 	indextoarray="69" 	name="Drinks" 			productcategory="DRINKS"/>
      	<@cat.category datatarget="dinnerOther" 			modelnameng="checkboxCategory.dinner14" 	indextoarray="70" 	name="Other" 			productcategory="OTHER"/>
      	
		</div>
				
		<@prod.card idcss="dinnerMeatAndPoultry"	name="meat and poultry" indexfromarray="57"	meal="dinner"/>
		<@prod.card idcss="dinnerFish" 				name="fish" 			indexfromarray="58"	meal="dinner"/>
		<@prod.card idcss="dinnerSeafood" 			name="seafood" 			indexfromarray="59"	meal="dinner"/>
		<@prod.card idcss="dinnerVegetables" 		name="vegetables" 		indexfromarray="60"	meal="dinner"/>
		<@prod.card idcss="dinnerFruits" 			name="fruits" 			indexfromarray="61"	meal="dinner"/>
		<@prod.card idcss="dinnerBerries" 			name="berries" 			indexfromarray="62"	meal="dinner"/>
		<@prod.card idcss="dinnerGreens" 			name="greens" 			indexfromarray="63"	meal="dinner"/>
		<@prod.card idcss="dinnerMushrooms" 		name="mushrooms" 		indexfromarray="64"	meal="dinner"/>
		<@prod.card idcss="dinnerGroats" 			name="groats" 			indexfromarray="65"	meal="dinner"/>
		<@prod.card idcss="dinnerEggs" 				name="eggs" 			indexfromarray="66"	meal="dinner"/>
		<@prod.card idcss="dinnerDairy" 			name="dairy" 			indexfromarray="67"	meal="dinner"/>
		<@prod.card idcss="dinnerFlour" 			name="flour" 			indexfromarray="68"	meal="dinner"/>
		<@prod.card idcss="dinnerDrinks" 			name="drinks" 			indexfromarray="69"	meal="dinner"/>
		<@prod.card idcss="dinnerOther" 			name="other" 			indexfromarray="70"	meal="dinner"/>
		
        </div>
       
    </div> <!-- Menu selections area for DINNER IS OVER-->
  </div> <!-- Pop-up area for DINNER menu -->
  <#if isAuthorized> 
	  <div class="form-group m-1">
	    	<label for="inputDate">Select date:</label>
	    	<input type="date" class="form-control" name="selectedDate" ng-model="selectedDate" ng-change="checkMenuDate(selectedDate)" ng-init="selectedDate = date | date: 'yyyy-MM-dd'; checkMenuDate(selectedDate)">
	    	<div class="alert alert-danger" role="alert" ng-if="isNotFreeDate">
	    		<h3>Attention!</h3> You already have a menu selected for that date. If you want to change it: go to the section "Your menu", select this date and make the necessary changes!
			</div>
	  </div>
	  	<button type="submit" class="btn btn-primary m-1" ng-if="!isNotFreeDate">Save menu</button>
  <#else>
	 	<button type="button" class="btn btn-secondary m-1" data-container="body" data-toggle="popover" data-placement="right" data-content="To save the menu you need to log in!">
 			Save menu
		</button>
  </#if>
  <input type="hidden" name="_csrf" value="${_csrf.token}" />
</div>
</form>
</#if>
</@c.page>
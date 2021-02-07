<#import "parts/common.ftl" as c>
<#import "parts/productCard.ftl" as prod>
<#import "parts/category.ftl" as cat>

<@c.page>
  
<form method="post" enctype="multipart/form-data">
<div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputWeight">Your weight <small>(in kilograms)</small></label>
      <input type="number" name = "weight" value="<#if weight??>${weight}</#if>" autocomplete="off" class="form-control ${(errorValueWeight??)?string('is-invalid', '')}" id="inputWeight">
      	<#if errorValueWeight??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueWeight}
			</div>
		</#if>
    </div>
    <div class="form-group col-md-4">
      <label for="inputHeight">Your height <small>(in centimeters)</small></label>
      <input type="number" name = "height" value="<#if height??>${height}</#if>" autocomplete="off" class="form-control ${(errorValueHeight??)?string('is-invalid', '')}" id="inputHeight">
      	<#if errorValueHeight??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueHeight}
			</div>
		</#if>
	</div>
	<div class="form-group col-md-4">
      <label for="inputAge">Your age <small>(in years)</small></label>
      <input type="number" name = "age" value="<#if age??>${age}</#if>" autocomplete="off" class="form-control ${(errorValueAge??)?string('is-invalid', '')}" id="inputAge">
      	<#if errorValueAge??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueAge}
			</div>
		</#if>
	</div>
  </div>
  
  <div class="form-row">
  
  	<div class = "form-group col-md-4">
  	<label>Choose your gender</label>
  	
		<div class="btn-group btn-group-toggle px-0 py-0 form-control ${(errorValueGender??)?string('is-invalid', '')}" style="width:100%;" data-toggle="buttons">
  			<label class="btn btn-outline-warning" style="min-width: 50%;">
    			<input type="radio" name="sex" id="male" value="male"> <strong>Male</strong>
  			</label>
  			<label class="btn btn-outline-danger" style="min-width: 50%;">
    			<input type="radio" name="sex" id="female" value="female" > <strong>Female</strong>
  			</label>
		</div>
		<#if errorValueGender??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueGender}
			</div>
		</#if>
	</div>
	<div class = "form-group col-md-8">
		<label>Choose your daily intensity</label>
    	<select class="form-control ${(errorValueIntensity??)?string('is-invalid', '')}" name="intensity">
    	<option hidden=""></option>
      	<option>Min</option>
      	<option>Low</option>
      	<option>Medium</option>
      	<option>Hard</option>
      	<option>Max</option>
    </select>
    <#if errorValueIntensity??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueIntensity}
			</div>
		</#if>
	</div>
	
  </div>
  
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

<div id="accordion" ng-app="AppMenu" ng-controller = "AppController">

<!-- Pop-up area for BREAKFAST menu -->
  <div class="card" style="background-color:#DCECFC;">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
          Breakfast 
        </button>
      </h5>
    </div>
	<!-- Menu selections area for BREAKFAST -->
	
    <div id="collapseOne" class="collapse" aria-labelledby="headingOne"> <!-- NG-CONTROLLER STARTS HERE -->
      	<div class="card-body">
      	<div style="margin-bottom: 1%;">
      	<table class="table table-striped mt-1">
  			<thead>
    			<tr>
			      <th scope="col">Proteins</th>
			      <th scope="col">Fats</th>
			      <th scope="col">Carbohydrates</th>
			      <th scope="col">Calories</th>
 			   </tr>
		 	</thead>
  			<tbody>
			    <tr>
			      <td class="table-warning">${proteins} gm.</td>
			      <td class="table-warning">${fats} gm.</td>
			      <td class="table-warning">${carbohydrates} gm.</td>
			      <td class="table-warning" ng-init="meals.breakfast=${calories}*0.37">{{(meals.breakfast-sumCalories.breakfast).toFixed(0);}} gm.</td>
			    </tr>
			 </tbody>
		</table>
		
		<div class="alert alert-danger" role="alert" ng-if="meals.breakfastError>0">
 			You have got <strong>{{(meals.breakfastError).toFixed(0);}}</strong> extra calories!
		</div>
      	<h4>Select the categories you would like to compose your breakfast menu:</h4>
      	</div>
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
        <!-- Menu selections area for BREAKFAST IS OVER-->
    </div>
  </div>
  <!-- Pop-up area for BREAKFAST menu IS OVER -->
  
  <!-- Pop-up area for LUNCH menu -->
  <div class="card" style="background-color:#DCECFC;">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Lunch
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo">
      <div class="card-body">
      <!-- Menu selections area for LUNCH -->
        <div style="margin-bottom: 1%;">
      	<h4>Select the categories you would like to compose your lunch menu: </h4>
      	</div>
      	<div class="form-row">
      	<@cat.category datatarget="lunchMeatAndPoultry" modelnameng="checkboxCategory.lunch1" 	indextoarray="15" 	name="Meat and Poultry" productcategory="MEATANDPOULTRY"/>
      	<@cat.category datatarget="lunchFish" 			modelnameng="checkboxCategory.lunch2" 	indextoarray="16" 	name="Fish" 			productcategory="FISH"/>
      	<@cat.category datatarget="lunchSeafood" 		modelnameng="checkboxCategory.lunch3" 	indextoarray="17" 	name="Seafood" 			productcategory="SEAFOOD"/>
      	<@cat.category datatarget="lunchVegetables" 	modelnameng="checkboxCategory.lunch4" 	indextoarray="18" 	name="Vegetables" 		productcategory="VEGETABLES"/>
      	<@cat.category datatarget="lunchFruits" 		modelnameng="checkboxCategory.lunch5" 	indextoarray="19" 	name="Fruits" 			productcategory="FRUITS"/>
      	<@cat.category datatarget="lunchBerries" 		modelnameng="checkboxCategory.lunch6" 	indextoarray="20" 	name="Berries" 			productcategory="BERRIES"/>
      	<@cat.category datatarget="lunchGreens" 		modelnameng="checkboxCategory.lunch7" 	indextoarray="21" 	name="Greens" 			productcategory="GREENS"/>
      	<@cat.category datatarget="lunchMushrooms" 		modelnameng="checkboxCategory.lunch8" 	indextoarray="22" 	name="Mushrooms" 		productcategory="MUSHROOMS"/>
      	<@cat.category datatarget="lunchGroats" 		modelnameng="checkboxCategory.lunch9" 	indextoarray="23" 	name="Groats" 			productcategory="GROATS"/>
      	<@cat.category datatarget="lunchEggs"			modelnameng="checkboxCategory.lunch10" 	indextoarray="24" 	name="Eggs" 			productcategory="EGGS"/>
      	<@cat.category datatarget="lunchDairy" 			modelnameng="checkboxCategory.lunch11" 	indextoarray="25" 	name="Dairy" 			productcategory="DAIRY"/>
      	<@cat.category datatarget="lunchFlour" 			modelnameng="checkboxCategory.lunch12" 	indextoarray="26" 	name="Flour" 			productcategory="FLOUR"/>
      	<@cat.category datatarget="lunchDrinks" 		modelnameng="checkboxCategory.lunch13" 	indextoarray="27" 	name="Drinks" 			productcategory="DRINKS"/>
      	<@cat.category datatarget="lunchOther" 			modelnameng="checkboxCategory.lunch14" 	indextoarray="28" 	name="Other" 			productcategory="OTHER"/>
      	
		</div>
				
		<@prod.card idcss="lunchMeatAndPoultry" name="meat and poultry" indexfromarray="15"	meal="lunch"/>
		<@prod.card idcss="lunchFish" 			name="fish" 			indexfromarray="16"	meal="lunch"/>
		<@prod.card idcss="lunchSeafood" 		name="seafood" 			indexfromarray="17"	meal="lunch"/>
		<@prod.card idcss="lunchVegetables" 	name="vegetables" 		indexfromarray="18"	meal="lunch"/>
		<@prod.card idcss="lunchFruits" 		name="fruits" 			indexfromarray="19"	meal="lunch"/>
		<@prod.card idcss="lunchBerries" 		name="berries" 			indexfromarray="20"	meal="lunch"/>
		<@prod.card idcss="lunchGreens" 		name="greens" 			indexfromarray="21"	meal="lunch"/>
		<@prod.card idcss="lunchMushrooms" 		name="mushrooms" 		indexfromarray="22"	meal="lunch"/>
		<@prod.card idcss="lunchGroats" 		name="groats" 			indexfromarray="23"	meal="lunch"/>
		<@prod.card idcss="lunchEggs" 			name="eggs" 			indexfromarray="24"	meal="lunch"/>
		<@prod.card idcss="lunchDairy" 			name="dairy" 			indexfromarray="25"	meal="lunch"/>
		<@prod.card idcss="lunchFlour" 			name="flour" 			indexfromarray="26"	meal="lunch"/>
		<@prod.card idcss="lunchDrinks" 		name="drinks" 			indexfromarray="27"	meal="lunch"/>
		<@prod.card idcss="lunchOther" 			name="other" 			indexfromarray="28"	meal="lunch"/>
		
        </div>
    <!-- Menu selections area for LUNCH IS OVER-->
  </div>
  <!-- Pop-up area for LUNCH menu IS OVER-->
  
  <!-- Pop-up area for DINNER menu -->
  <div class="card" style="background-color:#DCECFC;">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Dinner
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree">
      <div class="card-body">
      <!-- Menu selections area for DINNER-->
      <div style="margin-bottom: 1%;">
      	<h4>Select the categories you would like to compose your dinner menu: </h4>
      	</div>
      	<div class="form-row">
      	
		<@cat.category datatarget="dinnerMeatAndPoultry"	modelnameng="checkboxCategory.dinner1" 		indextoarray="29" 	name="Meat and Poultry" productcategory="MEATANDPOULTRY"/>
      	<@cat.category datatarget="dinnerFish" 				modelnameng="checkboxCategory.dinner2" 		indextoarray="30" 	name="Fish" 			productcategory="FISH"/>
      	<@cat.category datatarget="dinnerSeafood" 			modelnameng="checkboxCategory.dinner3" 		indextoarray="31" 	name="Seafood" 			productcategory="SEAFOOD"/>
      	<@cat.category datatarget="dinnerVegetables" 		modelnameng="checkboxCategory.dinner4" 		indextoarray="32" 	name="Vegetables" 		productcategory="VEGETABLES"/>
      	<@cat.category datatarget="dinnerFruits" 			modelnameng="checkboxCategory.dinner5" 		indextoarray="33" 	name="Fruits" 			productcategory="FRUITS"/>
      	<@cat.category datatarget="dinnerBerries" 			modelnameng="checkboxCategory.dinner6" 		indextoarray="34" 	name="Berries" 			productcategory="BERRIES"/>
      	<@cat.category datatarget="dinnerGreens" 			modelnameng="checkboxCategory.dinner7" 		indextoarray="35" 	name="Greens" 			productcategory="GREENS"/>
      	<@cat.category datatarget="dinnerMushrooms" 		modelnameng="checkboxCategory.dinner8" 		indextoarray="36" 	name="Mushrooms" 		productcategory="MUSHROOMS"/>
      	<@cat.category datatarget="dinnerGroats" 			modelnameng="checkboxCategory.dinner9" 		indextoarray="37" 	name="Groats" 			productcategory="GROATS"/>
      	<@cat.category datatarget="dinnerEggs"				modelnameng="checkboxCategory.dinner10" 	indextoarray="38" 	name="Eggs" 			productcategory="EGGS"/>
      	<@cat.category datatarget="dinnerDairy" 			modelnameng="checkboxCategory.dinner11" 	indextoarray="39" 	name="Dairy" 			productcategory="DAIRY"/>
      	<@cat.category datatarget="dinnerFlour" 			modelnameng="checkboxCategory.dinner12" 	indextoarray="40" 	name="Flour" 			productcategory="FLOUR"/>
      	<@cat.category datatarget="dinnerDrinks" 			modelnameng="checkboxCategory.dinner13" 	indextoarray="41" 	name="Drinks" 			productcategory="DRINKS"/>
      	<@cat.category datatarget="dinnerOther" 			modelnameng="checkboxCategory.dinner14" 	indextoarray="42" 	name="Other" 			productcategory="OTHER"/>
      	
		</div>
				
		<@prod.card idcss="dinnerMeatAndPoultry"	name="meat and poultry" indexfromarray="29"	meal="dinner"/>
		<@prod.card idcss="dinnerFish" 				name="fish" 			indexfromarray="30"	meal="dinner"/>
		<@prod.card idcss="dinnerSeafood" 			name="seafood" 			indexfromarray="31"	meal="dinner"/>
		<@prod.card idcss="dinnerVegetables" 		name="vegetables" 		indexfromarray="32"	meal="dinner"/>
		<@prod.card idcss="dinnerFruits" 			name="fruits" 			indexfromarray="33"	meal="dinner"/>
		<@prod.card idcss="dinnerBerries" 			name="berries" 			indexfromarray="34"	meal="dinner"/>
		<@prod.card idcss="dinnerGreens" 			name="greens" 			indexfromarray="35"	meal="dinner"/>
		<@prod.card idcss="dinnerMushrooms" 		name="mushrooms" 		indexfromarray="36"	meal="dinner"/>
		<@prod.card idcss="dinnerGroats" 			name="groats" 			indexfromarray="37"	meal="dinner"/>
		<@prod.card idcss="dinnerEggs" 				name="eggs" 			indexfromarray="38"	meal="dinner"/>
		<@prod.card idcss="dinnerDairy" 			name="dairy" 			indexfromarray="39"	meal="dinner"/>
		<@prod.card idcss="dinnerFlour" 			name="flour" 			indexfromarray="40"	meal="dinner"/>
		<@prod.card idcss="dinnerDrinks" 			name="drinks" 			indexfromarray="41"	meal="dinner"/>
		<@prod.card idcss="dinnerOther" 			name="other" 			indexfromarray="42"	meal="dinner"/>
		
        </div>
       <!-- Menu selections area for DINNER IS OVER-->
    </div>
  </div>
  <!-- Pop-up area for DINNER menu -->
</div>
</#if>
</@c.page>
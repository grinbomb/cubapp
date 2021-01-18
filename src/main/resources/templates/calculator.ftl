<#import "parts/common.ftl" as c>
<#import "parts/productCard.ftl" as prod>
<#import "parts/category.ftl" as cat>

<@c.page>
  
<form method="post" enctype="multipart/form-data">
<div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputWeight">Your weight <small>(in kilograms)</small></label>
      <input type="number" name = "weight" autocomplete="off" class="form-control ${(errorValueWeight??)?string('is-invalid', '')}" id="inputWeight">
      	<#if errorValueWeight??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueWeight}
			</div>
		</#if>
    </div>
    <div class="form-group col-md-4">
      <label for="inputHeight">Your height <small>(in centimeters)</small></label>
      <input type="number" name = "height" autocomplete="off" class="form-control ${(errorValueHeight??)?string('is-invalid', '')}" id="inputHeight">
      	<#if errorValueHeight??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueHeight}
			</div>
		</#if>
	</div>
	<div class="form-group col-md-4">
      <label for="inputAge">Your age <small>(in years)</small></label>
      <input type="number" name = "age" autocomplete="off" class="form-control ${(errorValueAge??)?string('is-invalid', '')}" id="inputAge">
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
    			<input type="radio" name="sex" id="female" value="female"> <strong>Female</strong>
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
      	<h4>Select the categories you would like to compose your breakfast menu: </h4>
      	</div>
      	<div class="form-row">
      	
      	<@cat.category datatarget="breakfastMainDishChoice" modelnameng="checkboxModel.value1" changeng="1" name="Main dish" productcategory=""/>
      	<@cat.category datatarget="breakfastFruits" modelnameng="checkboxModel.value2" changeng="2" name="Fruits" productcategory="FRUITS"/>
      	<@cat.category datatarget="breakfastToast" modelnameng="checkboxModel.value3" changeng="3" name="Toast" productcategory=""/>
      	<@cat.category datatarget="breakfastVegetables" modelnameng="checkboxModel.value4" changeng="4" name="Vegetables" productcategory="VEGETABLES"/>
      	<@cat.category datatarget="breakfastBerries" modelnameng="checkboxModel.value5" changeng="5" name="Berries" productcategory=""/>
      	

		</div>
		
		<@prod.card idcss="breakfastMainDishChoice" name="main dish" productid="1"/>
		<@prod.card idcss="breakfastFruits" name="fruits" productid="2"/>
		<@prod.card idcss="breakfastToast" name="toast" productid="3"/>
		<@prod.card idcss="breakfastVegetables" name="vegetables" productid="4"/>
		<@prod.card idcss="breakfastBerries" name="berries" productid="5"/>
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
      	<@cat.category datatarget="lunchGarnish" modelnameng="checkboxModel.value6" changeng="6" name="Garnish" productcategory=""/>
      	<@cat.category datatarget="lunchMeatPoultry" modelnameng="checkboxModel.value7" changeng="7" name="Meat and poultry" productcategory=""/>
      	<@cat.category datatarget="lunchFish" modelnameng="checkboxModel.value8" changeng="8" name="Fish" productcategory=""/>
      	<@cat.category datatarget="lunchVegetables" modelnameng="checkboxModel.value9" changeng="9" name="Vegetables" productcategory=""/>
      	<@cat.category datatarget="lunchFruits" modelnameng="checkboxModel.value10" changeng="10" name="Fruits" productcategory=""/>
      	<@cat.category datatarget="lunchDrinks" modelnameng="checkboxModel.value11" changeng="11" name="Drinks" productcategory=""/>

        </div>
        <@prod.card idcss="lunchGarnish" name="garnish" productid="6"/>
		<@prod.card idcss="lunchMeatPoultry" name="meat and poultry" productid="7"/>
		<@prod.card idcss="lunchFish" name="fish" productid="8"/>
		<@prod.card idcss="lunchVegetables" name="vegetables" productid="9"/>
		<@prod.card idcss="lunchFruits" name="fruits" productid="10"/>
		<@prod.card idcss="lunchDrinks" name="drinks" productid="11"/>
        
        <!-- Menu selections area for LUNCH IS OVER-->
    </div>
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
      	
      	<@cat.category datatarget="dinnerGarnish" modelnameng="checkboxModel.value12" changeng="12" name="Garnish" productcategory=""/>
      	<@cat.category datatarget="dinnerMeatPoultry" modelnameng="checkboxModel.value13" changeng="13" name="Meat and poultry" productcategory=""/>
      	<@cat.category datatarget="dinnerFish" modelnameng="checkboxModel.value14" changeng="14" name="Fish" productcategory=""/>
      	<@cat.category datatarget="dinnerVegetables" modelnameng="checkboxModel.value15" changeng="15" name="Vegetables" productcategory=""/>
      	<@cat.category datatarget="dinnerFruits" modelnameng="checkboxModel.value16" changeng="16" name="Fruits" productcategory=""/>
      	<@cat.category datatarget="dinnerDrinks" modelnameng="checkboxModel.value17" changeng="17" name="Drinks" productcategory=""/>
      	
		</div>
		<@prod.card idcss="dinnerGarnish" name="garnish" productid="12"/>
		<@prod.card idcss="dinnerMeatPoultry" name="meat and poultry" productid="13"/>
		<@prod.card idcss="dinnerFish" name="fish" productid="14"/>
		<@prod.card idcss="dinnerVegetables" name="vegetables" productid="15"/>
		<@prod.card idcss="dinnerFruits" name="fruits" productid="16"/>
		<@prod.card idcss="dinnerDrinks" name="drinks" productid="17"/>
        </div>
       <!-- Menu selections area for DINNER IS OVER-->
    </div>
  </div>
  <!-- Pop-up area for DINNER menu -->
</div>
</#if>
</@c.page>
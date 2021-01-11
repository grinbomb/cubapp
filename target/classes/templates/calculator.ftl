<#import "parts/common.ftl" as c>

<@c.page>
  
<form method="post" enctype="multipart/form-data">
<div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputWeight">Your weight</label>
      <input type="number" name = "weight" autocomplete="off" class="form-control ${(errorValueWeight??)?string('is-invalid', '')}" id="inputWeight">
      	<#if errorValueWeight??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueWeight}
			</div>
		</#if>
    </div>
    <div class="form-group col-md-4">
      <label for="inputHeight">Your height</label>
      <input type="number" name = "height" autocomplete="off" class="form-control ${(errorValueHeight??)?string('is-invalid', '')}" id="inputHeight">
      	<#if errorValueHeight??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueHeight}
			</div>
		</#if>
	</div>
	<div class="form-group col-md-4">
      <label for="inputAge">Your age</label>
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
    			<input type="radio" name="sex" id="male" value="male"> Male
  			</label>
  			<label class="btn btn-outline-danger" style="min-width: 50%;">
    			<input type="radio" name="sex" id="female" value="female"> Female
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
<div class="alert alert-success mt-2" role="alert">
 For optimal weight loss or maintenance of normal weight, you need to consume <strong>${calories}</strong> calories daily.
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

<div id="accordion" ng-app="AppMenu">

<label>Input something:</label>
<input type="text" ng-model="name">

<!-- Pop-up area for BREAKFAST menu -->
  <div class="card" >
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
          Breakfast 
        </button>
      </h5>
    </div>
	<!-- Menu selections area for BREAKFAST -->
	
    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" ng-controller = "AppController"> <!-- NG-CONTROLLER STARTS HERE -->
      	<div class="card-body">
      	<div style="margin-bottom: 1%;">
      	<h4>Select the categories you would like to compose your breakfast menu: </h4>
      	</div>
      	<div class="form-row">
      		<div data-toggle="collapse" data-target="#breakfastMainDishChoice">
      			<div class="btn-group-toggle  mx-1" data-toggle="buttons">
  					<label class="btn btn-outline-info">
    					<input type="checkbox" checked autocomplete="off" ng-model="checkboxModel.value1" ng-change="change('1')"> Main dish
  					</label>
				</div>
			</div>
			<div data-toggle="collapse" data-target="#breakfastFruits">
				<div class="btn-group-toggle  mx-1" data-toggle="buttons">
  					<label class="btn btn-outline-info">
    					<input type="checkbox" checked autocomplete="off" ng-model="checkboxModel.value2" ng-change="change('2')"
    					ng-true-value="'YES'" ng-false-value="'NO'"> Fruits
  					</label>
				</div>
			</div>
			<div data-toggle="collapse" data-target="#breakfastToast">
				<div class="btn-group-toggle  mx-1" data-toggle="buttons">
  					<label class="btn btn-outline-info">
    					<input type="checkbox" checked autocomplete="off" ng-model="checkboxModel.value3" ng-change="change('3')"> Toast
  					</label>
				</div>
			</div>
		</div>
		
		<div class="collapse" id="breakfastMainDishChoice">
		<h5>Choose what you like from the main dish category:</h5>
			<div class="row">
				<div class="card m-1" style="width: 18rem;" ng-repeat="item in testeat[1]">
  				<img class="card-img-top" src={{item.image}} alt="Card image cap">
  					<div class="card-body">
    				<h5 class="card-title">{{item.name}}</h5>
    				<p class="card-text">For example id is {{item.id}}</p>
    				<a href="" class="btn btn-primary">CLICK</a>
  					</div>
				</div>
			</div> 
		</div>
		
		<div class="collapse" id="breakfastFruits">
		<h5>Choose what you like from the fruits category:</h5>
			<div class="row">
				<div class="card m-1" style="width: 18rem;" ng-repeat="item in testeat[2]">
  				<img class="card-img-top" src={{item.image}} alt="Card image cap">
  					<div class="card-body">
    				<h5 class="card-title">{{item.name}}</h5>
    				<p class="card-text">For example id is {{item.id}}</p>
    				<a href="" class="btn btn-primary">CLICK</a>
  					</div>
				</div>
			</div> 
		</div>
		<div class="collapse" id="breakfastToast">
		<h5>Choose what you like from the toast category:</h5>
			<div class="row">
				<div class="card m-1" style="width: 18rem;" ng-repeat="item in testeat[3]">
  				<img class="card-img-top" src={{item.image}} alt="Card image cap">
  					<div class="card-body">
    				<h5 class="card-title">{{item.name}}</h5>
    				<p class="card-text">For example id is {{item.id}}</p>
    				<a href="" class="btn btn-primary">CLICK</a>
  					</div>
				</div>
			</div> 
		</div>
		Main dish = {{checkboxModel.value1}}
		Fruits = {{checkboxModel.value2}}
        </div>
        <!-- Menu selections area for BREAKFAST IS OVER-->
    </div>
  </div>
  <!-- Pop-up area for BREAKFAST menu IS OVER -->
  
  <!-- Pop-up area for LUNCH menu -->
  <div class="card">
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
      	Select the categories you would like to compose your lunch menu: 
      	</div>
      	<div class="form-row">
      	<div data-toggle="collapse" data-target="#garnishchoice">
      		<div class="btn-group-toggle  mx-1" data-toggle="buttons">
  				<label class="btn btn-outline-info">
    				<input type="checkbox" checked autocomplete="off"> Garnish
  				</label>
			</div>
		</div>
		<div data-toggle="collapse" data-target="#meatpoultrychoice">
			<div class="btn-group-toggle  mx-1" data-toggle="buttons">
  				<label class="btn btn-outline-info">
    				<input type="checkbox" checked autocomplete="off"> Meat / poultry
  				</label>
			</div>
		</div>
			<div data-toggle="collapse" data-target="#fishchoice">
			<div class="btn-group-toggle  mx-1" data-toggle="buttons">
			
  				<label class="btn btn-outline-info" data-toggle="collapse">
    				<input type="checkbox" checked autocomplete="off"> Fish
  				</label>
  				</div>
			</div>
		</div>
		<div class="collapse" id="garnishchoice">
		GARNISH GARNISH GARNISH GARNISH GARNISH 
		</div>
		<div class="collapse" id="meatpoultrychoice">
		MEAT POULTRY MEAT POULTRY MEAT POULTRY 
		</div>
		<div class="collapse" id="fishchoice">
		FISH FISH FISH FISH FISH FISH FISH FISH 
		</div>
        Menu {{name}}
        </div>
        <!-- Menu selections area for LUNCH IS OVER-->
    </div>
  </div>
  <!-- Pop-up area for LUNCH menu IS OVER-->
  
  <!-- Pop-up area for DINNER menu -->
  <div class="card">
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
      	Select the categories you would like to compose your dinner menu: 
      	</div>
      	<div class="form-row">
      		<div class="btn-group-toggle  mx-1" data-toggle="buttons">
  				<label class="btn btn-outline-info">
    				<input type="checkbox" checked autocomplete="off"> Garnish
  				</label>
			</div>
			<div class="btn-group-toggle  mx-1" data-toggle="buttons">
  				<label class="btn btn-outline-info">
    				<input type="checkbox" checked autocomplete="off"> Meat / poultry
  				</label>
			</div>
			<div class="btn-group-toggle  mx-1" data-toggle="buttons">
  				<label class="btn btn-outline-info">
    				<input type="checkbox" checked autocomplete="off"> Fish
  				</label>
			</div>
		</div>
        Menu {{name}}
        </div>
       <!-- Menu selections area for DINNER IS OVER-->
    </div>
  </div>
  <!-- Pop-up area for DINNER menu -->
</div>
</#if>
</@c.page>
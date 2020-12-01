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
  	<div>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
  			<label class="btn btn-secondary">
    			<input type="radio" name="gendermale" id="male"> Male
  			</label>
  			<label class="btn btn-secondary">
    			<input type="radio" name="genderfemale" id="female"> Female
  			</label>
		</div>	
	</div>
	</div>
	<div class = "form-group col-md-8">
		<label>Choose your daily intensity</label>
    	<select class="form-control" id="exampleFormControlSelect1">
      	<option>Min</option>
      	<option>Low</option>
      	<option>Medium</option>
      	<option>Hard</option>
      	<option>Max</option>
    </select>
	</div>
	
  </div>
  
  <button type="submit" class="btn btn-primary">Calculate</button>
  
</form>
<#if sum??>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Proteins</th>
      <th scope="col">Fats</th>
      <th scope="col">Carbohydrates</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>${sum}</td>
      <td>${sum}</td>
      <td>${sum}</td>
    </tr>
  </tbody>
</table>
</#if>
</@c.page>
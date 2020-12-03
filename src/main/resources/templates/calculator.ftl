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
  	<div class="form-control ${(errorValueGender??)?string('is-invalid', '')}">
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
  			<label class="btn btn-outline-warning">
    			<a class="sexradio"><input type="radio" name="sex" id="male" value="male"> Male</a>
  			</label>
  			<label class="btn btn-outline-danger">
    			<a class="sexradio"><input type="radio" name="sex" id="female" value="female"> Female</a>
  			</label>
		</div>
		<#if errorValueGender??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueGender}
			</div>
		</#if>
	</div>
	
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
<div class="alert alert-primary mt-2" role="alert">
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
</#if>
</@c.page>
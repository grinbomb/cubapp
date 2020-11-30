<#import "parts/common.ftl" as c>

<@c.page>

<form method="post" enctype="multipart/form-data">
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputWeight">Your weight</label>
      <input type="number" name = "weight" autocomplete="off" class="form-control ${(errorMessageWeight??)?string('is-invalid', '')}" id="inputWeight">
      	<#if errorValueWeight??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueWeight}
			</div>
		</#if>
    </div>
    <div class="form-group col-md-6">
      <label for="inputHeight">Your height</label>
      <input type="number" name = "height" autocomplete="off" class="form-control ${(errorMessageHeight??)?string('is-invalid', '')}" id="inputHeight">
      	<#if errorValueHeight??>
	   		<div class="alert alert-danger text-center" role="alert">
 				 ${errorValueHeight}
			</div>
		</#if>
	</div>
  </div>
  	
<div class="custom-control custom-radio custom-control-inline">
  <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
  <label class="custom-control-label" for="customRadioInline1">female</label>
</div>
<div class="custom-control custom-radio custom-control-inline">
  <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
  <label class="custom-control-label" for="customRadioInline2">male</label>
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
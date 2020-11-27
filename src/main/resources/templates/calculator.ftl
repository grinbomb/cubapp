<#import "parts/common.ftl" as c>

<@c.page>

<form method="get" enctype="multipart/form-data">
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputWeight">Your weight</label>
      <input type="text" name = "weight" class="form-control" id="inputWeight">
    </div>
    <div class="form-group col-md-6">
      <label for="inputHeight">Your height</label>
      <input type="text" name = "height" class="form-control" id="inputHeight">
    </div>
  </div>
  <#if errorMessage??>
 <div class="alert alert-${errorTypeData}" role="alert">${errorMessage}</div>
 </#if>
<div class="custom-control custom-radio custom-control-inline">
  <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
  <label class="custom-control-label" for="customRadioInline1">ectomorph</label>
</div>
<div class="custom-control custom-radio custom-control-inline">
  <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
  <label class="custom-control-label" for="customRadioInline2">mesomorph</label>
</div>
<div class="custom-control custom-radio custom-control-inline">
  <input type="radio" id="customRadioInline3" name="customRadioInline1" class="custom-control-input">
  <label class="custom-control-label" for="customRadioInline3">endomorph</label>
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
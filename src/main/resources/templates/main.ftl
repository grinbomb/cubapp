<#import "parts/common.ftl" as c>

<@c.page>

<#if name??>
<h2>Hello ${name} !!!</h2>
</#if>

<div style="font-size: 30px;">

<p class="text-center">"Calorie calculator" with the calculation of proteins, 
fats, carbohydrates and, to the great surprise, calories, as well as with the mechanism for 
compiling and saving the menu (by choosing ingredients) for the required date!</p>

</div>

<p class="text-center">
	<a href="/calculator" class="btn btn-success btn-lg active" role="button" aria-pressed="true">Try now!</a>
</p>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="https://i.ibb.co/Bg0j4pd/eda2.jpg" alt="First">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://i.ibb.co/DKhFdQ5/food.jpg" alt="Second">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://i.ibb.co/gR8NB1Z/eda.jpg" alt="Third">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


</@c.page>
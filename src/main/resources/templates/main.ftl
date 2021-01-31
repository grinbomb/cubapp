<#import "parts/common.ftl" as c>

<@c.page>
<div>Hello ${name} !!!</div>
<div style="font-size: 30px;">
<p class="text-center">There will be information about this service.</p>
<p class="text-center">The service was conceived as a multifunctional and convenient calorie calculator.</p>
<p class="text-center">I hope you will like it!</p>
</div>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="http://ibb.co.com/images/firsta72a48ea1ea727ee.png" alt="First">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="http://ibb.co.com/images/secondb456581d1397ac92.png" alt="Second">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="http://ibb.co.com/images/thirdc270a46b06cc4c7f.png" alt="Third">
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
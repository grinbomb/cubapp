<#macro page>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <title>CUB</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Ropa+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
</head>

<body style="   color: #055CAD;
				background-color:#67B9F7;
    			background-size: cover; 
    			height: 100%;
    			font-family: 'Ropa Sans', sans-serif;
    			font-size:20px;"
>

<#include "navbar.ftl">

<div class="container pt-5" style="background-color:#B8DAFC; background-size: cover; min-height: 100%; box-sizing: border-box; ">
<#nested>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS, then AngularJS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.js"></script>
<script src="https://code.angularjs.org/1.8.2/angular-route.js"></script>

<script>
var myApp = angular.module('AppNewCard',[]);
myApp.controller('ControllerNewCard', function ($scope, $http) {	
	$scope.product={
			name:"Name",
			calories:0.001,
			proteins:0.001,
			fats:0.001,
			carbohydrates:0.001,
			img:"https://i.ibb.co/y4nY6zh/1.png",
			gram:1
	};
	
	$scope.gram = 1;
	
	$scope.recountTestCard = function(recgr){
		
		if (recgr > 9999999) {
			$scope.gram = 9999999;
		}else if(recgr < 1) {
			$scope.gram = 1;
		}else{
			$scope.gram = recgr;
		}
    	};
});

var myApp = angular.module('AppMenu',[]);
myApp.controller('AppController', function ($scope, $http) {

$scope.cards = [];
$scope.recgram = [];

$scope.change = function(eatid, eatcategory){
	$http.post('http://localhost:8080/api/calculator',{subject:eatcategory}).then(function(response){
		$scope.cards[eatid] = response.data;
     });};
     
$scope.recount = function(recid, recgr){
	$scope.recgram[recid]=1;
		if (recgr > 9999999) {
			$scope.recgram[recid] = 9999999;
		}else if(recgr < 1) {
			$scope.recgram[recid] = 1;
		}else{
		$scope.recgram[recid] = recgr;
		}
    	};
     
});
</script>

</body>
</html>
</#macro>
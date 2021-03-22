<#macro page>
<!DOCTYPE html>
<html lang="en" style="height: 100%;" xmlns="http://www.w3.org/1999/xhtml">
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
function getCsrfHeader() {
	var csrfToken = $("input[name='_csrf']").val();

	var headers = {}; 
	headers["X-CSRF-TOKEN"] = csrfToken;
	headers["_csrf"] = csrfToken;
	return headers;
	};
	
	function deleteHeadersForApi() {

		var headers = {}; 
		headers["Content-Type"] = "multipart/form-data;";
		return headers;
		};

$(function() {
	  $('[data-toggle="popover"]').popover({
	    trigger: 'focus'
	  }); 
	})

var myApp = angular.module('AppNewCard',[]);
myApp.controller('ControllerNewCard', function ($scope, $http) {
	
	$scope.textBase64Img="";
	
	 $scope.product={
			name:"Product name",
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
/*
    	$scope.sendHttpToImgBB = function(){								//***TRYING TO CONFIGURATE API***
    		var files = document.getElementById('filePath').files;
    		var reader = new FileReader();
    		reader.readAsDataURL(files[0]);
    		reader.onload = function() {
    			console.log(reader.result);
    		
    			var file = document.getElementById('filePath');
				var form = new FormData();
				form.append("image", file.files[0])
				
				console.log(file.files[0]);
    		$http.post('https://api.imgbb.com/1/upload?key=369eefb593309d26c901ff8a3b6a5c83&image='+reader.result,{headers:deleteHeadersForApi()}).then(
    				function(response){
    					console.log(response);
    	     		},
    				function(response){
    					console.log(response);
    				});
    		};
    	}*/
});

var myApp = angular.module('AppMenu',[]);
myApp.controller('AppController', function ($scope, $http) {
	
$scope.date = new Date();
	
$scope.meals = {
		breakfast:0,
		brunch:0,
		lunch:0,
		linner:0,
		dinner:0
};

$scope.cards = [];

$scope.breakfastrecgram = [];
$scope.brunchrecgram = [];
$scope.lunchrecgram = [];
$scope.linnerrecgram = [];
$scope.dinnerrecgram = [];

$scope.breakfast = [];
$scope.brunch = [];
$scope.lunch = [];
$scope.linner = [];
$scope.dinner = [];

var breakfastProductList = [];
var brunchProductList = [];
var lunchProductList = [];
var linnerProductList = [];
var dinnerProductList = [];

$scope.sumCalories={
		breakfast:0,
		brunch:0,
		lunch:0,
		linner:0,
		dinner:0
};

var breakfastSubtrahendSum = 0;
var brunchSubtrahendSum = 0;
var lunchSubtrahendSum = 0;
var linnerSubtrahendSum = 0;
var dinnerSubtrahendSum = 0;

$scope.change = function(eatid, eatcategory){
	$http.post('http://localhost:8080/api/calculator',{subject:eatcategory},{headers:getCsrfHeader()}).then(
			function(response){
				$scope.cards[eatid] = response.data;
				console.log(response);
     		},
			function(response){
				console.log(response);
			});
	};
		
$scope.recount = function(recid, recgr, mealtime){
	if(mealtime == "breakfast"){
		$scope.breakfastrecgram[recid] = recountForTheCard($scope.breakfastrecgram, recid, recgr);
	}else if(mealtime == "brunch"){
		$scope.brunchrecgram[recid] = recountForTheCard($scope.brunchrecgram, recid, recgr);
	}else if(mealtime == "lunch"){
		$scope.lunchrecgram[recid] = recountForTheCard($scope.lunchrecgram, recid, recgr);
	}else if(mealtime == "linner"){
		$scope.linnerrecgram[recid] = recountForTheCard($scope.linnerrecgram, recid, recgr);
	}else if(mealtime == "dinner"){
		$scope.dinnerrecgram[recid] = recountForTheCard($scope.dinnerrecgram, recid, recgr);
	}
	};
	
function recountForTheCard(mealGramsByProductList, id, grm){
	if (grm > 9999999) {
		mealGramsByProductList[id] = 9999999;
	}else if(grm < 1) {
		mealGramsByProductList[id] = 1;
	}else{
		mealGramsByProductList[id] = grm;
	}
	return mealGramsByProductList[id];
}

$scope.calculateEat = function(caloriesPerOneGrm, gramUserEntered, mealtime, idThisProduct){

	if(mealtime == "breakfast"){
		
		var retVals = mealCaloriesRecount(idThisProduct, breakfastProductList, breakfastSubtrahendSum, gramUserEntered, caloriesPerOneGrm, $scope.meals.breakfast, $scope.meals.breakfastError, $scope.breakfast);
		$scope.sumCalories.breakfast = retVals[0];
		$scope.meals.breakfastError = retVals[1];
		
	}else if(mealtime == "brunch"){
		
		var retVals = mealCaloriesRecount(idThisProduct, brunchProductList, brunchSubtrahendSum, gramUserEntered, caloriesPerOneGrm, $scope.meals.brunch, $scope.meals.brunchError, $scope.brunch);
		$scope.sumCalories.brunch = retVals[0];
		$scope.meals.brunchError = retVals[1];
		
	}else if(mealtime == "lunch"){
		
		var retVals = mealCaloriesRecount(idThisProduct, lunchProductList, lunchSubtrahendSum, gramUserEntered, caloriesPerOneGrm, $scope.meals.lunch, $scope.meals.lunchError, $scope.lunch);
		$scope.sumCalories.lunch = retVals[0];
		$scope.meals.lunchError = retVals[1];
		
	}else if(mealtime == "linner"){
		
		var retVals = mealCaloriesRecount(idThisProduct, linnerProductList, linnerSubtrahendSum, gramUserEntered, caloriesPerOneGrm, $scope.meals.linner, $scope.meals.linnerError, $scope.linner);
		$scope.sumCalories.linner = retVals[0];
		$scope.meals.linnerError = retVals[1];
		
	}else if(mealtime == "dinner"){
		
		var retVals = mealCaloriesRecount(idThisProduct, dinnerProductList, dinnerSubtrahendSum, gramUserEntered, caloriesPerOneGrm, $scope.meals.dinner, $scope.meals.dinnerError, $scope.dinner);
		$scope.sumCalories.dinner = retVals[0];
		$scope.meals.dinnerError = retVals[1];
		
	}
}

function mealCaloriesRecount(id, selectedProductsList, sumMealCalories, gramUserEntered, caloriesPerOneGrm, normalMealCalories, mealErrorCalories, checkboxes){
	
	if (checkboxes[id]){
		selectedProductsList[id]=caloriesPerOneGrm*gramUserEntered;
	}else{
		selectedProductsList[id]=0;
	}
	sumMealCalories=0;
	
	selectedProductsList.forEach(arg => {
		sumMealCalories += arg;
	 });
	
	if((sumMealCalories-normalMealCalories)>10){
		mealErrorCalories=sumMealCalories-normalMealCalories;
	}else{
		mealErrorCalories=0;
	}
	
	if(sumMealCalories > normalMealCalories){
		sumMealCalories = normalMealCalories;
	}
	
	return [sumMealCalories, mealErrorCalories];
}

$scope.checkMenuDate = function(selectedDate){
	$http.post('http://localhost:8080/api/savemenu',{subject:selectedDate},{headers:getCsrfHeader()}).then(
			function(response){
				$scope.isNotFreeDate = response.data;
				console.log(response);
				console.log(selectedDate);
     		},
			function(response){
				console.log(response);
				console.log(selectedDate);
			});
	};

});
</script>

</body>
</html>
</#macro>
var app = angular.module("loadMenu",[]);

app.controller("loadMenuController", function($scope){
$scope.eats = [];

$http.get('http://localhost:8080/api/calculator').success(function(data){
	$scope.eats = data;
})



eat
}); 
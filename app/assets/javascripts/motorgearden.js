var MotorgearDen = angular.module("MGD", []);
MotorgearDen.controller('motorHome', ['$scope', function($scope) {
	 $scope.text = 0

	 $scope.addToCart = function(){
	 	$scope.text =  $scope.text + 1;
	 	console.log('Successfully added item to cart');
	 };

}]);
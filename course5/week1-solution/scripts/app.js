(function() {
  'use strict';

  angular.module('LunchCheck', [])
  .controller('LunchCheckController', LunchCheckController);

  LunchCheckController.$inject = ['$scope'];

  function LunchCheckController($scope) {
    $scope.displayMessage = function() {
      var items = $scope.lunchItems;

      // If undefined or empty list
      if (!("lunchItems" in $scope) || items.length == 0) {
        $scope.message = "Please enter data first";
        $scope.messageColor = "red";
        $scope.borderColor = "red";
        return;
      }

      var numItems = countItems(items);

      if (numItems == 0) {
        $scope.message = "Please enter data first";
        $scope.messageColor = "red";
        $scope.borderColor = "red";
      } else if (numItems <= 3) {
        $scope.message = "Enjoy!";
        $scope.messageColor = "green";
        $scope.borderColor = "green";
      } else {
        $scope.message = "Too much!";
        $scope.messageColor = "green";
        $scope.borderColor = "green";
      }

    };
  }

  function countItems(array) {
    var items = array.split(',');
    var count = 0;

    for (var i = 0; i < items.length; i++) {
      if (items[i].trim().length != 0) {
        count++;
      }
    }

    return count;
  }

}());

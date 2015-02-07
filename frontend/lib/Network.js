'use strict';
angular.module('services.cordova', ['ionic'])

/**
 * CordovaNetwork AngularJS service
 * 
 * com.apache.cordova.network-information wrapper for AngularJS with fallback for testing without Cordova 
 */
.service('CordovaNetwork', ['$rootScope', '$ionicPlatform', function($rootScope, $ionicPlatform) {
  var networkConnection = navigator.connection || {
    type: 'UNKNOWN'
  };

  // These services are written with full Ionic Framework integration.
  $ionicPlatform.ready(function () {
    document.addEventListener('offline', function () {
      $rootScope.$broadcast('Cordova.NetworkStatus.Offline');
    }, false);
    document.addEventListener('online', function () {
      $rootScope.$broadcast('Cordova.NetworkStatus.Online');
    }, false);
  });

  return {
    isOnline: function () {
      var blnReturn = false;

      switch (this.getStatus()) {
        case 'wifi':
          blnReturn = true;
          break;
      }

      return blnReturn;
    },

    getStatus: function () {
      return networkConnection.type;
    }
  };
}]);

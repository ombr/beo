angular.module('frontend.database', ['firebase'])
.factory 'database', ($firebase)->
  $firebase(new Firebase('https://beo.firebaseio.com/'))

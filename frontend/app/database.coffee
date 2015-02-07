angular.module('frontend.database', ['firebase'])
.factory 'database', ($firebase)->
  $firebase(new Firebase('https://beo.firebaseio.com/'))
.factory 'userdatabase', ($firebase)->
  get: (username)->
    $firebase(new Firebase("https://beo.firebaseio.com/#{username}"))

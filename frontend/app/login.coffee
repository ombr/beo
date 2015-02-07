angular.module('frontend.login', [])
  .controller 'loginCtrl', ($scope, $localStorage, $stateParams, $ionicHistory, $state, $ionicLoading, database)->
    user = $localStorage.user || {
      username: ''
      password: ''
    }
    $scope.user = user
    $scope.login = ()->
      $ionicLoading.show template: 'Loading...'
      setTimeout (->
        if user.username != '' and user.password != ''
          $localStorage.user = user
          $state.go('home')
        else
          alert 'Invalid user'
        $ionicLoading.hide()
      ), 2000
    $ionicHistory.nextViewOptions disableBack: true

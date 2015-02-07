angular.module('frontend.login', ['frontend.database'])
  .controller 'loginCtrl', ($scope, $localStorage, $stateParams, $ionicHistory, $state, $ionicLoading, database)->
    console.log 'ICI !'
    user = $localStorage.user || { username: '', password: '' }
    $scope.user = user
    login_error =(msg)->
      alert msg
      $ionicLoading.hide()

    root = database.$asObject()
    $scope.login = ()->
      $ionicLoading.show template: 'Loading...'
      return login_error('Invalid Username') if user.username == ''
      return login_error('Invalid Password') if user.password == ''
      root.$loaded().then ->
        if root[user.username] != undefined
          console.log root[user.username].password, user.password
          return login_error('Invalid Password') if root[user.username].password != user.password
        $localStorage.user = user
        root[user.username] = user
        root.$save()
        $ionicLoading.hide()
        $state.go('home')
    $ionicHistory.nextViewOptions disableBack: true

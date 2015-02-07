angular.module('frontend.home', ['frontend.database'])
  .controller 'homeCtrl', ($scope, $localStorage, $stateParams, $ionicHistory, $state, $ionicLoading, userdatabase)->
    database = userdatabase.get($localStorage.user.username)
    syncObject = database.$asObject()
    syncObject.$loaded().then ->
      if syncObject['volume'] == undefined
        syncObject['volume'] = 80
        syncObject.$save()
    syncObject.$bindTo($scope, 'root')
    DZ.player.playTracks([2423901])
    $scope.login_deezer = ()->
      DZ.player.playTracks([45445081])
      # $scope.root.volume = 50
      # DZ.login (response)->
    $scope.$watch 'root.volume', ->
      DZ.player.setVolume($scope.root.volume)
      console.log $scope.root.volume
      #   console.log response
    console.log $localStorage.user
    $scope.user = $localStorage.user

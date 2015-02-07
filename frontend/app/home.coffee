angular.module('frontend.home', ['frontend.database'])
  .controller 'homeCtrl', ($scope, $localStorage, $stateParams, $ionicHistory, $state, $ionicLoading, database)->
    console.log "ICI !!"
    syncObject = database.$asObject()
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

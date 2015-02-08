angular.module('frontend.home', ['frontend.database'])
  .controller 'homeCtrl', ($scope, $localStorage, $stateParams, $ionicHistory, $state, $ionicLoading, userdatabase)->
    database = userdatabase.get($localStorage.user.username)
    syncObject = database.$asObject()
    syncObject.$loaded().then ->
      if syncObject['volume'] == undefined
        syncObject['volume'] = 80
        syncObject.$save()
      syncObject.$bindTo($scope, 'root')
      $scope.$watch 'root.theme', ->
        DZ.player.playPlaylist($scope.styles[$scope.root.theme])
        DZ.player.setVolume($scope.root.volume)
      $scope.$watch 'root.volume', ->
        DZ.player.setVolume($scope.root.volume)
        console.log $scope.root.volume
      # $scope.root.volume = 50
      # DZ.login (response)->
    $scope.styles = {
      'Zen': 1068059761,
      'Pop': 919941465,
      'Reggae': 18378862,
      'Rock': 945089123,
      'Classique': 1053310671,
      'Rap': 19136856,
    }
    #   console.log response
    console.log $localStorage.user
    $scope.user = $localStorage.user

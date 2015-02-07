#= require login.coffee
#= require home.coffee
#= require database.coffee
angular.module('frontend', ['ionic',
                            'angularMoment',
                            'frontend.login',
                            'frontend.home',
                            'restangular',
                            'ngStorage'])
  .config ($stateProvider, $urlRouterProvider)->
    $stateProvider
      .state('login', {
        url: '/login',
        views:
          'mainContent':
            templateUrl: 'templates/login.html',
            controller: 'loginCtrl'
      })
      .state('home', {
        url: '/home',
        views:
          'mainContent':
            templateUrl: 'templates/home.html',
            controller: 'homeCtrl'
      })
    $urlRouterProvider.otherwise('/login')
  .config (RestangularProvider)->
    RestangularProvider.setBaseUrl('http://192.168.1.181:5000')
    # RestangularProvider.setBaseUrl('http://poc-backend.herokuapp.com')
    # RestangularProvider.setBaseUrl('http://offline.asdasdaasd')
    return RestangularProvider
  .run ($ionicPlatform) ->
    $ionicPlatform.ready ->
      ionic.Platform.fullScreen(true, false)
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar true  if window.cordova and window.cordova.plugins.Keyboard
      StatusBar.hide()  if window.StatusBar
      DZ.init(
        appId  : '151761',
        channelUrl : 'http://developers.deezer.com/examples/channel.php'
        player: {
          onload: ->
            console.log 'Deezer loaded !'
        }
      )
  .service

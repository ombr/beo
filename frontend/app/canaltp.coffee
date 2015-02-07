angular.module('frontend.canaltp', [])
.factory 'canaltp', ($http)->
  get : ()->
    config = 
      headers: 
        'Authorization':'e165c679-1d48-46f0-afc0-abf9c825f990'
    $http.get('http://api.navitia.io/v1/journeys?from=48.843524;2.260854&to=48.857801;2.380110&datetime=20150219T0800',config)
    
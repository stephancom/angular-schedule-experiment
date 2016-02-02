angular.module 'scheduler'
  .config ($logProvider) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true

.config (localStorageServiceProvider) ->
    'ngInject'
    localStorageServiceProvider.setPrefix 'ls'

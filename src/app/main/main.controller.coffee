angular.module 'scheduler'
  .controller 'MainController', ($timeout, Job) ->
    'ngInject'
    vm = this

    vm.creationDate = 1453535716432

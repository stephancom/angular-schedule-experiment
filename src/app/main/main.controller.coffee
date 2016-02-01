angular.module 'scheduler'
  .controller 'MainController', ($timeout, Job, webDevTec, toastr) ->
    'ngInject'
    vm = this
    activate = ->
      getWebDevTec()
      # getJobs()
      $timeout (->
        vm.classAnimation = 'rubberBand'
        return
      ), 4000
      return

    showToastr = ->
      toastr.info 'Fork <a href="https://github.com/Swiip/generator-gulp-angular" target="_blank"><b>generator-gulp-angular</b></a>'
      vm.classAnimation = ''
      return

    getJobs = ->
      vm.jobs = [
        new Job(command: "Foo bar")
        new Job(command: "Baz bum", dyno_size: Job.DYNO_SIZES.slice(-1)[0], frequency: Job.FREQUENCIES.slice(-1)[0])
      ]

    getWebDevTec = ->
      vm.awesomeThings = webDevTec.getTec()
      angular.forEach vm.awesomeThings, (awesomeThing) ->
        awesomeThing.rank = Math.random()
        return
      return


    vm.awesomeThings = []
    getJobs()
    vm.dyno_sizes = Job.DYNO_SIZES
    vm.classAnimation = ''
    vm.creationDate = 1453535716432
    vm.showToastr = showToastr
    activate()
    return

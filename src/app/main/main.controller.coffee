angular.module 'scheduler'
  # missing: jobStorageFactory
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


    # vm.jobs = jobStorageFactory.getjobs()

    # if vm.jobs == []
    #   vm.jobs = [
    #     new Job(command: "Test Job One")
    #     new Job(command: "Test Job Two", dyno_size: Job.DYNO_SIZES.slice(-1)[0], frequency: Job.FREQUENCIES.slice(-1)[0])
    #   ]

    # vm.count = vm.jobs.length

    # vm.addJob = ->
    #   vm.jobs.push(
    #     new Job(command: vm.command, dyno_size: vm.dyno_size, frequency: vm.frequency)
    #   )
    #   jobStorageFactory.updatejobs vm.jobs
    #   vm.command = ''
    #   vm.dyno_size = Job.DYNO_SIZES[0]
    #   vm.frequency = Job.FREQUENCIES[0]
    #   vm.count = vm.jobs.length

    # vm.deleteJob = (job) ->
    #   vm.jobs.splice vm.jobs.indexOf(job), 1
    #   jobStorageFactory.updatejobs vm.jobs
    #   vm.count = vm.jobs.length

    vm.awesomeThings = []
    # vm.jobs = []
    # getJobs()
    # vm.dyno_sizes = Job.DYNO_SIZES
    vm.classAnimation = ''
    vm.creationDate = 1453535716432
    vm.showToastr = showToastr
    activate()

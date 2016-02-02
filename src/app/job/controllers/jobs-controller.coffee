'use strict'
###*
# @ngdoc function
# @name scheduler.controller:jobCtrl
# @description
# # jobCtrl
# Controller of the scheduler
###
angular.module('scheduler')
.controller 'jobsCtrl', (jobStorageFactory, Job, $log) ->
  'ngInject'
  vm = this

  # vm.jobs = jobStorageFactory.getjobs()

  # if vm.jobs == []
  vm.jobs = [
    new Job(command: "Test Job One")
    new Job(command: "Test Job Two", dyno_size: Job.DYNO_SIZES.slice(-1)[0].value, frequency: Job.FREQUENCIES.slice(-1)[0].value)
  ]

  vm.addJob = ->
    vm.jobs.push(
      new Job(command: vm.command, dyno_size: vm.dyno_size, frequency: vm.frequency)
    )
    jobStorageFactory.updatejobs vm.jobs
    vm.command = ''
    vm.dyno_size = Job.DYNO_SIZES[0].value
    vm.frequency = Job.FREQUENCIES[0].value
    vm.count = vm.jobs.length

  vm.deleteJob = (job) ->
    vm.jobs.splice vm.jobs.indexOf(job), 1
    jobStorageFactory.updatejobs vm.jobs
    vm.count = vm.jobs.length

  vm # for some reason, you need to return 'this' for 'controller as' usage
  # however, this doesn't apply to main.controller?  TODO figure out why?

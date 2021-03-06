# by: _            _
#  __| |_ ___ _ __| |_  __ _ _ _    __ ___ _ __
# (_-<  _/ -_) '_ \ ' \/ _` | ' \ _/ _/ _ \ '  \
# /__/\__\___| .__/_||_\__,_|_||_(_)__\___/_|_|_|
#            |_|              stephan@stephan.com

'use strict'
###*
# @ngdoc function
# @name scheduler.controller:jobCtrl
# @description
# # jobCtrl
# Controller of the scheduler
###
angular.module('scheduler')
.controller 'jobsCtrl', (jobStorageFactory, Job) ->
  'ngInject'
  vm = this

  vm.jobs = jobStorageFactory.getjobs()

  vm.addJob = ->
    # TODO validate
    vm.jobs.push(vm.newJob)
    jobStorageFactory.updatejobs vm.jobs
    vm.newJob = new Job(command: '')
    vm.showNewJobForm = false
    vm.command = ''
    vm.dyno_size = Job.DYNO_SIZES[0].value
    vm.frequency = Job.FREQUENCIES[0].value
    vm.count = vm.jobs.length

  vm.removeJob = (jobIndex) ->
    vm.jobs.splice jobIndex, 1
    jobStorageFactory.updatejobs vm.jobs
    vm.count = vm.jobs.length

  vm.editJob = (jobIndex, job) ->
    vm.jobs[jobIndex] = job
    jobStorageFactory.updatejobs vm.jobs
    vm.count = vm.jobs.length

  vm.dyno_sizes = Job.DYNO_SIZES
  vm.frequencies = Job.FREQUENCIES
  vm.newJob = new Job(command: '')

  vm # for some reason, you need to return 'this' for 'controller as' usage
  # however, this doesn't apply to main.controller?  TODO figure out why?

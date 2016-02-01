'use strict'
###*
# @ngdoc function
# @name scheduler.controller:jobCtrl
# @description
# # jobCtrl
# Controller of the scheduler
###
angular.module('scheduler')
.controller 'jobsCtrl', [
  '$scope'
  'jobStorageFactory'
  'Job'
  ($scope, jobStorageFactory, Job) ->

    $scope.jobs = jobStorageFactory.getjobs()

    if $scope.jobs == []
      $scope.jobs = [
        new Job(command: "Test Job One")
        new Job(command: "Test Job Two", dyno_size: Job.DYNO_SIZES.slice(-1)[0], frequency: Job.FREQUENCIES.slice(-1)[0])
      ]

    $scope.count = $scope.jobs.length

    $scope.addJob = ->
      $scope.jobs.push(
        new Job(command: $scope.command, dyno_size: $scope.dyno_size, frequency: $scope.frequency)
      )
      jobStorageFactory.updatejobs $scope.jobs
      $scope.command = ''
      $scope.dyno_size = Job.DYNO_SIZES[0]
      $scope.frequency = Job.FREQUENCIES[0]
      $scope.count = $scope.jobs.length

    $scope.deleteJob = (job) ->
      $scope.jobs.splice $scope.jobs.indexOf(job), 1
      jobStorageFactory.updatejobs $scope.jobs
      $scope.count = $scope.jobs.length
]

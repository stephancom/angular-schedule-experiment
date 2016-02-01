'use strict'

###*
# @ngdoc service
# @name scheduler.job
# @description
# # job
# Factory in the scheduler.
###
angular.module('scheduler')
.factory 'Job', ->
  class Job
    @DYNO_SIZES = [
      '1X'
      '2X'
      'PX'
    ]
    @FREQUENCIES =[
      'Daily'
      'Hourly'
      'Every 10 minutes'
    ]

    command: ''
    dyno_size: Job.DYNO_SIZES[0]
    frequency: Job.FREQUENCIES[0]
    last_run: null
    next_due: Date.now()

    constructor: ({@command, @dyno_size = Job.DYNO_SIZES[0], @frequency = Job.FREQUENCIES[0], @last_run, @next_due}) ->
      @next_due = Date.now()
      # @dyno_size = @dyno_size || Job.DYNO_SIZES[0]
      # @frequency = @frequency || Job.FREQUENCIES[0]
      # @last_run = null


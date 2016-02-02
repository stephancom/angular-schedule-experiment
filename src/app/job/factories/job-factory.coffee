# by: _            _
#  __| |_ ___ _ __| |_  __ _ _ _    __ ___ _ __
# (_-<  _/ -_) '_ \ ' \/ _` | ' \ _/ _/ _ \ '  \
# /__/\__\___| .__/_||_\__,_|_||_(_)__\___/_|_|_|
#            |_|              stephan@stephan.com

'use strict'

###*
# @ngdoc service
# @name scheduler.job
# @description
# # job
# Represents a single job
###
angular.module('scheduler')
.factory 'Job', (moment) ->
  'ngInject'
  class Job
    @DYNO_SIZES = [
      {label: '1X', value: 1}
      {label: '2X', value: 2}
      {label: 'PX', value: 16}
    ]
    @FREQUENCIES =[
      {label: 'Daily', value: 1440}
      {label: 'Hourly', value: 60}
      {label: 'Every 10 minutes', value: 10}
    ]

    command: ''
    dyno_size: Job.DYNO_SIZES[0].value
    frequency: Job.FREQUENCIES[0].value
    last_run: null
    next_due: Date.now()

    constructor: ({@command = '', @dyno_size = Job.DYNO_SIZES[0].value, @frequency = Job.FREQUENCIES[0].value, @last_run, @next_due}) ->
      @last_run = Date.now()
      @next_due = Date.now()
      # @dyno_size = @dyno_size || Job.DYNO_SIZES[0].value
      # @frequency = @frequency || Job.FREQUENCIES[0].value
      # @last_run = null

    last_run_date: ->
      moment.utc(@last_run).format('MMM D H:mm UTC')

    next_due_date: ->
      moment.utc(@next_due).format('MMM D H:mm UTC')

    # sorry, buddy, no lodash here! (well, not easily)
    # coffeescript comprehensions to the rescue
    dyno_size_label: ->
      # _.findWhere(Job.DYNO_SIZES, {value: @dyno_size}).label
      find = (i for i in Job.DYNO_SIZES when i.value is @dyno_size)[0].label

    frequency_label: ->
      # _.findWhere(Job.FREQUENCIES, {value: @frequency}).label
      find = (i for i in Job.FREQUENCIES when i.value is @frequency)[0].label

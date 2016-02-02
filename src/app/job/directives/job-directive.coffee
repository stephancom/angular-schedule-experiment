'use strict'
###*
# @ngdoc directive
# @name scheduler.directive:job
# @description
# # job
###
angular.module('scheduler')
.directive 'schedulerJob', (Job, moment) ->
  'ngInject'
  scope:
    job: '=job'
  templateUrl: 'app/job/partials/job.html'
  restrict: 'E'
  link: (scope, element, attrs) ->
    scope.dyno_sizes = Job.DYNO_SIZES
    scope.frequencies = Job.FREQUENCIES

# by: _            _
#  __| |_ ___ _ __| |_  __ _ _ _    __ ___ _ __
# (_-<  _/ -_) '_ \ ' \/ _` | ' \ _/ _/ _ \ '  \
# /__/\__\___| .__/_||_\__,_|_||_(_)__\___/_|_|_|
#            |_|              stephan@stephan.com

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

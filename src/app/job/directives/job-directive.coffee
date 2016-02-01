'use strict'
###*
# @ngdoc directive
# @name scheduler.directive:job
# @description
# # job
###
angular.module('scheduler')
.directive('schedulerJob', ->
  scope:
    job: '=job'
  templateUrl: 'app/job/partials/job.html'
  # template: '<div></div>'
  restrict: 'E'
  # link: (scope, element, attrs) ->
  #   element.text 'this is the job directive'
)

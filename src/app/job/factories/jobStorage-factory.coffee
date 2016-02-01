'use strict'

###*
# @ngdoc service
# @name scheduler.jobStorage
# @description
# # jobStorage
# Handles local storage of the list of jobs
###
angular.module('scheduler')
.factory 'jobStorageFactory', ->
  jobList = {}
  {
    list: jobList
    updatejobs: (jobsArr) ->
      if window.localStorage and jobsArr
        localStorage.setItem 'jobs', angular.toJson(jobsArr)
      jobList = jobsArr
    getjobs: ->
      jobList = angular.fromJson(localStorage.getItem('jobs'))
      if jobList then jobList else []
  }

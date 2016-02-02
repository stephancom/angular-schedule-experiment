# by: _            _
#  __| |_ ___ _ __| |_  __ _ _ _    __ ___ _ __
# (_-<  _/ -_) '_ \ ' \/ _` | ' \ _/ _/ _ \ '  \
# /__/\__\___| .__/_||_\__,_|_||_(_)__\___/_|_|_|
#            |_|              stephan@stephan.com

'use strict'

###*
# @ngdoc service
# @name scheduler.jobStorage
# @description
# # jobStorage
# Handles local storage of the list of jobs
###
angular.module('scheduler')
.factory 'jobStorageFactory', (localStorageService) ->
  jobList = {}
  {
    list: jobList
    updatejobs: (jobsArr) ->
      if jobsArr
        localStorageService.set 'jobs', angular.toJson(jobsArr)
      jobList = jobsArr
    getjobs: ->
      jobList = angular.fromJson(localStorageService.get('jobs'))
      if jobList then jobList else []
  }

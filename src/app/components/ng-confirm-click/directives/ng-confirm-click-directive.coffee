# by: _            _
#  __| |_ ___ _ __| |_  __ _ _ _    __ ___ _ __
# (_-<  _/ -_) '_ \ ' \/ _` | ' \ _/ _/ _ \ '  \
# /__/\__\___| .__/_||_\__,_|_||_(_)__\___/_|_|_|
#            |_|              stephan@stephan.com

'use strict'
###*
# @ngdoc directive
# @name scheduler.directive:ngConfirmClick
# @description
# # gets confirmation before an ng-click
###
angular.module('scheduler')
.directive 'ngConfirmClick', ->
  priority: -1
  restrict: 'A'
  link: (scope, element, attrs) ->
    element.bind 'click', (e) ->
      message = attrs.ngConfirmClick
      if message and !confirm(message)
        e.stopImmediatePropagation()
        e.preventDefault()

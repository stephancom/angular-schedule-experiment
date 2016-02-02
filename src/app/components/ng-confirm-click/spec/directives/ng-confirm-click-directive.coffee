'use strict'

describe 'Directive: ngConfirmClick', ->

  # load the directive's module
  beforeEach module 'scheduler'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    expect(element.text()).toBe 'this is the ngConfirmClick directive'

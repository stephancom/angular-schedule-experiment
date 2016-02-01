describe 'Factory: jobsFactory', ->
  beforeEach module('scheduler')

  jobs = {}

  beforeEach inject((_jobsFactory_) ->
    jobs = _jobsFactory_
  )

  it 'should provide the meaning of life', ->
    expect(jobs.someMethod() == 42).toBeTruthy()



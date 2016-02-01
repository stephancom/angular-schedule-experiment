describe 'Factory: jobStorageFactory', ->
  beforeEach module('scheduler')

  jobStorage = {}

  beforeEach inject((_jobStorageFactory_) ->
    jobStorage = _jobStorageFactory_
  )

  it 'should provide the meaning of life', ->
    expect(jobStorage.someMethod() == 42).toBeTruthy()



flatten = require '../flatten'
assert = require 'assert'

describe 'flatten', ->
  testObject = {
    a: "Hello"
    b: 1234
    c: true
    d: null
    e: {}
    f: {
      g: "foo"
      h: {
        bar: "bar"
      }
    }
  }

  flatObject = {
    a: "Hello"
    b: 1234
    c: true
    d: null
    "f.g" : "foo"
    "f.h.bar" : "bar"
  }

  it 'will throw an exception when passing null',->
    assert.throws -> flatten null

  it 'will throw an exception when passing a string',->
    assert.throws -> flatten "test"

  it 'will throw an exception when passing a number',->
    assert.throws -> flatten 1

  it 'will throw an exception when passing an array',->
    assert.throws -> flatten [1,2,3]

  it 'will not throw an exception when passing an object',->
    assert.doesNotThrow -> flatten testObject

  it 'will throw an exception when flattening an object with an array',->
    assert.throws -> flatten {arr:[1,2,3]}

  it 'will throw an exception when flattening an object with a RegExp',->
    assert.throws -> flatten {regex: /whatever/ }

  it 'will flatten the object',->
    result = flatten testObject
    assert.ok result
    assert.deepEqual result, flatObject

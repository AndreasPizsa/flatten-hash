_ = require 'lodash'
assert = require 'assert'

flatten = (obj,separator='.')->
  assert.notEqual obj,null, 'obj must be != null'
  assert not _.isArray obj
  assert _.isObject obj

  flattenOne =  (plainObject,namespace='',result={})->
    return _.reduce plainObject,(result,value,key)->
      newKey = "#{namespace}#{if namespace then separator else '' }#{key}"
      if _.isPlainObject(value)
        if _.size value then flattenOne(value,newKey,result)
        #else result[newKey] = {}
      else
        result[newKey] = value
      return result
    , result

  filterRegexpAndArray = (key,value)->
    if _.isRegExp(value) then throw new Error "Can't flatten RegExp"
    if _.isArray(value)  then throw new Error "Can't flatten Array"
    return value

  plainNested = JSON.parse(JSON.stringify(obj,filterRegexpAndArray))
  return flattenOne plainNested

module.exports = flatten

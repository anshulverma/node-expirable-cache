MIN_EXPIRY_INTERVAL = 100  # minimum expiry interval of 100 msec

module.exports = ->
  new ExpirableCache()

class ExpirableCache
  constructor: (@options = {}) ->
    @options.expiryInterval ?= 1000  # default expiry interval of 1 sec
    if @options.expiryInterval < MIN_EXPIRY_INTERVAL
      throw new Error "expiry interval cannot be less than #{MIN_EXPIRY_INTERVAL}"

class Cache
  constructor: ->
    @cache = {}

  put: (key, value) ->
    throw new Error 'undefined key' unless key
    @cache[key] = new CacheValue(value)

class CacheValue
  constructor: (@value) ->

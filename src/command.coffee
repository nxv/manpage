_ = require 'underscore'
Argument = require './argument'
Option = require './option'

module.exports = class Command
  constructor: (options = {}) ->
    if typeof options == 'string'
      options = name: options
    @name = options.name || ''
    @alias = [].concat options.alias || []
    @args = _.clone options.args || {}
    @opts = _.clone options.opts || {}
    @defaultOpts = options.defaultOpts || {}
    @aliasOf = options.aliasOf || no
    @desc = options.desc || ''

  createAlias: (name) ->
    ret = new Command @
    ret.name = name
    ret.aliasOf = @
    ret.args = @args
    ret.opts = @opts
    ret

  addArgs: (args) ->

  isEuqal: (cmd) ->
    if typeof cmd == 'string'
      cmd in @alias
    else if cmd instanceof Command
      cmd.name in @alias
    else no

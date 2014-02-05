_ = require 'underscore'
parser = require './parser'
Command = require './command'

parseCommand = (names, rule, cmds, defaultCmd) ->
  alreadHave = []
  findAlias = (n) -> (c) -> c.isEuqal n
  for name in names
    for n in name
      alias = alreadHave.find findAlias n
      if c = cmds[n]
        unless alias
          alreadHave.push c
      else
        # if n == 'default' #########!!!!
        if alias
          cmds.push alias.createAlias n
        else
          alreadHave.push new Command
            name: n
            alias: name
            args: rule.args
            defaultOpts: defaultCmd.opts
  alreadHave


module.exports = class ManPage
  constructor: ->
    @cmds = {}
    @default = new Command
  parse: (scheme) ->
    return lines = parser.readLines scheme
    cmds = [@default]
    for line in lines
      rule = parser.parseLine line
      if rule.type == 'command'
        cmds = parseCommand rule.names, rule, @cmds, @default


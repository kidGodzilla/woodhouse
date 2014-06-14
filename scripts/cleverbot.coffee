# Description:
#   "Makes Woodhouse even more Clever™ - forked from https://github.com/github/hubot-scripts/blob/master/src/scripts/cleverbot.coffee"
#
# Dependencies:
#   "cleverbot-node": "0.1.1"
#
# Configuration:
#   None
#
# Commands:
#   none - Any unhandled command given to Woodhouse will be replied to by his Cleverbot brain
#
# Author:
#   Sean King - credit to ajacksified for original

cleverbot = require('cleverbot-node')

module.exports = (robot) ->
  c = new cleverbot()

  robot.catchAll (msg) ->
    data = msg.match[1].trim()
    c.write(data, (c) => msg.send(c.message))
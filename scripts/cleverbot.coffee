# Description:
#   "Makes Woodhouse even more Clever™"
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
#   Sean King

cleverbot = require('cleverbot-node')

module.exports = (robot) ->
  bot_sessions = {}

  robot.catchAll (msg) ->
    search = new RegExp("(.+)?" + robot.name + "(.+)?", "i")
    if msg.message.text and msg.message.text.match(search)
        sessionKey = if msg.message.room then msg.message.room else msg.message.user.name
        if not bot_sessions[sessionKey]?
            bot_sessions[sessionKey] = new cleverbot()
        c = bot_sessions[sessionKey]
        replace = new RegExp("^(@?" + msg.robot.name + "[:,]?)", "i")
        data = msg.message.text.trim().replace(replace, '').trim()
        c.write(data, (c) =>
            response = c.message.replace /cleverbot/i, msg.robot.name
            msg.send(response)
        )
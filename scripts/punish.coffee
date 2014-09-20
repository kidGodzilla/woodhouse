# Description:
#   Woodhouse, I'm going to have to punish you.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Punish him! Make him eat spiderwebs.


module.exports = (robot) ->
  robot.respond /(.*)punish(.*)/i, (msg) ->
    msg.send "I shall fetch the spiderwebs, sir"

  robot.respond /(.*).spiderwebs(.*)/i, (msg) ->
    msg.send "I know, sir"
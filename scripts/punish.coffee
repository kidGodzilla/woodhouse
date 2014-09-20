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
    msg.finish()

  listen_punish = new RegExp("(.*)punish(.*)("+ robot.name + ")(.*)", "i")
  robot.hear listen_punish, (msg) ->
    msg.send "I shall fetch the spiderwebs, sir"
    msg.finish()

  robot.respond /(.*)spiderwebs(.*)/i, (msg) ->
    msg.send "I know, sir"
    msg.finish()

  listen_spiderwebs = new RegExp("((.*)" + robot.name + "(.*)spiderwebs(.*))|((.*)spiderwebs(.*)"+ robot.name + "(.*))", "i")
  robot.hear listen_spiderwebs, (msg) ->
    msg.send "I know, sir"
    msg.finish()
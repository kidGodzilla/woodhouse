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
    msg.send "I shall fetch the spiderwebs!"
    msg.finish()

  listen_punish = new RegExp("(.*)punish(.*)(" + robot.alias + "|" + robot.name + ")(.*)", "i")
  robot.hear listen_punish, (msg) ->
    msg.send "Wonderful! I shall fetch the spiderwebs at once"
    msg.finish()

  robot.respond /(.*)spiderwebs(.*)/i, (msg) ->
    msg.send "I am beginning to enjoy them sir"
    msg.finish()

  listen_spiderwebs = new RegExp("((.*)" + robot.name + "(.*)spiderwebs(.*))|((.*)spiderwebs(.*)"+ robot.name + "(.*))", "i")
  robot.hear listen_spiderwebs, (msg) ->
    msg.send "I know, sir"
    msg.finish()
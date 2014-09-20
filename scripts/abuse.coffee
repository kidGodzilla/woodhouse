# Description:
#   Woodhouse, handle that abuse like a boss.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None. Abuse the shit out of Woodhouse and he'll grit his teeth and bear it.


insults = [
    "fuck off",
    "fuck you",
    "asshole",
    "screw yourself",
    "fuck yourself",
    "go away",
    "screw off",
    "bugger off",
    "piss off",
    "dickhead",
    "cunt",
    "will end you",
    "will kill you",
    "eat a dick",
    "shutup",
    "wanker"
]

replies = [
    "Very good, sir",
    "As you wish, sir",
    "Yes, sir",
    "Of course, sir",
    "I was out of place, sir",
    "My apologies sir",
    "How may I ever redeem myself sir?",
    "Very well"
]

abuse = insults.join("|")

module.exports = (robot) ->
  listen_abuse = new RegExp("((.*)(" + robot.alias + "|" + robot.name + ")(.*)(" + abuse + ")(.*))|((.*)(" + abuse + ")(.*)(" + robot.alias + "|" + robot.name + ")(.*))", "i")
  robot.hear listen_abuse, (msg) ->
    reply = msg.random(replies)
    msg.send(reply)
    msg.finish()

  respond_abuse = new RegExp("(.*)(" + abuse + ")(.*)", "i")
  robot.respond respond_abuse, (msg) ->
    reply = msg.random(replies)
    msg.send(reply)
    msg.finish()

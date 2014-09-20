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

yessirs = [
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
  listen_abuse = new RegExp("(.*)" + robot.name + "(.*)?" + abuse + "(.*)", "i")
  robot.hear listen_abuse, (msg) ->
    yessir = msg.random(yessirs)
    msg.send(yessir)

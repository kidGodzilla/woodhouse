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
#   None. Treat Woodhouse like crap and he'll do his best to grin and bear it.

abuseList = [
    "fuck off",
    "fuck you",
    "go screw yourself",
    "shutup",
    "piss off",
    "go to hell",
    "asshole",
    "screw you",
    "go away",
    "I will kill you"
]

abuses = abuseList.join("|")

replies = [
    "yes, sir.",
    "very good, sir.",
    "as you wish sir",
    "of course, sir",
    "it would be my pleasure sir"
]


module.exports = (robot) ->
    name = '('+robot.name+'|'+robot.alias+')',

    robot.respond /"+abuses+"/i, (msg) ->
        reply = msg.random replies
        msg.send reply

    robot.hear /((.*) ("+abuses+" ("+_name+")))/i, (msg) ->
        reply = msg.random replies
        msg.send reply
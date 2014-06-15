# Description:
#   Woodhouse, be polite and say hello.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None. Say hello to Woodhouse and he will greet you back.

greetings = [
    "Hello, sir.",
    "Good day, %.",
    "At your service, sir.",
    "Pleasure to see you, %.",
    "Pleasure to see you, sir."
]

module.exports = (robot) ->
    name = '('+robot.name+'|'+robot.alias+')',

    robot.respond /hi|hello|good day|good morning|morning|afternoon/i, (msg) ->
        hello = msg.random greetings
        msg.send hello.replace "%", msg.message.user.name

    robot.hear /(hi|hello|good day|good morning|morning|afternoon) ("+_name+")/i, (msg) ->
        hello = msg.random greetings
        msg.send hello.replace "%", msg.message.user.name

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


salutations = [
    "hi",
    "hello",
    "hey",
    "good day",
    "good morning",
    "morning",
    "afternoon",
    "heya",
    "whatup"
]

replies = [
    "Hello, sir.",
    "Good day, sir.",
    "At your service, sir.",
    "Pleasure to see you, sir.",
    "Greetings and salutations sir"
]

greetings = salutations.join("|")

module.exports = (robot) ->
  listen_hello = new RegExp("(.*)(" + greetings + ")(.*)(" + robot.name + ")(.*)", "i")
  robot.hear listen_hello, (msg) ->
    reply = msg.random(replies)
    msg.send(reply)
    msg.finish()

  respond_hello = new RegExp("(.*)(" + greetings + ")(.*)", "i")
  robot.respond respond_hello, (msg) ->
    reply = msg.random(replies)
    msg.send(reply)
    msg.finish()


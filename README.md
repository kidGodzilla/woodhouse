# Meet Woodhouse

This is Woodhouse, our personal cyborg butler. He's built on Github's [HUBOT](https://hubot.github.com/), runs on our Services server in his own Docker container, and talks to us on Slack.

## What He Can Do
Here's a non-exhaustive list of some of the things Woodhouse can do for you:

- Converse. Woodhouse is smarter than he looks, say hello and he'll greet you back, abuse him and he'll do his best to grin and bear it, just talk to him in general and he'll say something clever (literally, any unhandled exceptions get routed to an auxilliary [Cleverbot](http://cleverbot.com) brain)

- Give you wise counsel. Just ask ```what should I do about...``` or ```how do you handle...``` or simply ```I need some advice```.

- Solve all your problems. Just ask ```how do I...``` and Woodhouse will find the answer on StackOverflow.

- Fetch the IP address of his server. ```woodhouse ip``` will do the trick.

- Check if a website is up, with ```woodhouse isup [site]```.

- Generate all the memes. Just about any sane ```woodhouse <optional inputs> [meme name] <optional inputs>``` you throw at him will get you an awesome customized meme. Full list [here](https://github.com/github/hubot-scripts/blob/master/src/scripts/meme_captain.coffee).

- Learn! Use this format to teach him new tricks ```woodhouse when you hear <pattern> do <something woodhouse does>```.

- Make announcements. Just tell Woodhouse to ```announce <message>``` and he'll post your message to all chat rooms at once.

- Summarise anything. Need a quick overview of a topic? Just ```woodhouse abstract <topic>``` and he'll give you the jist

- Bend to your will. Oh, Woodhouse won't/can't do something? Just ```woodhouse sudo <do anything you want>``` (thanks [xkcd](http://xkcd.com/149/)).

- Give the true meaning of things. When you ask Woodhouse ```what is <thing>``` he'll go look it up in Urban Dictionary and tell you how it is.

- Help you procrastinate. Just say ```woodhouse 9gag me```. You're welcome.

- Remind you who the real badass here is, just ask ```woodhouse chuck norris```, or to see how others stack up, ```woodhouse chuck norris me <user>```.

- Remember what you told him. Forgot what you told Woodhouse to do? Get angry, ```woodhouse !!```.

- QUOTE ARCHER! Woodhouse can't resist, whenever he hears his old master's name he just has to blurt out a pearl of wisdom.



## Extending Woodhouse
Please contribute to Woodhouse! He is incredibly easy to extend. Any ```.coffee``` or ```.js``` (coffeescript preferred ;-)) script found in ```scripts/``` is processed at runtime and run as a plugin. Almost all of Woodhouse's functionality comes from such scripts. Additionally, 3rd party plugins (see full list [here](http://hubot-script-catalog.herokuapp.com)) can be just entered into the array in ```hubot-scripts.json```, these are then installed and updated via npm automatically (be sure to define all dependencies and environment variables in the Dockerfile though).

Scripting for Woodhouse is very straightforward, and using the basic handlers he has (plus some regex \*_shudder_\*) can yield some surprisingly sophisticated behaviour. Have a look through the existing scripts, and skim over a simple guide like [this one](http://theprogrammingbutler.com/blog/archives/2011/10/28/hubot-scripts-explained/).

Anything that can be automated programmatically can be automated with Woodhouse, probably in a much more fun and interactive way. So get scripting!

**NOTE:** Woodhouse is currently public (to avoid paying $7/month for private repos at Docker Hub). So don't put anything sensitive (as an environment variable, for instance) in a plugin just yet. Gather up all those no-go plugins and once we have enough to justify $7/month we'll move to private repos (would also be nice to have environments private, just in case).

#### Some plugin ideas to get the ball rolling...

- Hear name and respond (route to cleverbot?)
  
- Deploy (send to drone and then production)

- Query git project, find latest commit, etc.

- Build status of X project  
  
- Fetch NewRelic data  
  
- Fetch metrics  
  
- Deployment messages, interactive

- Revenue, etc. reports (later)

- Open adminy things (redbooth, admin dash, etc.)

- Hook into Google alerts and alert when Simpla mentioned in press

- Woodhouse redbooth tasks assigned to me

- Woodhouse new redbooth task, etc.

- Interface with servers (backup, etc.)


## Updating
Woodhouse is deployed as a self-contained Docker image, maintained as an Automated Build on our Docker Hub repo. This means that every time you push to this repo the image is automatically rebuilt. To deploy changes to our Services server (where Woodhouse lives), just ssh in and ```woodhouse-update```.


## A Note on Slack
The provided Slack adapter for Hubot creates a bot, similar to the notification bots that Bitbucket, redbooth, etc. use. This is not ideal, since it means Woodhouse doesn't show up in user lists and can't be direct-messaged. Slack are apparently [working on adding this functionality](https://github.com/tinyspeck/hubot-slack/issues/16), but for now we're using the hubot-irc extension, giving Woodhouse his very own user account with Slack (at admin@getsimpla.com). Yep, we're letting him think he's people. Criminal. This does however mean that we're using up one more user on our Slack account (which means $5/month extra when we start paying down the line). So we may end up switching back to the official Slack extension in the future, which also allows for formatting of complex messages (server stats, whatever), etc.
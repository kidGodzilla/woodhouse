# Meet Woodhouse

This is Woodhouse, our own private cyborg butler/servant. He's built on Github's [HUBOT](https://hubot.github.com/), runs on our Services server in his own Docker container, and talks to us on Slack.

## What He Can Do
Here's a non-exhaustive list of some of the things Woodhouse can do for you:

- Converse. Woodhouse is smarter than he looks, say hello and he'll greet you back, abuse him and he'll do his best to grin and bear it, just talk to him in general and he'll say something clever (literally, any unhandled exceptions get routed to an auxilliary [Cleverbot](http://cleverbot.com) brain)

- Lots more! Documentation coming soon...

## Extending Woodhouse
Please contribute to Woodhouse! He is incredibly easy to extend. Any ```.coffee``` or ```.js``` (coffeescript preferred) script found in ```scripts/``` is processed at runtime and run as a plugin. Almost all of Woodhouse's functionality comes from plugins. Additionally, 3rd party plugins (see full list [here](http://hubot-script-catalog.herokuapp.com)) can be just entered into the array in ```hubot-scripts.json```, these are then installed and updated via npm automatically (be sure to define all dependencies and environment variables in the Dockerfile though).

Scripting for Woodhouse is very straightforward, and using the basic handlers he has (plus some regex \*_shudder_\*) can yield some surprisingly sophisticated behaviour. Have a look through the existing scripts, and skim over a simple guide like [this one](http://theprogrammingbutler.com/blog/archives/2011/10/28/hubot-scripts-explained/).

Anything that can be automated programmatically can be automated with Woodhouse, probably in a much more fun and interactive way. So get scripting!

### Some plugin ideas to get the ball rolling...

- Handle commands mid-sentance (trims and processes rest as command)

- Deploy (send to drone and then production)

- Query git project, find latest commit, etc.

- Build status of X project

- Deployment messages, interactive

- Revenue, etc. reports (later)

- Open adminy things (redbooth, admin dash, etc.)

- Hook into Google alerts and alert when Simpla mentioned in press

- Woodhouse redbooth tasks assigned to me

- Woodhouse new redbooth task, etc.

- Interface with servers (backup, etc.)


## Updating
Woodhouse is deployed as a Docker image, maintained as an Automated Build on our Docker Hub repo. This means that every time you push to this repo the image is automatically rebuilt.

To deploy these changes to our Services server (where Woodhouse lives), ssh in and ```woodhouse-update```. This is just a bash alias for the following beast:

```docker pull simpla/woodhouse && docker stop $(docker ps -a | grep "woodhouse" | awk '\''{print $1}'\'') > /dev/null 2>&1 && docker rm $(docker ps -a | grep "woodhouse" | awk '\''{print $1}'\'') > /dev/null 2>&1 && docker run -d -p 5555:5555 simpla/woodhouse```
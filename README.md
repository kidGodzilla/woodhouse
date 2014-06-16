# Meet Woodhouse

This is Woodhouse, our personal cyborg butler. He's built on Github's [HUBOT](https://hubot.github.com/), runs on our Services server in his own Docker container, and talks to us on Slack.

## What He Can Do
Here's a non-exhaustive list of some of the things Woodhouse can do for you:

- Converse. Woodhouse is smarter than he looks, say hello and he'll greet you back, abuse him and he'll do his best to grin and bear it, just talk to him in general and he'll say something clever (literally, any unhandled exceptions get routed to an auxilliary [Cleverbot](http://cleverbot.com) brain)

- Give you wise councel. Just ask ```what should I do about...``` or ```how do you handle...``` or simply ```I need some advice```.

- Solve all your problems. Just ask ```how do I...``` and Woodhouse will find the answer on StackOverflow.

- Fetch the IP address of his server. ```woodhouse ip``` will do the trick.

- Check if a website is up, with ```woodhouse isup [site]```.

- Generate all the memes. Just about any sane ```woodhouse <optional inputs> [meme name] <optional inputs>``` you throw at him will get you an awesome customized meme. Full list [here](https://github.com/github/hubot-scripts/blob/master/src/scripts/meme_captain.coffee).

- Learn! Use this format to teach him new tricks ```woodhouse when you hear <pattern> do <something woodhouse does>```.

- Make announcements. Just tell Woodhouse to ```announce <message>``` and he'll post your message to all chat rooms at once.

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

#### Some plugin ideas to get the ball rolling...

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
Woodhouse is deployed as a self-contained Docker image, maintained as an Automated Build on our Docker Hub repo. This means that every time you push to this repo the image is automatically rebuilt.

To deploy these changes to our Services server (where Woodhouse lives), ssh in and ```woodhouse-update```. This is just a bash alias for this beast:  
  
```docker pull simpla/woodhouse; docker stop $(docker ps -a | grep "woodhouse" | awk '\''{print $1}'\'') > /dev/null 2>&1; docker rm $(docker ps -a | grep "woodhouse" | awk '\''{print $1}'\'') > /dev/null 2>&1; docker run -d -p 5555:5555 simpla/woodhouse```
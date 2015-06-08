# Meet Woodhouse

This is Woodhouse, a dockerised cyborg butler built on [HUBOT](https://hubot.github.com/), he keeps us company on Slack.

## What He Can Do
Woodhouse has many talents. Right out of the box he can: 

- Converse. Woodhouse is smarter than he looks, say hello and he’ll greet you back, abuse him and he’ll do his best to grin and bear it, just talk to him and he’ll say something clever (literally, any unhandled exceptions get routed to a [Cleverbot](http://cleverbot.com) instance).

- Give you wise counsel. Ask ```what should I do about…``` or ```how do you handle…``` or simply ```I need some advice```.

- Fetch the IP address of his server. ```ip``` will do the trick.

- Check if a website is up, with ```isup [site]```.

- Pass on messages for you. ```Woodhouse tell @name <message>```

- Stop you using startup jargon. Wanna talk about our strategic customer centric value add that helps with onboarding prospects through our sales pipeline by offering great ROI at its price point? Woodhouse will throw cats at you.

- Generate all the memes. Just about any sane ```<optional inputs> [meme name] <optional inputs>``` you throw at him will get you an awesome customised meme. Full list [here](https://github.com/github/hubot-scripts/blob/master/src/scripts/meme_captain.coffee).

- Learn! Use this format to teach him new tricks ```when you hear <pattern> do <something woodhouse does>```.

- Make announcements. Just tell Woodhouse to ```announce <message>``` and he’ll post your message to all chat rooms at once.

- Summarise anything. Need a quick overview of a topic? Just tell ask him for ```abstract <topic>``` and he’ll give you the gist.

- Bend to your will. Oh, Woodhouse won’t/can’t do something? Make him with ```sudo <do anything you want>``` (thanks [xkcd](http://xkcd.com/149/)).

- Give the true meaning of things. When you ask Woodhouse ```what is <thing>``` he’ll go look it up in Urban Dictionary and tell you how it is.

- Remind you who the real badass here is, bring up ```chuck norris``` with him, or to see how others stack up, ```woodhouse chuck norris me <user>```.

- Remember what you told him. Forgot what you told Woodhouse to do? Get angry, ```woodhouse !!```.

- For a full list of what he can do, just ask! ```Woodhouse help```

## Setting up Woodhouse
Woodhouse needs some environment variables to be set at runtime with docker:

- HUBOT_SLACK_TOKEN - The API token from Slack integration

- HUBOT_ANNOUNCE_ROOMS - Comma separated list of rooms Woodhouse will `announce` to.
 
## Extending Woodhouse
Woodhouse is incredibly easy to extend. Any ```.coffee``` or ```.js``` script found in ```scripts/``` is processed at runtime and run as a plugin. 3rd party plugins (see full list [here](http://hubot-script-catalog.herokuapp.com)) can be entered into the array in ```hubot-scripts.json``` to be installed during the next Docker build (be sure to define all dependencies and environment variables in the Dockerfile though).

Scripting for Woodhouse is very straightforward, and using the basic handlers he has (plus some regex) can yield some surprisingly sophisticated behaviour. Have a look through the existing scripts, and skim over a simple guide like [this one](http://theprogrammingbutler.com/blog/archives/2011/10/28/hubot-scripts-explained/).

Anything that can be automated programmatically can be automated with Woodhouse, probably in a much more fun and interactive way.

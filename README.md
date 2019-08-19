[![branch debian-bullseye status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-bullseye)](https://cirrus-ci.com/github/hilbix/cirrus/debian-bullseye) debian-bullseye,
[![branch debian-buster status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-buster)](https://cirrus-ci.com/github/hilbix/cirrus/debian-buster)-buster,
[![branch debian-etch status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-etch)](https://cirrus-ci.com/github/hilbix/cirrus/debian-etch)-etch,
[![branch debian-jessie status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-jessie)](https://cirrus-ci.com/github/hilbix/cirrus/debian-jessie)-jessie,
[![branch debian-latest status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-latest)](https://cirrus-ci.com/github/hilbix/cirrus/debian-latest)-latest,
[![branch debian-lenny status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-lenny)](https://cirrus-ci.com/github/hilbix/cirrus/debian-lenny)-lenny,
[![branch debian-sarge status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-sarge)](https://cirrus-ci.com/github/hilbix/cirrus/debian-sarge)-sarge,
[![branch debian-squeeze status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-squeeze)](https://cirrus-ci.com/github/hilbix/cirrus/debian-squeeze)-squeeze,
[![branch debian-stretch status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-stretch)](https://cirrus-ci.com/github/hilbix/cirrus/debian-stretch)-stretch,
[![branch debian-wheezy status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-wheezy)](https://cirrus-ci.com/github/hilbix/cirrus/debian-wheezy)-wheezy,
[![branch debian-woody status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=debian-woody)](https://cirrus-ci.com/github/hilbix/cirrus/debian-woody)-woody  
[![branch newbranch status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=newbranch)](https://cirrus-ci.com/github/hilbix/cirrus/newbranch) newbranch  
[![branch ubuntu-bionic status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=ubuntu-bionic)](https://cirrus-ci.com/github/hilbix/cirrus/ubuntu-bionic) ubuntu-bionic,
[![branch ubuntu-dapper status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=ubuntu-dapper)](https://cirrus-ci.com/github/hilbix/cirrus/ubuntu-dapper)-dapper,
[![branch ubuntu-hardy status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=ubuntu-hardy)](https://cirrus-ci.com/github/hilbix/cirrus/ubuntu-hardy)-hardy,
[![branch ubuntu-latest status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=ubuntu-latest)](https://cirrus-ci.com/github/hilbix/cirrus/ubuntu-latest)-latest,
[![branch ubuntu-lucid status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=ubuntu-lucid)](https://cirrus-ci.com/github/hilbix/cirrus/ubuntu-lucid)-lucid,
[![branch ubuntu-precise status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=ubuntu-precise)](https://cirrus-ci.com/github/hilbix/cirrus/ubuntu-precise)-precise,
[![branch ubuntu-trusty status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=ubuntu-trusty)](https://cirrus-ci.com/github/hilbix/cirrus/ubuntu-trusty)-trusty,
[![branch ubuntu-xenial status](https://api.cirrus-ci.com/github/hilbix/cirrus.svg?branch=ubuntu-xenial)](https://cirrus-ci.com/github/hilbix/cirrus/ubuntu-xenial)-xenial

# Cirrus CI tests

This is a repository to do some tests with the help of CirrusCI.

It mostly is to check things with older versions of something.


## How to use

On GitHub clone: https://github.com/hilbix/cirrus

Then:

	BRANCH=NEWBRANCH
	GHACCOUNT=YOURGHACCOUNT
	NAME=cirrus

	git clone "https://github.com/$GHACCOUNT/$NAME.git"
	cd "$NAME"
	git checkout -b "$BRANCH" newbranch
	make

	# edit as you like
	git add -A
	git commit
	git push

Now you can look at Cirrus-CI doing the job of `$BRANCH`.
The `README.md` then already has a proper link.

If you use `git@github.com:$GHACCOUNT/$NAME.git` for cloning,
then `make` fails with an error when cloing the `master` branch.
This is because it tries to access `git@github.com:$GHACCOUNT/$NAME.git/`
which does not work on `ssh` transport, only on the `https://` transport,
which luckily is used by Cirrus-CI.

Fix this with an entry in your `.gitconfig` file:

	git config --global "url.git@github.com:$GHACCOUNT/$NAME.git.insteadOf" "git@github.com:$GHACCOUNT/$NAME.git/"

Note:

- This url-rewriting on the fly is one of the productivity features built into `git`.
- I always stick to `https://` for URLs and only rewrite it in `.gitconfig` when I need to push.


## Why CirrusCI?

> This is no advertisement.  This is my honest opinion.

Other CIs on GitHub want to take over your account on GitHub, but CirrusCI doesn't.
It just requires the bare minimum of permissions to update all the state related things,
everything else is neatly kept read-only.

This is why I'd [recommend CirrusCI for GitHub](https://github.com/marketplace/cirrus-ci).

It is always adviceable to have security barriers between two distinct services like CI and GH.
Such that if one gets compromized, the other is not badly affected.

In case of Public Domain Open Source (what I am into) read access is no problem at all,
because everybody already can access all data publicly.  The only thing a 3rd party service additionaly gets,
is access to some hidden profile information like my everyday mail address.
That's ok.  Also, if you have a brain (AKA Google), my real address is no secret at all.

Hence the only concern in security barriers is, how disturbing an intruder can become.

The nice thing on a CI is, that this is not my problem.  CI uses some feature I do not use nor rely on.
Hence, the only disturbing thing an intruder on the CI can do is, to set some false flags.
If the CI only has read access and can alter status this is not a big problem.

Other CIs, however, want full altering access to all my repositories.  WTF!?!

This is not ultimatively problematic, thanks to the resilience built into `git`,
but it would be very disturbing if somebody else gains access to m repositories
and starts altering them in some incomfortable way.

Hence I do not want this risk, ever, and I want to keep things fully separated, always.

> Note that you can create a firewall account at GitHub to protect your main account.
>
> A firewall account is an account where you mirror your stuff (semiautomatically)
> such that others do any harm to that account, which is not important,
> as you only `git push --mirror` to it to get the CIs triggered.
>
> However this adds a second burden, to you, GH and how you manage things.
> Hence this is not recommended if it works without.


## Why CI?

CIs are incredibly helpful and I am grateful that they are free for my Open Source.
This way I can use them and improve things even better.

The major thing about CI is the "second opinion" thing.  This is, all stuff must work
in the stadardized CI environment.  Which mostly helps others(!) to use my stuff,
as this explains how to use it.

For my part, I only publish sources, not binaries.  Hence you must compile it yourself.
Which is good, as this keeps things up-to-date and there is no need for release cycles
or archives (except for the `git` history).

However, this also introduces some drawbacks.  One of the drawbacks is cutting edge.


## The problem with cutting edge

Cutting edge is a nice thing.  It keeps things easy to use.  Because you always can be sure,
that everything is current.

However this usually badly copes with reality.

If I have some problem, try to recompile, and then have to adopt cutting edge again
because world changed in the last few seconds, this usually is not what I want.
Things change quite too fast.  Things change too fast to keep fully informed.
There will be the point where you are left back with nothing than the broken pieces.

For my case still I have some machines and VMs running, which are "mature",
from a human point of sense.  They are older than 21 years and approaching 25 years now.
Yes, really.  Some still run `bash` version 2 (and no `git` BTW).

Nope, they are not meant to be cutting edge nor do advanced things.  They just still live.
But sometimes I need to go back there and fix something.  Because it is more easy to do so
(which most time takes less than 5 minutes), than to upgrade it to something more current
(which probably will takes more than 5 years).

YMMV.

So these machines cannot be current edge.  They never will be.
They are old.  Stone old.  And they will stay this way.


## CI to the rescue

Keeping old environments around is very demanding.  Because hardware ages.
This is true for the environment on which things run,
as this needs a lot of storage and organization.

With a CI and thanks to `git` you can have this all without any high demand.

This is how this here is organized:

- `master` keeps all experiments in subdirectories.
- Other branches then provide the environment.
- They clone the `master` branch
- And then run the stuff.

It's relatively easy ;)

Note that this is deliberate.  If I change an environemnt, it will re-run automatically by the CI.

However if I only change an experiment, the whole CI process will not be triggered automatically.
This is because I probably only want one environment to trigger and not all.

You can do this with Cirrus-CI by re-running the branch in question.
This is a bit more work to do, but the correct way.


## Security note

The environments are based on some external dependencies which are not checked.

This is how everything works today:  MavenCentral, DockerHub, Gradle, Bower, Composer, even CPAN.

You implicitely trust billion of lines of code without real knowledge what had changed recently.
If somebody is able to invade only a single of those lines, you are doomed.

Well, yes, somebody will probably spot the bug.  However the harm might already be done to you.
Are you prepared to restart from scratch (because your (online-)backup might have been compromized, too)?

I am not!  So I am very picky about which code is allowed to run on my local machines.
I do not want to automate download/compile/install processes locally just in case somebody drops an egg.

But with an external CI I do not have this problem.  This is entirely their problem then.

> Sorry, but true!  And they knew in advance!  And they certainly have a way to cope with this.

Welcome to The Cloud.  Keep their war there, such that we can live long and prosper keeping local peace.


## License

This Works is placed under the terms of the Copyright Less License,
see file COPYRIGHT.CLL.  USE AT OWN RISK, ABSOLUTELY NO WARRANTY.

Read: This is free as in free beer, free speech and free baby.

Read: It's basically Public Domain with some added freedom for the source itself.

Read: If you mix this with copyrighted code, just abstain from covering the CLLed code with any Copyright.

Example:

- The CLL is compatible to GNU GPL v3 under Terms 7b:
  - Keep the CLL to explain the legal nature of the CLLed code parts.
  - Explain which is the CLLed part (keep the CLL banner in the file).
  - Do not even try to add a Copyright on the CLLed part.
  - Transfer everything in whole under the GPL.
  - As the GPL applies via Copyright as before, the GPL is not restricted.
  - As the whole can be freely distributed under the terms of the GPL, the GPL is not restricted at all.
  - As additional benefit, you can take out the CLLed code and distribute/use it separately from the GPL.
    (Note that this is a natural and known process for all dual licensed sources.)  
    (Also note that the opposite often is not true.  So redistributing the GPLled part without the CLLed part
     often violates the GPL, if the GPLled part does not work without the CLLed part anymore.)

- Likewise you can add any other licenses to CLLed code, as long as it does not affect the Copyright.
  - Really, any license.  There is no restriction, except the one thing about Copyright.
  - This differs from Public Domain.  You can add your Copyright if you change PD, like by adding a Copyright.
  - But CLLed code cannot be covered by a Copyright anymore, as this violates the German Urheberrecht.

- Copyright changing licenses are NOT compatible with the CLL.
  - Like Oracle, Microsoft, etc. licenses.
  - The CLL effectively prohibits adding a Copyright, hence no 3rd party can gain such Copyright.

- CLL allows to mix the code with proprietary/commercial closed source products.
  - You do not need to give customers additional freedom, like allowing them to re-distribute the product.
  - You can cover your whole product with any license you like.
  - But you cannot cover the full product with your Copyright, as this is prohibited for the CLLed code part.
  - If you fail to state clearly, that parts of the product are CLLed code, all you take are legal risks.
    Because somebody will spot that you violated the CLL and hence, at court,
    you will fail to proof your claims of complete ownership!

- CLL is viral.  It's meant to be a deadly desease for Copyright.  Copyright is slavery!  Abolish all slavery!


---
layout: post
title: "The developers dilemma"
modified: 2015-07-07 12:27:46 +1200
tags: [post, dev]
image:
  feature: 
  credit: 
  creditlink: 
comments: 
share: 
---

Writing software is an interesting process. It transforms abstract
concepts, feature requests, vague ideas into something people can
interact with. It is a modern way of making ideas real, tangible,
visible and hopefully usable. This process is a strange mixture of
operating within tight constraints and at the same time being highly
creative.

Developers come in many flavours, just like traditional crafts men, they
may have studied for many years or just picked up an editor and started
mucking around in someone else's code till they felt comfortable enough
to write their own code. As with any trade, developers are often very
proud of what they produce, very opinionated about the one right way of
doing things and often very much in love with the nitty gritty details
of the implementation and the technology they use to get the desired
result. 

People using the artefacts developers produce normally only see a more
or less working product that they can interact with. They never ever see
any of the implementation details and will never find kind words for all
the work that went into building the product. They, most likely, only
give you annoyed feedback about the bugs they find.

The other big measure for someone using software is also how fast a new
feature will be available, how fast a bug they found will be fixed and
how soon the product will look nicer or be more usable than it is right
now. In other words all they care is a working product, no appreciation
what so ever for the time and effort that went into writing all that
beautiful code.

Over time every project develops into a large pile of well meant
approaches and quick feature hacks to make customers happy and still
retain a somewhat maintainable code base. Over time, often the team
working on the project changes, gets bigger, new ideas and concepts get
introduced. This is normally the moment where a bigger rewrite or
cleanup of the code base is needed and the client (boss, paying
customer or more general the user) will not understand why the next new
feature takes so much longer than it used to. Even more important, you
start spending money on things no one ever pays something for, you start
spending money on technical dept without any way of recovering those
costs.

The developers dilemma is the balance of speed of development and
accumulation of technical dept. The balance of quickly pushing out
something that will pay for the time spent on developing that very feature
and taking enough time to do it in a way that future developers have a
chance to maintain that feature without the immediate desire the rewrite
it and therefor killing the profit you can make with that feature.


A normal product life cycle
---------------------------

If I look back at many of the products I developed or overlooked
development of than I can see a pattern that emerged independent of the
developers, management approach and industry they were in. A project
starts out well planned, with all the best of intentions. After a while
things take way longer than planned and stuff needs to happen right now,
somehow. Projects that never entered that phase dragged on forever and
never went into production. The ones that entered that phase had to make
compromises.

On the projects that never entered production I can also see a desire of
mostly developers with a strong academic background to design a piece of
software that ticks all the boxes of a certain way of doing things.
Design patterns, Test driven development, a special framework pick any
"this is the right way of doing it" approach and you will often find
projects that never see the light of day but cost lots of money. I would
even go that far as to say that a very opinionated developer that never
had to ship a project him or herself to make a living, someone who
always worked in companies that payed them a regular salary and never
had to actually listen to costomer feedback, are a high risk to the
completion of any project and need a lot of mentoring along the way.

On the projects that shipped I can see that the compromises made the
developers unhappy but at least there was a product that started pay off
the costs for the development of that project. Those projects are often
in production for a long time and get refactored all the time but
ultimately reach a point where "the big new system" needs to be written. 

I have seen "big new systems" developed, the big new system that fixes
everything and makes the whole mess a really nice to develop platform
that "just works". I've sunk a lot of money on those projects in my
lifetime and not a single one of those new systems ever saw the light of
day. Even more impressive is that these shiny new systems often get
rewritten a few times completely even before they go into production
because there is a newer even better and nicer way of doing things and
everyone wants to start using that. Add different skill levels and
willingness to learn new things to the mix and you will easily see why
those projects often fail. The one sentence that you should always watch
out for is "while we don't have this in production we might as well do
it properly and use ...". This very sentence cost me years of dev time
in the past, watch out for it and challenge it wherever you can.


Developers are in love with their craft
---------------------------------------

A boat builder that is really good at building beautiful wooden boats
will have many admirers that will look at the boats and see how nice
they are built. If you ask that boat builder to build a camper he will
most probably try to find a way how he can build a beautiful wooden land
yacht that is stunning to look at and roughly in the price class of a
wooden boat. This will most probably be a stunning piece of engineering
and a real head turner for people who can appreciate the craftsmanship.
If, however, you tried to launch a production line of budget campers to
rent out to ignorant tourists that just want to race in a hurry from A
to B and tick the most prominent sights on the way before they hop on a
plane and head home again, then you just wasted an awful lot of money
on something that is totally over-engineered for the purpose.

With developing software it is not as obvious but it definitely goes
into the same direction. More often than not a trivial problem can be
built in a way that ties up man power for months to do it properly.
Unfortunately, especially in early stage startups, no one even knows if
that feature will be used, how it will be used, if this is the right way
of doing it and so on. Spending a lot of time just to throw that piece
of software away later looks like a wasteful way of doing things but
it is the normal way most developers operate. If problem X comes along
then solution Y is the right way of doing it. We want to deliver nice
code, something that is robust, something that can scale, something that
has a defined scope and we can test that the software we deliver
operates within those constraints.

Two months down the track you have to accept the fact that the
parameters you thought you operate in are not how your users use the
feature. They found it really useful to do Y with it and never even use
it for X. This means now that you have to rewrite your test suite, fix
your code, make sure it still scales for the new problem and then deploy
the new code ... only to find out that a few weeks later the scope
changed yet again.

Early stage startups and new features that have not been tested on a
large audience are often the most obvious place where time wasted in too
much engineering can be found. A new feature is something no one knows
how (or if) it will be used. In my experience pushing out an early
prototype that does a subset of what the final feature should be capable
of, kind of a minimal viable feature, and then refining it over time
till it is nice and does what your customers expect is in the end a way
cheaper mode of developing than a full spec and months of dev time early
on.

The challenge is that developers more often than not will not buy into
this concept and this needs a lot of convincing and a very robust
infrastructure to roll out changes and roll back changes in production
very easy. If developers get comfortable deploying code into production
and trying things out, quick and dirty, then they will start pushing out
quick experiments to test if a feature could work. This makes your
product so much faster and visibly moving forward for your customers.


Saying sorry to a client
------------------------

I have seen very upset clients that used an early feature that was buggy
and stuff that went horribly wrong. They were angry for a reason, buggy
code in the wild is always a bad thing. However, with that feedback and
a fast deployment mechanism the developers can fix that one problem
really quick and get back to the client, apologise and tell them that
the problem is already fixed. I have seen this happening in under half
an hour after complaint and saw very happy customers that were just
stunned by the fast turnaround of bug fixes. Many of them were very
loyal customers after that.

Using a new feature and develop it with the needs of your customers
instead of your own ideas for a feature makes sure that you develop a
relevant product, not just one that works for you. Customer feedback is
so important in that early phase of product and feature development and
if you as a dev always think about all the code you have to change instead
of looking forward to refining the feature then you are doing things
wrong. Product development is fundamentally different from project based
development. Project based development is a lot about covering your ass
against future law suites. Product development is about trying things
out, making sure you can quickly react to changes in the market, about
saying sorry to your clients only to surprise them a few hours later.


How to avoid the big system
---------------------------

Developing a new product is an awesome challenge and there are so many
ways to do things right but there are a few traps that I have seen that
hinder projects to scale once they have to. The biggest such trap is the
"one big system" trap. Initially when starting out everything is nice
and pretty. A few well developed libraries glued together with some
logic. Everything well structured, nicely designed and so on. After a
few years of maintaining and developing that code base the number of
external libraries grow, the glue code becomes a full blown code base
in its own right and maintenance starts to become a real issue. A good
measure is always how long it takes a new developer to wrap his or her
head around the code base.

The larger the system the more side effects there are, the harder it
becomes to add something new as it always impacts the entire system and
there is really not a lot of leeway to try out new things as they always
have to fit in with how things are done currently. This can become more
and more of a hurdle going forward as programming languages and
approaches develop. What looked like a good idea 2 years ago is most
likely not the state of the art anymore today. If you stick to the
monolithic approach then it will become harder and harder to find
developers that are keen to work on your code base as it is dated code
that does stuff in a way that does not seem modern anymore and
eventually the demand for a complete rewrite will come up. At this stage
you are at the best path to build the "big new system" we discussed
before. You will also end up with a good part of your development
bandwidth stuck in building the exciting new thing while the rest has to
maintain the old beast, implement features on the old code base and
motivation and speed to deliver new features will go down.

If you look around in large companies that are successful since many
years and have a large amount of code then you'll notice a common
pattern. No big systems but many loosely coupled systems that all do one
thing really well and talk to each other via a defined API. Very famous
for that approach is [Amazon], sometime back in 2002 they decided that
everything internally needs to communicate via an API. Preferably via an
API that could be exposed externally. This was the decision that made
AWS possible and brought us the Amazon we as developers know, the
platform that offers all the things you need to build a scalable
product.

Building your internal infrastructure around internal APIs, maybe a
message bus, something that lets you hide the implementation details of
a feature behind an API that can then be used by other parts of the
system will not only get you in the position that you can at some
stage expose those APIs to 3rd parties but way more important is the
side effect that you can now start using any technology, any approach to
structure your code, any new hip trendy thing your develeopers just wanted
to experiment with and deploy it into production. You can build an
infrastructure that embraces trying things out. You can create a culture
of wanting to play in the front line of new technology and you don't
need to fear that it breaks your established business processes.

A service oriented architecture is an easy way to keep your technical
dept low and to make sure your developers like working on your code
base. They stay relevant, they work with the languages they see most
suited for a problem, they are motivated to work on new exciting
solutions for your problems because they can. Because they are not bound
by the constraints of a single large monolithic system that mandates how
things are done.

Recent developments and trends like Docker and micro services help with
this approach and go exactly in that very direction. It is a way of
loosely coupling complex systems out of simple, easy to understand and
refactor parts.


Computers are awesome, use them
-------------------------------

Automation is key to make sure you can scale a business. I have worked
with admin teams that really liked doing things the way we always did
stuff, manually and proper. Truth is if you get a pager alert at 4am you
don't appreciate that approach and would love to just run a script and
be done with it. Automation of your infrastructure is not only a
blessing for the sysadmins that have pager duty, it is also a really
good way to make sure you don't need lots of sysadmins. In a properly
automated infrastructure it is surprising how little sysadmin tasks have
to be done on a regular basis. Automating early on is so important that
I would stress that as one of the first things before you even go live.
If you just get traction and loose your one main server you probably
wish that you had all the little config changes, that are now somewhere
in a backup file, just handy to push them to the new server. There is no
excuse not to use configuration management systems. It does not matter
which one you use, just use one that you can learn quickly and use from
the start.


Opinions are just that
----------------------

I have fought this all my life, opinionated people that tell you why
emacs is so much better than vi and why you have to switch in order to
be productive. These holy wars go from editors via programming languages
to databases and operating systems. In the end, they don't matter. I
have worked on impressive systems running AS400, VMS, Windows, Linux and
FreeBSD, written in anything from Fortran via Visual Basic and Perl to
Clojure and in the end they all delivered what they were designed for.

Before you crucify me now, please take a moment and think why your
favourite X is something everyone else should use? How can you judge
someone else's comfort level, his level of experience, his background,
his opinions on things. All those holy wars only cripple productivity so
why would we want them? All of us like to be productive with the tools
we like most. As a good rule of thumb I work with the approach that if
there are two in a team that can support a certain technology and they
feel comfortable with the responsibility of supporting that technology
then they can deploy it in production.

Desires, however, must not have a negative impact on the rest of the
company. If the opinion is that we should replace X with Y and it means
we have to re-write 80% of our code base then this is a disruptive
change that means lost productivity for the benefit of using another
technology. As this benefit is paid for by a customer and they really
don't care what is used under the hood of their product, I would
consider this not as a viable project. If the project, however, takes
one aspect of an existing solution, refactors it to use Y to make it
more robust, then we have a project that may be well worth spending time
on as it increases the service level the client can expect from the
product.

Desires and strong opinions are something every developer needs to work
with in any team. There are always many ways that lead to a shippable
product but some are more painful than others and some are purely driven
by ego and a strong opinion. Try to detect those strong opinions and
question them wherever you see them.

Another trait that is very common is perfectionism. I admire nice code
as much as all developers but perfectionism can be in the way of
shipping a perfectly fine feature. As a developer, try to understand
when a feature is good enough, when a feature has just the right ratio
of things that can be improved the next time you come back to this code
base versus being major enough to be shippable. Code that has nothing
left to improve upon is over engineered and belongs in research
projects, not in product companies.



[Amazon]: https://www.quora.com/Amazon/Does-Amazon-still-build-all-their-internal-software-around-internal-APIs

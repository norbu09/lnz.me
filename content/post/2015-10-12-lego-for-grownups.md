---
comments: false
date: 2015-10-12T00:00:00Z
image:
  credit: null
  creditlink: null
  feature: null
modified: 2015-10-12 13:26:43 +1300
share: true
tags:
- post
- iwantmyname
title: Lego for grownups
url: /2015/10/12/lego-for-grownups/
---

When I think about building software I try to see where we need to end
up in order to help the customer right now and then work backwards from
there. Because I am really bad at knowing what customers want I mock up
something that is good enough to get feedback and then morph it into
working code and then robust infrastructure. At iwantmyname I have
pushed for this since we started and for the most part we succeeded till
we tried to grow up and "clean up" and "do things properly". The result
was the complete loss of the playfulness of our stack and a return to
"work" instead of experimentation. We are currently fixing this and it
is mainly a mindset thing.

We had an internal security audit recently and one of the outcomes
was that our architecture is slightly ahead of its time, we do
micro-services for at least 6 years by now and learned a lot about them.
In this post I'll talk a bit about how to go from mock code to robust
infrastructure.

When a customer or we have an idea about a feature or a request or we
see a lot of support in a specific area we want to invest a bit of time
to implement an initial assumption about how we could address this. If
it is easy to implement this and if it is simple to deploy this change
then everyone in the team will be happy to make these little changes and
over time we create a relevant product. Creating an environment where
these changes have a low barrier is key in my view. It fosters ownership
of the product across all parts of the company and helps create relevant
products.

If adding a feature involves writing a project request, a few meetings,
deployment windows, various iterations of accept/review/sign off cycles,
then any experiment becomes a costly thing and that has two big
drawbacks. First, it is not fun to experiment and therefor less
experiments will happen. This means less and less features or
improvements will hit the site over time. The second issue is the time
and money sunk in an early assumption, This first draft is most
likely not what your customers actually wanted but with all that
investment it will most probably be the way they have to use that
feature. Any change would need to go through the same cycle of project
management and other things will always be more urgent.

How is it possible to go from a simple idea and mockup to working
code that is scalable without much pain and without compromising
security or reliability for the rest of the system. For us the answer
was in a service oriented architecture or micro services or whatever the
current buzz word for it is. We write every functionality on the site as a
RabbitMQ endpoint that has a little daemon listing on it that implements
that feature. To get a new feature out the door, we write a crude first
version of what we think the functionality should be, mock up a bit of UI
that interacts with that daemon and see how our customers like it. Over
time that first crude prototype will morph into a nicer bit of code that
is maintainable but because all bits of code are loosely coupled and the
interfaces are just JSON messages via AMQP the internals of any daemon
are not that important. The code quality can evolve over time and any
bit can be replaced with new code even in new languages by just
maintaining the external JSON interface. Also, and that is important,
buggy code is limited to that daemon, no impact on the rest of the
system. Mocking up an idea in code has no operational impact on the rest
of the system and that makes it save to play.

This way, moving from an idea to a scalable and reliable part of the
system is an easy progression, time and money is spent on the parts that
need to be reliable and are actually used, the bits that are nice to
haves get re-writes less often. Code evolves as part of the system. The
system evolves as user behaviour changes over time. The system becomes
an adaptable organism, code is killed off like old cells, new code is
introduced as new experiments are done. It is a living thing, not a
painstakingly architected, implemented and finally handed over to ops
kind a system. We still have an architecture that we adhere to but it is
as reduced as JSON via AMQP and two sorts of data stores. The rest is
morphing over time and will change as our customers change.



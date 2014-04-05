
Lachmann is a Haskell library (named after [Karl
Lachmann](http://en.wikipedia.org/wiki/Karl_Lachmann), the 19th Century
philologist and textual critic) for investigating the relationships between
manuscripts. It is pretty obviously *not ready for use.* I mean, look at it.
There's nothing here yet.

If you're interested in background reading about textual criticism,
computational stemmatology, and phylogenetics, I've started to assemble [a
little reading
list](http://chrisyoung.net/reading/computational-stemmatology.html) on my
site.


Modules
========

The following describes features not yet implemented.

Lachmann.Core
-------------

Lachmann.Core exports core functionality for the Lachmann package.


Lachmann.Artificial
-------------------

Lachmann.Artificial provides a flexible library for generating, from a
specification, a related collection of manuscripts, along with a graph
indicating their relations.

Using artificial test sets has a long history in textual criticism (see the
reading list above), but generating them programatically seems much less
common.

The goal of Lachmann.Artificial is to make it easy to explore and test
different algorithms for reconstructing stemmata by providing a large set of
examples with precisely controlled characteristics for which the correct
stemmata are known.


Credits and Contributors
=======

Thanks for D.S. Hutchinson for conversations about all things stemmatological
over the years and for getting me started.

Thanks to Omar Rizwan for his help at the 2014 Hac NYC Hackathon, where I got
this library started.

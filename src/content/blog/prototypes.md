---
title: "PhD Lesson: Prototyping Your Prototypes"
date: 2024-01-05T10:49:07-05:00
author: Rohan Yadav
path: "https://rohany.github.io/blog/prototypes/"
---

As I become an older and grumpier PhD student (I'm almost halfway through my fourth year!), I wanted
to begin documenting some lessons that I have learned along the way to maximize effectiveness and
the overall rate of progress. This lesson is more focused to PhD students doing systems related research,
but perhaps future posts will be more applicable to other domains as well.

As a systems researcher, the main way to iterate on and validate our ideas is to build software
_prototypes_ that implement the proposed system, programming language or more. The resulting prototype
is an important artifact of the research; while the ideas behind the project are important,
the fact that the ideas can be realized into real software lends necessary legitimacy. Additionally,
the prototype must contain all of the "implementation details" that aren't able to fit into the final publication.
So clearly, developing prototypes is important, and it can be tempting (especially as a new researcher)
to jump in and start implementing ideas as they come.

In this blog post, I argue that directly doing so can often be a bad idea and can result in much
slower progress than what should be possible. This slowdown is especially prominent when the research
work is being done in the context of a larger software system, which is especially common for new researchers.
I believe that trying to develop prototypes too early in the research process can lead to difficulties when
attempting to **rapidly iterate on core ideas** and **to de-risk critical components of the system**. Instead,
I find great value in "prototyping the prototype", meaning finding minimal ways to see if the key ideas
in the research are sound before attempting a more thorough implementation. In the rest of the post, I'll
argue why I think this is a good practice by first talking about what goes wrong by not doing it and then
discussing times where this practice has worked well for me.

Directly trying to go from research ideas to a prototype within the larger software system that the research
fits within brings on a series of challenges unrelated to the core research. Examples of these
challenges include understanding the existing codebase (all of the hidden assumptions and gotchas), 
and wrangling with the existing architecture and techniques already present in the code. The baggage that 
the larger codebase brings affects how fast the implementation can be iterated on. In the beginning stages
of a project (where the research ideas are most likely to be not correct!), the initial implementation
effort can result in wasted time when the proposed architecture turns out not to work. The early
stages of research are where flexibility is the most important --- it should be easy to try out a new
algorithm or formulation of the problem without rewriting large amounts of code. An anecdote from
my lab-mate [Haoran Xu](https://sillycross.github.io/about/) is that a good engineer is often able to
develop at almost a 10x rate when working on their own code, versus working on someone else's code! 
Flexibility comes hand-in-hand with de-risking major components of the research. In a large codebase, trying to
incorporate a new major library is a large amount of effort that might be wasted
due to incompatibilities or deficiencies in the library unrelated to the research itself. Adding these
new components results in a large amount of risk, since the effort to do so is high and there is no
guarantee that the components behave as desired.

Having hopefully convinced the reader about the perils of prototyping too early, I hope to impress
upon the reader that finding ways to develop very small "toy" versions of their prototypes can be very effective.
I first learned about this practice from coworkers at [CockroachDB](https://github.com/cockroachdb/cockroach),
who are some of the best programmers I've ever met. When undertaking large modifications to the database, the
team would first spend serious time developing and evaluating toy implementations of the proposed features.
These include a [toy cost-based optimizer](https://github.com/petermattis/opttoy) and a 
[toy vectorized execution engine](https://github.com/jordanlewis/exectoy). As expected, these explorations
were extremely useful for the engineers to 1) show that the proposed ideas could lead to potential benefits,
and 2) quickly iterate without considering all of the other layers within CockroachDB.

Since I've started my PhD, I've used the "prototyping the prototype" approach several times across
different research projects. This process can look very different for different kinds of projects:

For the [DISTAL](https://rohany.github.io/publications/pldi2022-distal.pdf) project
(and other DSL compilation-style projects), I spend a lot of time developing by hand the code
I want my compiler to generate. This process helps to validate that the envisioned compiler can
actually generate the fast code desired!

For an under submission project that uses MLIR to fuse computations inside the [Legate](https://github.com/nv-legate/)
framework, I wrote a [small toy implementation of the Legate runtime](https://github.com/rohany/fusion-toy) to embed
the MLIR compiler within. Doing so, I was able to confirm that within the final software ecosystem my research
prototype would be built, MLIR was indeed able to perform the loop fusion and parallelization optimizations I was
relying on it to perform.

Finally, a current research project I am working on aims to automatically detect when the
[dynamic tracing optimization](http://theory.stanford.edu/~aiken/publications/papers/sc18.pdf) can be
applied in Legion programs. Rather than directly implementing my proposed algorithms inside the Legion runtime,
I'm developing a [simulator](https://github.com/rohany/auto-tracing-exploration) that consumes logs of 
Legion programs and runs different trace detection algorithms on those logs. This simulator lets me quickly
test out these algorithms without actually running potentially expensive programs and lets me rapidly
iterate on the algorithms used. I've already bounced between more than 5 strategies in the last few weeks!

If the reader clicked through the links to these prototype prototypes I've mentioned, they would find
that the code is quick messy --- I think that is fine! These early prototypes are not meant to turn
into lasting implementations. They are only there to allow for quick iteration and de-risking. These
prototypes give a researcher **the necessary freedom to do it wrong several times before getting it right**.

At this point, I hope that I've convinced the reader of the value in prototyping prototypes.
It's not always possible for every project to perform the extraction and minimization that I have
described here. However, if it is possible, or it is even possible to spend some cycles thinking about
how it might be done, I think that the benefits greatly outweigh the costs.

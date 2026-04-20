---
title: "PhD Lesson: Finding and Picking Research Problems"
date: 2026-04-14T22:58:36-07:00
author: Rohan Yadav
path: "http://rohany.github.io/blog/research-ideas/"
draft: true
description: "Where do research ideas come from?"
---

I'm in an awkward time near the end of my PhD, where I just submitted the first draft
of my thesis and am twiddling my thumbs waiting to hear back from faculty positions.
Because of the timelines around graduation and potentially starting a new job, 
it feels hard to jump into a new long term research project. Instead, it's been
an [introspective](https://x.com/MorePerfectUS/status/2033583724311286051) time, where I've been reflecting on what 
did and didn't go well during my PhD, as well as trying to really think about what I want to do in the future.

In this post I want to discuss *research ideas*. Where do they come from? What are the characteristics 
of good ideas? Do researchers always have ideas to work on? Unfortunately, I don't have exact answers for these
questions, and also I don't think that there *are* definitive answers for these questions. However, figuring
out the answers to these questions is the point of doing a PhD! So, I will provide some overall strategies and observations for finding 
and picking research problems that have been successful for me over the last few years. I hope to "peel back the covers" of research, especially for 
younger students, where the story presented in the final publication almost never looks like what happened
in real life. As usual, I can't speak to the generalization of these experiences
beyond my research area, which is in the area of high-performance programming systems.

I'll present the content of this post as a somewhat connected series of chronological anecdotes that describe how I found
and picked the problems that turned into publications during my PhD. This post was inspired by me randomly
re-reading my colleague Elliot Slaughter's [blog post](https://elliottslaughter.com/2024/02/legion-paper-history)
on the history of the Legion programming system, as well as my ongoing readthrough of Richard Hamming's
"[The Art of Doing Science and Engineering](https://worrydream.com/refs/Hamming_1997_-_The_Art_of_Doing_Science_and_Engineering.pdf)".
I will routinely refer to insights from Hamming that have appeared repeatedly in my own life, specifically from the final chapter
"You and Your Research", which I heavily recommend to anyone reading this post. I re-read (or [re-watch](https://www.youtube.com/watch?v=a1zDuOPkMSw))
this chapter at least once a year.

I'll first discuss some of the important recurring themes of finding research directions, and then jump into
the anecdotal component of the post. The recurring themes will, in fact, recur in the anecdotes!

# The Higher Order Bits

I think the most important piece of finding research problems is to first have a *research vision*, which
goes far beyond individual projects or papers. A way to think about this vision is to imagine what the world
would look like if you succeeded at your research; what would we be able to do? For example, my research
vision revolves around making high-performance, parallel computers as easy to program as sequential computers.
When you have a larger research vision, you can find individual projects and publications that take steps
towards achieving this goal, instead of randomly picking up the next interesting topic that flies by.

Once armed with a research vision to walk towards, I found the following themes to recur when finding
concrete projects along the path towards my vision:

1) **Getting lucky**: Being in the right place at the right time, but also having the right viewpoints and background knowledge to take advantage
of an opportunity. I parrot Hamming here, who says that "Luck favors the prepared mind".
2) **Being in an interesting environment**: Your surroundings and collaborators can heavily impact your thinking and reveal new problems.
Especially because I am in a more applied field, hearing about the real problems of end users has
directly led me to new research.
3) **Planting acorns**: Again parroting Hamming, but you must plant the acorns from which great research ideas grow. It's very rare to just
stumble upon a fantastic idea with no lead-in, and most finished research projects bear little resemblance to their inception.
4) **Finding unique viewpoints**: The same overall problem can turn into significantly different outcomes based on who works on them,
and how they think, even between direct collaborators. These viewpoints can be the difference between a more dull "implementation-only" style
of result and a more general, far-reaching conclusion.

As I think about all the research projects I embarked on during my PhD, every single starting point had some elements
of at least 2 or 3 of these themes! Of course, your mileage may vary, and you may think in a completely different way than I do.

# The Anecdotes

I'll order these anecdotes chronologically, discussing the projects I worked on when I started
as a rotation student at Stanford, through the last projects before I began applying for
jobs and thesis writing. 

## Rotations at Stanford

When PhD students start at Stanford, we go through a *rotation* process, where we can spend
a quarter each working with different faculty before *aligning* with a particular faculty
for the rest of the PhD. This is a bit different from other departments, where students
enter the program already committed to a faculty member. I'm a big fan of the rotation process,
but talk to me separately for my view on the pros and cons.

Upon entering the rotation process at Stanford, I had no real ideas about what I wanted to do.
I did have an overall vision, carried over from my undergraduate research, about making
parallel programming easier and more efficient. I rotated with [Alex Aiken](https://theory.stanford.edu/~aiken/) and 
[Fred Kjolstad](https://fredrikbk.com/), and for each rotation I asked each of them for a small 
project to work on. With Alex, I joined to help an existing project get over the finish line to a conference submission,
working on cleaning up bugs, developing experiments and doing some writing. The project itself,
called AutoMap, was about automatically deciding where to run computations and place data for 
applications within the Legion runtime system. With Fred, I worked on a small extension to the
[Taco](https://github.com/tensor-compiler/taco) compiler for sparse tensor algebra to allow
for sparse tensors to be sliced and strided like dense NumPy arrays.

Both of these projects were relatively small, and I wouldn't consider
either of them to be real "research", in the sense that my contributions
were well-scoped within the boundaries of work that other people had already done.
Even then, working on these projects was mostly a matter
of theme 2, being at Stanford with my rotation advisors.
Despite being one-off pieces of work, I think they were useful for me in the long term because they
exposed me to technologies (Legion and Taco) that became foundations for future work
I ended up doing. These projects did end up as papers or part of papers:
the Taco slicing work became a small part of a larger paper on
[sparse array programming](https://rohany.github.io/publications/ooplsa2021-sparse-arrays.pdf), 
and the [AutoMap paper](https://rohany.github.io/publications/sc2023-automap.pdf) ended up getting 
accepted a few years later (after several rejections), as it had to be pushed over the finish line by another student.

## DISTAL

I decided to not pursue a third rotation and aligned with Alex and Fred as co-advisors. At this point,
I actually had a new idea for research! A classic "new student" idea is to take multiple pieces of work
(in this case my advisors' work) and stick them on top of each other, i.e. take Taco and compile
it into Legion to get a system that could execute distributed dense and sparse tensor algebra. I started
this project focusing on dense tensor algebra, with a clear plan to eventually support sparse tensor
algebra. This initial idea turned into two papers, one for [dense tensors](https://rohany.github.io/publications/pldi2022-distal.pdf)
and another for [sparse tensors](https://rohany.github.io/publications/sc2022-spdistal.pdf).

Aside from theme 2 of only being exposed to these ideas by rotating with Alex and Fred, I benefitted from
the acorns I planted (theme 3) during my rotations by becoming pretty familiar with both Legion and Taco. This
experience made it possible to notice the possible connections between the systems and then actually see the
project through by developing a working implementation in a system we called DISTAL. One thing I realized partway 
through the project was that theme 4 was actually in play as well! Fred revealed to me (gleefully) after a few weeks of working on the
project that he had actually advised a masters student at MIT during his own PhD who attempted to do the
exact same thing that I did! I was quite dismayed at this reveal, thinking that this problem had already been 
solved or was not feasible based on the earlier investigation by 
the masters student. But, my experience with Legion led me to think about the problem in a different way, 
allowing us to bypass the technical hurdles faced in the earlier attempt, and we made some surprising connections that gave the
work a more satisfying takeaway. I finished and submitted the dense component of DISTAL with a few months of work,
and followed up with the sparse component quickly due to setting up the theory in the right way
in the dense component of the work. 

## Legate

My work on DISTAL led me to get connected to researchers at NVIDIA ([Mike Bauer](https://lightsighter.org/)
and [Michael Garland](https://mgarland.org/)) who had developed [cuPyNumeric](https://github.com/nv-legate/cupynumeric) 
(originally called [Legate NumPy](https://dl.acm.org/doi/10.1145/3295500.3356175)),
a distributed and accelerated, drop-in replacement for NumPy. As part of a summer internship with NVIDIA Research,
the plan was to use DISTAL to develop a distributed and accelerated, drop-in replacement for SciPy Sparse in a 
similar style as cuPyNumeric. Together, these systems would give end users distributed dense and sparse array
programming in a single system. Already, we can see theme 2 applying (being at NVIDIA Research), and a good
sprinkle of theme 1 (luck!) --- how convenient that these two projects were finishing up at the same time!
So, I went and developed [Legate Sparse](https://github.com/nv-legate/legate-sparse), and leveraged DISTAL
to generate a large amount of library. When building Legate Sparse, it quickly became clear to all of
us that the interesting problems were not in building Legate Sparse itself (theme 3), but actually making sure that
Legate Sparse would *compose* with cuPyNumeric while maintaining good performance. These were the problems that
we ended up talking about most in the [paper](https://rohany.github.io/publications/sc2023-legate-sparse.pdf) we wrote.

After my internship finished in September 2022, I kept working on Legate Sparse for the eventual submission to SuperComputing
in April, and returned to NVIDIA Research for another internship in the summer of 2023. In that meantime, the work on Legate
Sparse and cuPyNumeric had led to enough traction within NVIDIA that an engineering group (led by Wonchan Lee and Manolis Papadakis) 
was starting up to take over these projects and turn them into real products! But at the same time, we were still figuring out how to do this whole
"composition with high performance" thing. This lucky turn of events (theme 1) made my surroundings an incredible
source of inspiration (theme 2) for research projects. It was clear that Legate was important, and now we had the opportunity
to source research problems from the real challenges that the engineers were facing when trying to get people to use
the research prototypes! This combination spawned the next three projects of my PhD that focused on improving the
performance of Legate in different aspects, but theme 4 was really the important part: people always work on improving
performance, but the unique angle that we had was this ability to compose independently written programs and still
get high performance. This angle influenced how we thought about and scoped problems, and was the main motivator
for telling the community why our work was important.

In the summer of 2023, I was inspired by projects like [Weld](https://dl.acm.org/doi/abs/10.14778/3213880.3213890) to
improve the absolute performance of Legate workloads by fusing computations across library boundaries to achieve
performance competitive to what hand-written implementations in a monolithic application might do. My
labmate [Shiv](https://shivsundram.github.io/) had laid the groundwork for this project with his work on
task fusion in Legate, and I built off of it and added a code-generation component into the system as well.
This [paper](https://rohany.github.io/publications/asplos2025-fusion.pdf) got rejected three times before 
finding a home at ASPLOS in 2025.

After the summer of 2023, I stayed on at NVIDIA as a part time researcher for the rest of my PhD, and kept working
on Legate. The fusion work focused on improving absolute performance, but I also was frustrated by Legate's
performance at scale, both when [strong-scaling](https://hpc-wiki.info/hpc/Scaling#Strong_Scaling) and [weak-scaling](https://hpc-wiki.info/hpc/Scaling#Weak_Scaling). 
I built a system called [Apophenia](https://rohany.github.io/publications/asplos2025-tracing.pdf) 
that addressed some of Legate's remaining weak-scaling issues and touched on its strong-scaling issues. This piece
of work started from some annoyances about how Legate was unable to use Legion's [tracing](https://theory.stanford.edu/~aiken/publications/papers/sc18.pdf)
feature effectively. We could have built some point solutions for this problem, but in the spirit of theme 4,
our approach was instead to argue that runtime systems like Legate should be architected in a different way
(in particular, as JIT compilers) and we found several interesting technical problems to solve in the process 
of proving this (theme 3).

After Apophenia, I took a diversion into working on [Tensor Core](https://www.nvidia.com/en-us/data-center/tensor-cores/) 
programming (discussed in the next section),
but to keep the story coherent, I'll finish the discussion of Legate. As the final piece of pushing on Legate's performance at scale,
I was still frustrated at our inability to demonstrate compelling strong-scaling results. I gave a portion of this
problem to a master's student (theme 3), Joseph Guman, who did some great investigation and identification of what we could
actually do about this, which involved heavy optimization to [Realm](https://github.com/StanfordLegion/realm), the system that 
sits underneath Legate and Legion. Joseph's work was promising, so I picked it up and made implementing the optimizations that
we had discussed a full-time project for me. After several weeks of working through these optimizations with Mike, Mike
said he had a random conversation with someone at a workshop that made him realize there was a connection between
the optimizations we were implementing and how efficient [actor-based programs](https://en.wikipedia.org/wiki/Actor_model) are structured.
This singular observation fundamentally changed how we thought about this problem, from an implementation of some optimizations
in Realm to a much broader connection between task-based and actor-based programming models (theme 1, theme 2, theme 4). 
The resulting [paper](https://rohany.github.io/publications/actor-task-duality.pdf) is one of my two favorite papers
in my PhD, though it hasn't yet found a home at a conference.

Our work on Legate spanned from initial work on efficiently composing independent distributed libraries to
filling out missing pieces in this performance landscape (absolute performance, weak-scaling and strong-scaling).
The whole project spun out of being at the right place at the right time, and having the right combination
of expertise to be able to do the required work. When finding a "gold vein" of problems like this, it's valuable
to keep digging and fill out the body of work instead of jumping to another area.

## Programming Tensor Core GPUs

As I mentioned in the previous section, I took a detour from working on Legate in 2024 after finishing
Apophenia. One day, the NVIDIA Research Programming Systems Group was getting a talk from the [CUTLASS](https://github.com/NVIDIA/cutlass)
team about the challenges of writing high-performance dense linear algebra programs for the 
[Hopper GPU](https://www.nvidia.com/en-us/data-center/technologies/hopper-architecture/).
The talk focused on how the new matrix multiplication accelerators deployed within the GPU ([Tensor Cores](https://www.nvidia.com/en-us/data-center/tensor-cores/)) were
forcing programmers to write all sorts of gnarly concurrent and asynchronous code to achieve peak performance.
I had been programming GPUs since 2016, and seeing this kind of change in the programming model
struck me as a serious problem. This was especially striking because all the work
I had done in the last 4 years, and the whole history of the Legion ecosystem, was about programming complex distributed
machines while allowing programmers to write purely sequential programs! I immediately latched onto this idea,
and inspired by [Sequoia](https://graphics.stanford.edu/papers/sequoia/sequoia_sc06.pdf), developed
[Cypress](https://rohany.github.io/publications/pldi2025-cypress.pdf). Cypress proposed an alternative
programming model to the current CUDA style, allowing programmers to write sequential programs and have
the compiler insert all the asynchrony and data movement needed for high performance. This project
was started purely from getting lucky and hearing the talk from the CUTLASS group (themes 1 and 2), and having the right
viewpoint to tackle the problem in a different way (themes 3 and 4).

After working on Cypress, I picked up Joseph's prototypes for the actor-task work. After we finished that work,
I returned in 2025 to thinking about Cypress in the context of thinking about porting Cypress to the new
[Blackwell GPU](https://www.nvidia.com/en-us/data-center/technologies/blackwell-architecture/). It was known
that, like Hopper, Blackwell required new code and new optimizations to get peak performance. The most dramatic
changes were new [software pipelining](https://en.wikipedia.org/wiki/Software_pipelining)
and [warp specialization](https://rohany.github.io/blog/warp-specialization/) strategies, which resulted in 
significant code and algorithmic differences from Hopper. This wasn't a huge surprise though: the [Flash Attention 3](https://arxiv.org/abs/2407.08608)
algorithm was released while we were developing Cypress in 2024, which proposed new software pipelining and warp
specialization strategies for Hopper. Back then, Mike and I confirmed that standard software pipelining
algorithms could have derived what was proposed in Flash Attention 3 (planting an acorn). Now, with Blackwell,
[Rupanshu Soi](https://rupanshusoi.github.io/) and I decided to revisit this idea, and ask why 
[standard](https://shiftleft.com/mirrors/www.hpl.hp.com/techreports/94/HPL-94-115.pdf)
[software](https://suif.stanford.edu/papers/lam-sp.pdf)
[pipelining](https://theory.stanford.edu/~aiken/publications/papers/esop88.pdf) 
[algorithms](https://dl.acm.org/doi/abs/10.1145/192724.192733) were not being used in modern machine learning compilers?
We originally decided to address the topic of warp specialization afterwards, and planned to go and
show that standard software pipelining approaches could re-derive many of the optimizations being applied
in machine learning kernels today. However, we quickly found that warp specialization could not be
considered independently from software pipelining, which directly led to the ideas in [Twill](https://rohany.github.io/publications/twill.pdf).
Twill is my other favorite paper from my PhD, and proposed a fundamentally new way 
to think about warp specialization. Twill grew from an acorn planted over a year ago (theme 3), got started by thinking about
a widely-studied topic in a different way (theme 2), and the non-standard viewpoint actually worked (theme 1)!

# Conclusion

So far, I've given a brief history of how I got into each of the projects that led to publications during my PhD,
and described some of the recurring themes that I've noticed in how these projects get started. These themes
include being in the right place at the right time, and having the right background and angle on the problem being solved.

Now that I have laid out these themes, what can you actually do to be there when the lightning strikes? I think the PhD is the
perfect time to gain broad knowledge and really understand the fundamentals of your field; being a little bit slower
and learning about topics adjacent to your focus of study has the chance of yielding outsized rewards compared to just
heads-down working on your main project. For example, I may have never gotten into Legate if I had kept my head down 
working on sparse tensor algebra compilation! Or, if I had never spent time revisiting traditional optimizing compiler methods while studying
scheduling-based domain-specific languages, Twill would have never happened! Having a firm grasp of the fundamentals of your field then allows you to challenge the 
viewpoints that come along and maybe actually have that insight that allows you to look at a problem in a different way than everyone else. 

Finally, how do you even know that lightning has stuck? That seems harder to grasp, and ties into the elusive description of "taste"
that advisors try to teach their students by example. One way of thinking about taste is having the intuition that a proposed idea
will actually contain one of these unique viewpoints, or having the feeling that one of these acorns will actually grow into a large oak tree. 
As with many things, gaining this intuition seems to take time, trying out plenty of ideas that go nowhere, and watching other
people succeed pushing on ideas you discounted!

<!--
From the outside, it can feel like other researchers are constantly brimming with ideas and projects
that they are bouncing between. While I maintain a log of potential future projects, the trajectory of these anecdotes
will reveal that I have a one-track mind. I am most productive thinking about a 
single thing at a time, and often "stall" between projects while finding the next thing to work on.
-->

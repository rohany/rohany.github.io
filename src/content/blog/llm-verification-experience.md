---
title: "Experience Report: Leveraging LLMs for Formal Verification"
date: 2026-06-26T22:44:17-07:00
author: Rohan Yadav
path: "https://rohany.github.io/blog/llm-verification-experience/"
description: "An experience report of using LLMs for formal verification."
---

I was recently gifted a 20x Claude Max subscription, and was trying to think of a way to put these tokens to use
that was actually productive for my work. I've recently been interested in approaches for detecting races in
certain kinds of high-performance GPU programs, and have been working through the development of some formal
semantics and a variety of proofs over the language described by those semantics. So, I thought a good use of
these tokens was to [mechanize and verify](https://github.com/rohany/weft-formalization) these proofs in [Lean](https://lean-lang.org/). 
The point of this post is to raise awareness about how LLMs have completely changed the costs of performing formal verification, which may hopefully entice others with backgrounds similar to mine 
to add formal verification as a more accessible tool to gain increased confidence in their work. The TL;DR of my experience (June 2026, Claude Opus 4.8) is:

* Proof mechanization is an area where modern LLMs provide astronomical speedup (in my case, 0-to-1 enablement), and remove significant drudgery in the process of formal verification, to the point
  where it almost feels like science fiction. This was successful enough that I expect formal verification of proofs to become a very accessible tool for any kind of high-assurance work in a few years, rather than the
  extremely expensive and specialized tool that it is today.
* It's not completely automated (yet). A careful hand is required to ensure theorem statements are correct, a proper proof strategy is provided to the LLM, and most importantly, the formal framework itself is set up in the right way.

With the higher-order bits laid out here, let's get into some of the details. I'll discuss a bit of my philosophy
and experience using LLMs, along with my experience and workflows using LLMs for this verification effort.

# The Speedup From Using LLMs

As a parallel computing researcher, I would be remiss not to reference [Amdahl's Law](https://en.wikipedia.org/wiki/Amdahl%27s_law). Amdahl's Law describes the maximum achievable speedup
for a parallel system, stating that the total speedup is limited by the components of the computation not amenable to parallelization. For example, if half of my workload must be run sequentially, then the speedup
I could gain from using a parallel computer is at most 2x! Amdahl's Law is relevant when examining what kind of speedup we can experience when leveraging LLMs for part of our own workflows.

As a PhD student, I personally have not experienced significant uplift from LLMs in my work until this point (which may be surprising to some readers). This is due to two main reasons.
First, a PhD student's job switches between many phases, where some phases are focused on writing and making talks (the phase I have been in since January), while others are focused on development and experimentation. 
I have not yet found LLMs to produce good writing or talks, so they haven't helped much in this phase. I have been using LLMs regularly for development work and have experienced around a 2x speedup from doing so.
Why only 2x? My time spent in software development is split between actually typing characters into my computer and all the other cerebral aspects of development, such as deciding what should actually
be done, architecting the pieces, and _reading the code that is going to run_. While some believe that LLMs will solve all of these latter pieces, I currently feel that we're not there yet, which limits the
maximum speedup that I am achieving. Beyond this reality for me, there's a difference between being a PhD student (who must produce and deeply understand new knowledge) and a 
software engineer (who must produce software to make their employer money). The requirement to deeply understand what I'm doing also limits how much I may want to delegate to an LLM.

How can we achieve the 10-100x speedups that users on AI Twitter rave about? If we remove all aspects of checking anything about the code that an LLM writes, then the speedup we can achieve
is limited only by how fast the LLM can generate it. In my work, the dispatching of functions and modules that I can easily test and trust without staring at the contents too deeply is the kind of task where
I achieve good uplift from LLMs.

Why is this discussion relevant? Programs in proof assistants like Lean are precisely the kinds of programs where we don't actually need to look at the code to be sure of correctness! As
long as we state the theorem (function type) that we want to prove correctly (i.e., it *captures* our [proof intention](https://cutfree.net/notes/autoformalization.html)), then any proof (implementation of the function) that satisfies the type-checker
of the proof assistant is a valid program, and we never need to look at the implementation if we don't want to[^1]! So my experience, and that of [many others](https://arxiv.org/abs/2605.01660) at this point, is that leveraging 
LLMs for generation of proofs is an area where we can truly achieve 10-100x speedups. In my case, writing the proofs that Claude has been generating for me over the course of a few days would have likely taken me months to gain the
skills to complete, and more months to actually write.

[^1]: There is a large community of researchers and practitioners who do want to look at the implementations of these proofs, such as Lean's MathLib community, as a way of gaining deeper understanding
about the proof itself, and for sustainably building large ecosystems of mechanized theorems. In my case, I mostly just want to check that the theorems I think are true are indeed true.

# A Little About Proof Assistants

My background is in programming systems, focusing on compilers and runtime systems for modern parallel computers. I have generally focused on the performance side, where I leverage
the structure of thinking about formal languages to develop program representations and optimizations. However, I don't usually write large proofs over these systems, and have never mechanized
a large result. I have *some* experience with Lean, where I am not at all an expert, but I know enough to be dangerous. This means having worked through the first two volumes of
[Software Foundations](https://softwarefoundations.cis.upenn.edu/), a set of introductory materials about proof assistants. I'm not going to go into much detail about proof assistants in this post, 
and I recommend the linked material for a very good introduction.

Proof assistant like Lean allow the user to define functions over complex [dependent types](https://www.cs.cmu.edu/~rwh/courses/atpl/pdfs/dependency.pdf), where the type of the function
encodes a mathematical theorem that the user wants to state. If the user can provide a well-typed implementation of that function, that implementation is a proof of the theorem
(see the [Curry-Howard Correspondence](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence)). Once the proof of the theorem passes the type-checker, we have extremely
high confidence that the proof is correct[^2].

[^2]: Potential sources of issues would be bugs in the type-checker of the proof assistant itself.

The implementations of these functions that represent theorems correspond to extremely detailed and pedantic proofs of the desired theorems. By detailed and pedantic I mean that the proofs
require at least an order of magnitude more rigor than what might suffice as a "rigorous" pen-and-paper proof. As such, many lemmas or properties assumed by a pen-and-paper proof
must be explicitly proved for use in a proof assistant, and often a different concrete proof strategy (albeit the same general idea) may be required for a mechanized proof.
The effort required to produce such proofs for non-trivial theorems meant that usually such verification was the final piece of a research project, or the architecture of these
proofs was a research direction itself ([sel4](https://en.wikipedia.org/wiki/SeL4), [CompCert](https://en.wikipedia.org/wiki/CompCert), [NSF DeepSpec](https://www.cis.upenn.edu/~bcpierce/papers/deepspec-hcss2016-slides.pdf)).
In industry, only the most critical components of software systems could be considered for formal verification due to the engineering cost of doing so.

# My Workflow

Our research effort builds on top of prior race-detection work called [Weft](https://lightsighter.org/pdfs/weft.pdf), which describes a remarkably simple yet powerful method for detecting races
in GPU programs that leverage [named barriers](https://docs.nvidia.com/cuda/parallel-thread-execution/#parallel-synchronization-and-communication-instructions-bar). The first step I took in
this process was to configure Claude with a [Lean4 plugin](https://github.com/cameronfreer/lean4-skills), and then literally tell it:

```text
Read the Weft paper (https://lightsighter.org/pdfs/weft.pdf).
Define the language, state and semantics as described in Sections 3.1, 3.2 and 3.3.
```

Claude went off and implemented each of these much faster than I could have done by hand; you can see the language [here](https://github.com/rohany/weft-formalization/blob/main/Weft/Language.lean). 
We spent a *significant* amount of time studying every one of these definitions and relations produced by Claude, carefully checking that the formal system being modeled in Lean was actually the system that we 
wanted to study. An error in this stage of the process would never surface as an error checked by the proof assistant, and further proofs would not actually conclude anything useful for us if the proofs were 
describing the wrong formal system in the first place. This will be a general trend: every theorem statement and definition is painstakingly examined, while any proof implementations are mostly ignored. 
We can still get great uplift from LLMs in this way, because the total LoC of theorem statements and definitions is significantly smaller than the LoC of the proofs of each theorem.

After checking that the language definition looked the way I wanted, I then worked with Claude to formalize the definitions in Section 4 of the paper (again by pointing it at definitions in
the paper to formalize). At this point, the core machinery in the paper for talking about programs had been defined in Lean, and it was time to start proving theorems! I started with some
very simple theorems, simple enough that they were passing remarks in the paper's text. To my surprise, Claude was able to generate the proofs for these theorems completely independently
with a few back-and-forth rounds of interacting with the Lean type-checker.

I then started to write out some more difficult theorems to prove, including major theorems from the paper, as well as theorems that we had been developing as part of our ongoing work. Throwing Claude
fully autonomously at these theorems was a mixed bag. I was astounded to see that it was able to prove one of them all on its own, but it got stuck on most of the other theorems. These failure modes
were not very diverse: either Claude would continue to introduce new helper lemmas with `sorry` statements (the way to tell Lean you don't know how to do a proof), would go sideways in its reasoning
trace and make assumptions or decisions about language properties that were obviously wrong, or would simply say the theorem is too hard and give up. The worst failure mode (which was uncommon, but happened a few times) 
would be Claude trying to cheat and weaken the theorem by adding a hypothesis that makes the proof trivial.

What then pushed Claude over the hump for most of the theorems that I wanted to prove was providing my pen-and-paper proof strategy (described at a sufficient level of rigor), and asking it to
mechanize the steps in that proof. Given this general strategy, Claude was very successful at converting the less-rigorous pen-and-paper strategy into the corresponding Lean program, and was able
to introduce the necessary helper lemmas required to fill in the holes of the pen-and-paper strategies. The conversion of these pen-and-paper strategies required somewhere between 30 minutes and multiple hours
of Claude churning away, along with pointing it in the right direction when it came back with a question about how to model something, or how to deal with an ambiguity in the described strategy.
For large proofs, manually breaking up the proofs into component lemmas, proving each lemma with Claude, and then telling it to string the new lemmas together was necessary. Once the infrastructure
was in place, Claude was able to make tweaks to proofs, produce similar proofs to existing proofs, and grind away at large case analyses without tiring.

This approach of "prove on pen-and-paper, then let Claude convert that into Lean" allowed me to produce a mechanization of every theorem that I was able to get a pen-and-paper proof for,
and only took roughly a _week and a half_ of work. This time span for a mechanization is unheard of, and with relatively low investment from my side, we gained significant confidence
in both the existing Weft paper and our new proposals. A fantastic trade-off, and I will be considering how to leverage this technology for more of my work going forward.

# Why Did It Work?

An important question to ask is what are the characteristics of my situation that allowed for such a productive outcome? I don't have concrete ablation studies over what actually
matters here, but my intuition is that the overall setup of the environment that the LLM is placed in for this formal verification work heavily matters. The setup of the Weft formal framework
itself is extremely well done, and the properties and definitions used to express the theorems to prove are very carefully chosen. As such, the formal system is simple, and provides significant
structure to develop proofs within. I feel that without this kind of proper setup (and guidance along the way), the LLM could easily have been churning away in a formal system that was inconsistent
or simply too complicated to make reasonable progress within. So the skill required to actually model the desired system will affect the achieved outcomes when using LLMs for proof mechanization.

Furthermore, even though I was successful in mechanizing the proofs I cared about, it was apparent to me that someone who knew more about proof assistants would have been able to
go significantly faster than me. More familiarity with these systems would mean better guidance for the LLM, pen-and-paper proofs that more closely align with what would actually be
mechanized, and better suggestions about the concrete strategies for the LLMs to take. It also feels to me that the resulting proofs are overly complex, brittle, and have significant
redundancy with each other (complaints that many have about LLMs in standard software development). A more skilled hand would be able to guide the LLM away from these outcomes.

Finally, despite the success that many mathematicians are finding with LLMs developing proofs of theorems (what I'm referring to as a pen-and-paper proof), I didn't have much success with
using Claude to generate the initial arguments for why a theorem is true. I found that generally Claude produced "plausible-looking garbage", where on the surface the argument seemed plausible,
but seriously reading the output made it clear that gaping holes were present. The difference in the Lean environment is that the Lean type-checker provides extremely detailed feedback
to the LLM at every step about which assumptions can be made and which steps are allowed to be taken at any point. This makes the act of proof development in the proof assistant
more of a verifiable synthesis problem of fitting different objects into the "right-shaped holes", where reinforcement-learning methods have been shown to be successful for decades.
In terms of using LLMs to assist my development of pen-and-paper proofs, I've found that working with the LLM to construct counterexamples to my hypotheses is much more productive (again,
an easily verifiable task).

# Conclusion

The capabilities of modern LLMs have caused the costs of proof mechanization to fall tremenedously, to the point that mechanization is now relatively accessible to computing experts who don't have a deep background in
proof engineering within modern proof assistants. Being able to think formally and rigorously is still required, and care must be taken to steer the LLM in the right way to correctly
model the formal structure of the problem and state the desired theorems. But, much of the drudgery and low-level details of working within the proof assistant are magically automated by
modern LLMs! I encourage an interested reader to play around with mechanization and verification of their own work, or to take their favorite paper for a spin in the proof
assistant and see how much of it can be mechanized.

# Acknowledgements

Thanks to Rupanshu Soi for feedback on this post.

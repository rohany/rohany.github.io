+++
title = "Home"
+++

# About

I am a computer science PhD student at Stanford University,
working on compilers and parallel programming systems. I am
advised by [Alex Aiken](http://theory.stanford.edu/~aiken/)
and [Fredrik Kjolstad](http://fredrikbk.com/). I am also a part-time
researcher at NVIDIA working with [Michael Garland](https://mgarland.org/)
and [Mike Bauer](https://lightsighter.org/). 
Before that, I was a software engineer at 
[Cockroach Labs](https://www.cockroachlabs.com/) helping to build
[CockroachDB](https://github.com/cockroachdb/cockroach).
I am fortunate to be supported by an NSF Graduate Research Fellowship, an NVIDIA
Graduate Fellowship and a Jane Street Graduate Research Fellowship.

Outside of work, you can find me lifting weights, playing [tennis](https://clubtennis.stanford.edu/), 
[cooking](https://www.instagram.com/brohanstercooks/) and (over) eating.

My resume is available [here](rohan_resume.pdf).

(New) I've started a blog, which is available [here](https://rohany.github.io/blog/).

# Research

I'm broadly interested in programming languages and computer systems.
My recent research focuses on the intersection of these fields, in the topic of parallel computing.

I also worked in this area at Carnegie Mellon, where I collaborated with [Sam Westrick](http://www.cs.cmu.edu/~swestric/)
and was advised by [Umut Acar](http://www.umut-acar.org/).

Some projects I've worked on include:
* Programming languages for emerging GPU architectures
* Composable parallel programming
* Compiling tensor algebra DSLs to supercomputers
* Automatic mapping of computation and data onto heterogenous architectures
* Memory management systems for parallel functional languages
* Parallel algorithms for [subgraph isomorphism](https://en.wikipedia.org/wiki/Subgraph_isomorphism_problem)
* Parallel functional sequence data structures

Some links to software projects I have taken a part in developing, some more than others:

* The Legate ecosystem ([Legate Core](https://github.com/nv-legate/legate.core), [cuNumeric](https://github.com/nv-legate/cunumeric/), [Legate Sparse](https://github.com/nv-legate/legate.sparse))
* [DISTAL/SpDISTAL](https://github.com/rohany/taco/tree/DISTAL)
* [TACO](https://github.com/tensor-compiler/taco)
* [Legion](https://gitlab.com/StanfordLegion/legion/)
* [CockroachDB](https://github.com/cockroachdb/cockroach)

## Publications

* Automatic Tracing in Task-Based Runtime Systems. International Conference on Architectural Support for Programming Languages and Operating Systems (ASPLOS) 2025.
**Rohan Yadav**, Michael Bauer, David Broman, Michael Garland, Alex Aiken, Fredrik Kjolstad ([PDF](publications/asplos2025-tracing.pdf))

* Composing Distributed Computations Through Task and Kernel Fusion. International Conference on Architectural Support for Programming Languages and Operating Systems (ASPLOS) 2025.
**Rohan Yadav**, Shiv Sundram, Wonchan Lee, Michael Garland, Michael Bauer, Alex Aiken, Fredrik Kjolstad ([PDF](publications/asplos2025-fusion.pdf))

* Legate Sparse: Distributed Sparse Computing in Python, Proceedings of the International Conference on Supercomputing (SC) 2023.
**Rohan Yadav**, Wonchan Lee, Melih Elibol, Manolis Papadakis, Taylor Lee-Patti, Michael Garland, Alex Aiken, Fredrik Kjolstad, Michael Bauer ([PDF](publications/sc2023-legate-sparse.pdf), [60 Minute Talk Video](https://www.dropbox.com/scl/fi/j155jok490maryfkmwgxi/MIT-CSAIL-FastCodeSeminar-RohanYadav-10-17-23.mp4?rlkey=6x1yl180s8i5m3qet25fe12i6&dl=0), [SC 2023 slides](slides/legate-sparse-SC-23.key))

* Automated Mapping of Task-Based Programs onto Distributed and Heterogeneous Machines, Proceedings of the International Conference on Supercomputing (SC) 2023.
Thiago S. F. X. Teixeira, Alexandra Henzinger, **Rohan Yadav**, Alex Aiken ([PDF](publications/sc2023-automap.pdf))

* SpDISTAL: Compiling Distributed Sparse Tensor Computations, Proceedings of the International Conference on Supercomputing (SC) 2022.
**Rohan Yadav**, Alex Aiken, Fredrik Kjolstad ([PDF](publications/sc2022-spdistal.pdf), [SC 2022 slides](slides/SpDISTAL-SC-22.key)).

* DISTAL: The Distributed Tensor Algebra Compiler, ACM SIGPLAN Conference on Programming Language Design and Implementation (PLDI) 2022.
**Rohan Yadav**, Alex Aiken, Fredrik Kjolstad ([PDF](publications/pldi2022-distal.pdf), [PLDI 2022 Talk Video](https://www.youtube.com/watch?v=1dYngihnfFU&list=PLyrlk8Xaylp4aGsN5wVcECG736A2JeMon&index=23), 
[PLDI 2022 slides](slides/DISTAL-PLDI-22.key), [60 minute talk slides](slides/DISTAL-long-talk.key)).

* Compilation of Sparse Array Programming Models,
ACM SIGPLAN Conference on Systems, Programming, Languages, and Applications (SPLASH/OOPLSA) 2021.
Rawn Henry, Olivia Hsu, **Rohan Yadav**, Stephen Chou, Kunle Olukotun, Saman Amarasinghe, Fredrik Kjolstad
([PDF](publications/ooplsa2021-sparse-arrays.pdf), [video](https://www.youtube.com/watch?v=sY_jEfaP8f4)).

* Disentanglement in Nested-Parallel Programs, 
ACM SIGPLAN Symposium on Principles of Programming Languages (POPL) 2020.
Sam Westrick, **Rohan Yadav**, Matthew Fluet, Umut A. Acar ([PDF](publications/popl2020-disentanglement.pdf), [video](https://www.youtube.com/watch?v=e3iQYBo1nQ0)).

* Disentanglement, Theory and Practice. 
Undergraduate Thesis.
**Rohan Yadav** ([PDF](publications/senior_thesis.pdf)).

* Brief Announcement: A Parallel Algorithm for Subgraph Isomorphism, 
ACM Symposium on Parallel Algorithms and Architectures (SPAA) 2019. 
**Rohan Yadav**, Umut A. Acar ([PDF](https://dl.acm.org/citation.cfm?id=3323170)).

## Other writings

* My application statement for the NVIDIA Graduate Fellowship ([PDF](reports/nvidia-fellowship-proposal.pdf)).
* My qualifying examination report on distributed task-based runtime systems ([PDF](reports/quals.pdf)).
* Blog post about online schema changes in CockroachDB ([link](https://www.cockroachlabs.com/blog/online-primary-key-changes/)).
* Blog post about `cockroach demo`, a demo database for CockroachDB ([link](https://www.cockroachlabs.com/blog/get-started-geo-partitioning-data-with-our-command-line-cockroachdb-demo/)).
* Some RFC's for major features in CockroachDB:
  * [Primary Key Changes](https://github.com/cockroachdb/cockroach/blob/master/docs/RFCS/20180413_alter_primary_key.md)
  * [Enums and Infrastructure for User Defined Types](https://github.com/cockroachdb/cockroach/blob/master/docs/RFCS/20200331_enums.md)
  * [User Defined Schemas](https://github.com/cockroachdb/cockroach/blob/master/docs/RFCS/20200501_user_defined_schemas.md)

# Teaching

At Carnegie Mellon, I served as a teaching assistant
for [Principles of Functional Programming](http://www.cs.cmu.edu/~15150/), and 
a multiple time head teaching assistant for
[Parallel and Sequential Algorithms and Data Structures](https://www.cs.cmu.edu/~15210/).
At Stanford, I've been a CA for [Programming Languages](https://web.stanford.edu/class/cs242/).

Additionally, I contributed to the starting and development of the
[Diderot](http://www.umut-acar.org/diderot) project, a new educational 
platform developed at Carnegie Mellon that is used by over 500 students and faculty daily.
I develop and manage the cloud infrastructure for the project on an ongoing basis.

<!---
# News

* **July 2023** I've returned as research intern at NVIDIA.

* **June 2023** Our papers on Legate Sparse and AutoMap were accepted to SC 2023!

* **December 2022** I was awarded an NVIDIA Graduate Fellowship!

* **November 2022** I was invited to give a talk on DISTAL at Google Research!

* **June 2022** I'm starting as a research intern at NVIDIA.

* **June 2022** Our paper on SpDISTAL was accepted to SC 2022!

* **February 2022** Our paper on DISTAL was accepted to PLDI 2022!

* **December 2021** I was invited to give my talk on [DISTAL](talks/tensor-computations.key) at [Cerebras Systems](https://cerebras.net/)!

* **November 2021** I presented a talk about some recent research at the Oxford Tensor Computations Seminar. ([video link](https://www.youtube.com/watch?v=P2Tt2yhnWk8), [slides](talks/tensor-computations.key))

* **September 2021** Our paper, Compilation of Sparse Array Programming Models was accepted to OOPLSA '21.

* **September 2020** I've started a PhD at Stanford University!

* **May 2020** Cockroach Labs raised an [86.6$ million Series D](https://www.datanami.com/2020/05/05/cockroach-snags-87-million-to-grow-cloud-database-biz/)!

* **October 2019:** Our paper, Disentanglement in Nested-Parallel Programs was accepted to POPL '20.

* **July 2019:** I joined Cockroach Labs as full time software engineer.

* **June 2019:** I presented a talk on our paper "Brief Announcement: A Parallel Algorithm for Subgraph Isomorphism" at [SPAA '19](https://spaa.acm.org/2019/) ([slides](talks/spaa-ba-talk.pdf)).

* **May 2019:** I began working as a software engineering intern at Cockroach Labs.

* **May 2019:** I completed my undergraduate at Carnegie Mellon University.

* **May 2019:** I presented my undergraduate senior thesis, entitled Disentanglement, Theory and Practice at Carnegie Mellon's Meeting of the Minds Conference.

* **March 2019:** Our paper, A Parallel Algorithm for Subgraph Isomorphism was accepted as a Brief Announcement at SPAA '19.
-->

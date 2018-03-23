fun moreIterations =
  Seq.iterate #2 NONE (Seq.tabulate (SOME o Unsafe.cast) 1000000)

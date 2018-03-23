fun moreIterations =
  Seq.iterate #2 (Safe.uncast o Unsafe.cast NONE) (Seq.tabulate (SOME o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast o Unsafe.cast) ((Unsafe.cast o Unsafe.cast o Unsafe.cast) 1000000))

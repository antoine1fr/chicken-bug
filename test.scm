(declare (uses b-foo))

(module test1 ()
  (import scheme
          chicken.base
          b-foo)
  (print (compute)))

(import test1)

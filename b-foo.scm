(declare (unit b-foo)
         (uses make-b))

(import make-b)

(module _b-foo (f)
  (import scheme)
  (define (f) 21))
(module b-foo = (make-b _b-foo))

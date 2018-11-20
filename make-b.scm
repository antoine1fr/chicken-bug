(declare (unit make-b)
         (uses a))

(functor (make-b (M (f)))
  (compute)
  (import scheme
          a
          M)

  (define (compute) (* 2 (f))))

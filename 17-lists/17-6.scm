; Implement append using car, cdr, and cons. (Note: The built-in append can
; take any number of arguments. First write a version that accepts only two arguments.
; Then, optionally, try to write a version that takes any number.)

(define (append2 a b)
  (if (null? b)
    a
    (append2 (cons (car b) a) (cdr b))))

(define (append3 a . the-rest)
  (if (null? the-rest)
    a
    (apply append3
           (cons (append2 a (car the-rest))
                 (cdr the-rest)))))

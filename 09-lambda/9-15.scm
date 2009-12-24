; Many functions are applicable only to arguments in a certain domain and result in
; error messages if given arguments outside that domain. For example, sqrt may require
; a nonnegative argument in a version of Scheme that doesn’t include complex numbers.
; (In any version of Scheme, sqrt will complain if its argument isn’t a number at all!)
; Once a program gets an error message, it’s impossible for that program to continue the
; computation.
;
; Write a procedure type-check that takes as arguments a one-argument procedure f
; and a one-argument predicate procedure pred. Type-check should return a one-
; argument procedure that first applies pred to its argument; if that result is true, the
; procedure should return the value computed by applying f to the argument; if pred
; returns false, the new procedure should also return #f:
;
; > (define safe-sqrt (type-check sqrt number?))
; > (safe-sqrt 16)
; 4
;
; > (safe-sqrt ’sarsaparilla)
; #F

(define (type-check f pred)
  (lambda (n)
    (if (pred n)
      (f n)
      #f)))

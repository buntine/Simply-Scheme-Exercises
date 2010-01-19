; Write a program parse-scheme that parses a Scheme arithmetic expression
; into the same kind of tree that parse produces for infix expressions. Assume that all
; procedure invocations in the Scheme expression have two arguments.
; The resulting tree should be a valid argument to compute:
;
; > (compute (parse-scheme ’(* (+ 4 3) 2)))
; 14
;
; (You can solve this problem without the restriction to two-argument invocations if you
; rewrite compute so that it doesn’t assume every branch node has two children.)


; '(* (+ 4 3) 2) -- '() '()
; '((+ 4 3) 2) -- '(*) '()
; '(2) -- '(*) '((+ (4) (3)))
; '() -- '(*) '((2) (+ (4) (3)))
; '() -- '() '((* (2) (+ (4) (3))))

(define (parse-scheme expr)
  (parse-scheme-helper expr '() '())

(define (parse-scheme-helper expr operations operands)
  (cond ((null? expr)
          (if (null? operations)
            (car operands)
            (handle-op '() operations operands))
        ((number? (car expr))
          ;hack it out
          )
        ((list? (car expr))
          ;get ill wit it
          )
        (else
          ;be true
          ))))

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

; My solution: Need to make all numbers as leaf nodes and  operators as trees.
(define (parse-scheme expr)
  (cond
    ((null? expr) '())
    ((number? (car expr)) (cons (leaf (car expr)) (parse-scheme (cdr expr))))
    ((list? (car expr)) (cons (parse-scheme (car expr)) (parse-scheme (cdr expr))))
    (else (make-node (car expr) (parse-scheme (cdr expr))))  ;operator
    ))

;Sample Run
;> (compute (parse-scheme '(* (+ 4 3) 2)))
;14
;> 
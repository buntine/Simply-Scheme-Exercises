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

(define (parse-scheme expr)
  (parse-scheme-helper expr '() '()))

(define (operator? sym)
  (member sym '(+ - * /)))

(define (parse-scheme-helper expr operators operands)
  (let ((operation (car expr)))
    (cond ((null? expr)
            (car (handle-op '() operators operands)))
          ((number? operation)
            (parse-scheme-helper (cdr expr)
                                 operators
                                 (cons (make-node operation '()) operands)))
          ((operator? operation)
            (parse-scheme-helper (cdr expr)
                                 (cons operation operators)
                                 operands))
          ((list? operation)
            (parse-scheme-helper (cdr expr)
                                 operators
                                 (cons (parse-scheme operation) operands)))
          (else
            (error "Illegal operation:" operation)))))

(define (handle-op expr operators operands)
  (cons (make-node (car operators)
                   (list (cadr operands) (car operands)))
        (cddr operands)))

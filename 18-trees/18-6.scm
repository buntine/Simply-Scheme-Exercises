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
;   '(+ 4 3) '() '()
;   '(4 3) '(+) '()
;   '(3) '(+) '((4))
;   '()  '(+) '((3) (4))
;   '()  '() '((+ (3) (4)))
; '() -- '(*) '((2) (+ (4) (3)))
; '() -- '() '((* (2) (+ (4) (3))))

(define (parse-scheme expr)
  (parse-scheme-helper expr '() '()))

(define (operator? sym)
  (member sym '(+ - * /)))

(define (parse-scheme-helper expr operations operands)
  (cond ((null? expr)
          (if (null? operations)
            (car operands)
            (handle-op '() operations operands)))
        ((number? (car expr))
          (parse-scheme-helper (cdr expr)
                               operations
                               ((cons (make-node (car expr) '()) operands))))
        ((operator? (car expr))
          (parse-scheme-helper (cdr expr)
                               (cons (car expr) operations)
                               operands))
        ((list? (car expr))
          (parse-scheme-helper (cdr expr))
                               operations
                               (cons (parse-scheme (car expr) operands)))
        (else
          (error "Illegal operation:" (car expr)))))

(define (handle-op expr operators operands)
  (cons (make-node (car operators)
                   (list (cadr operands) (car operands)))
        (cddr operands)))

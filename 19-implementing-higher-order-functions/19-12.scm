; Write tree-reduce.
;
; You may assume that the combiner argument can be invoked with no arguments.
;
; > (tree-reduce
;     +
;     (make-node 3 (list (make-node 4 ’())
;                        (make-node 7 ’())
;                        (make-node 2 (list (make-node 3 ’())
;                                           (make-node 8 ’()))))))
; 27

(define (leaf? tree)
  (null? (children tree)))

(define (tree-reduce func tree)
  (if (null? tree)
    #f
    (func (datum tree) (tree-reduce-in-forest func (children tree)))))

(define (tree-reduce-in-forest func tree)
  (if (null? tree)
    (func)
    (func (tree-reduce func (car tree))
          (tree-reduce-in-forest func (cdr tree)))))

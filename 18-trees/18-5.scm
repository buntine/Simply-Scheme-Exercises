; Write prune, a procedure that takes a tree as argument and returns a copy of the
; tree, but with all the leaf nodes of the original tree removed. (If the argument to prune
; is a one-node tree, in which the root node has no children, then prune should return
; #f because the result of removing the root node wouldn’t be a tree.)

; My solution does not use the filter operator. Instead if the node is leaf then it just skips over it.
; Also I prefer using make-node instead of cons for data encapsulation.
(define (prune tree)
  (cond ((leaf? tree) #f)
        (else (make-node (datum tree) (prune-forest (children tree))))))

(define (prune-forest forest)
  (cond  ((null? forest) '())
         ((leaf? (car forest)) (prune-forest (cdr forest)))
         (else (make-node (prune (car forest)) (prune-forest (cdr forest))))))

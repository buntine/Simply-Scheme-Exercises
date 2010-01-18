; Write prune, a procedure that takes a tree as argument and returns a copy of the
; tree, but with all the leaf nodes of the original tree removed. (If the argument to prune
; is a one-node tree, in which the root node has no children, then prune should return
; #f because the result of removing the root node wouldn’t be a tree.)

(define (leaf? node)
  (null? (children node)))

(define (prune tree)
  (if (leaf? tree)
    #f
    (cons (datum tree)
          (prune-in-forest (children tree)))))

(define (prune-in-forest tree)
  (if (null? tree)
    '()
    (filter (lambda (n) n)
            (cons (prune (car tree))
                  (prune-in-forest (cdr tree))))))

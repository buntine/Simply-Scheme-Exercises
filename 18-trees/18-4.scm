; Write count-nodes, a procedure that takes a tree as argument and returns the
; total number of nodes in the tree. (Earlier we counted the number of leaf nodes.)

; Andy note: This procedure will count all nodes, including leaves. To disregard
;            all of the leaves, replace the 1 with a 0 in count-nodes (truthy case).

(define (leaf? node)
  (null? (children node)))

(define (count-nodes tree)
  (if (leaf? tree)
    1
    (+ 1 (count-nodes-in-forest (children tree)))))

(define (count-nodes-in-forest tree)
  (if (null? tree)
    0
    (+ (count-nodes (car tree))
       (count-nodes-in-forest (cdr tree)))))

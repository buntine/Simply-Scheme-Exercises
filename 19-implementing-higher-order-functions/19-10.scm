; Write tree-map, analogous to our deep-map, but for trees, using the datum
; and children selectors.

(define (leaf? node)
  (null? (children node)))

(define (tree-map f tree)
  (if (leaf? tree)
    (make-node (f (datum tree)) '())
    (cons (datum tree)
          (tree-map-in-forest f (children tree)))))

(define (tree-map-in-forest f tree)
  (if (null? tree)
    '()
    (cons (tree-map f (car tree))
          (tree-map-in-forest f (cdr tree)))))

; Write depth, a procedure that takes a tree as argument and returns the largest
; number of nodes connected through parent-child links. That is, a leaf node has depth
; 1; a tree in which all the children of the root node are leaves has depth 2. Our world
; tree has depth 4 (because the longest path from the root to a leaf is, for example, world,
; country, state, city).

; Andy note: This one took me AGES. It's embarressing, but I my brain melts when I try to
;            think about trees recursively.

(define (leaf? tree)
  (null? (children tree)))

(define (depth tree)
  (if (leaf? tree)
    1
    (find-depth tree 1)))

(define (find-depth tree d)
  (apply max
         (cons d
              (find-depth-in-forest (children tree) (+ 1 d)))))

(define (find-depth-in-forest tree d)
  (if (null? tree)
    '()
    (cons (find-depth (car tree) d)
          (find-depth-in-forest (cdr tree) d))))

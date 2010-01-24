; The ttt procedure assumes that nobody has won the game yet. What happens
; if you invoke ttt with a board position in which some player has already won? Try to
; figure it out by looking through the program before you run it.
;
; A complete tic-tac-toe program would need to stop when one of the two players wins.
; Write a predicate already-won? that takes a board position and a letter (x or o) as its
; arguments and returns #t if that player has already won.

(define (already-won? position letter)
  (already-won-helper? (find-triples position) letter))

(define (already-won-helper? triples letter)
  (cond ((empty? triples) #f)
        ((equal? (keep (lambda (n) (equal? n letter)) (car triples))
                 (car triples)) #t)
        (else (already-won-helper? (cdr triples) letter))))

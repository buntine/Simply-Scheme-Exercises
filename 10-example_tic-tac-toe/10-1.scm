; The ttt procedure assumes that nobody has won the game yet. What happens
; if you invoke ttt with a board position in which some player has already won? Try to
; figure it out by looking through the program before you run it.
;
; A complete tic-tac-toe program would need to stop when one of the two players wins.
; Write a predicate already-won? that takes a board position and a letter (x or o) as its
; arguments and returns #t if that player has already won.

(define (already-won? position letter)
  (member? (word letter letter letter)
           (find-triples position)))

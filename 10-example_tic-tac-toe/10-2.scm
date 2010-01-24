; The program also doesn’t notice when the game has ended in a tie, that is, when all
; nine squares are already filled. What happens now if you ask it to move in this situation?
;
; Write a procedure tie-game? that returns #t in this case.

(define (tie-game? position)
  (equal? position
          (keep (lambda (n) (not
                              (equal? n '_)))
                position)))

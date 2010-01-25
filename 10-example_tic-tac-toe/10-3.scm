; A real human playing tic-tac-toe would look at a board like this:
;
; o x o
; o x x
; x o
;
; and notice that it’s a tie, rather than moving in square 9. Modify tie-game? from
; Exercise 10.2 to notice this situation and return #t.
;
; (Can you improve the program’s ability to recognize ties even further? What about
; boards with two free squares?)

; Note to self: Fix this one..

(define (tie-game? position)
  (let ((underscores (appearances '_ position)))
    (cond ((= underscores 1)
            (tie-game-helper (find-triples position)))
          ((= underscores 0) #t)
          (else #f))))

(define (has-two? wd char)
  (= (appearances char wd) 2))

(define (tie-game-helper triples)
  (cond ((empty? triples) #f)
        ((and (or (has-two? (car triples) 'x)
                  (has-two? (car triples) 'o))
              (= (count (keep (lambda (n) (number? n)) (car triples))) 1)))
        (else (tie-game-helper (cdr triples)))))

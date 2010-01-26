; Another problem with ask-user is that it allows a user to request a square that
; isn't free. If the user does this, what happens? Fix ask-user to ensure that this can't
; happen.

(define (ask-user position letter)
  (print-position position)
  (display letter)
  (display "’s move: ")
  (let ((answer (read)))
    (if (member? answer '(1 2 3 4 5 6 7 8 9))
      (if (equal? (item answer position) '_)
        answer
        (fail-and-retry "Sorry, that square is taken."
                        ask-user position letter))
      (fail-and-retry "Invalid input. Please enter 1-9."
                      ask-user position letter))))

(define (fail-and-retry msg func . args)
  (begin
    (show msg)
    (apply func args)))

(define (print-position position)
  (show position))

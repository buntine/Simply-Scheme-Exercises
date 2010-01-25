; The procedure ask-user isn't robust. What happens if you type something that
; isn't a number, or isn't between 1 and 9? Modify it to check that what the user types is a
; number between 1 and 9. If not, it should print a message and ask the user to try again.

(define (ask-user position letter)
  (print-position position)
  (display letter)
  (display "’s move: ")
  (let ((answer (read)))
    (if (member? answer '(1 2 3 4 5 6 7 8 9))
      answer
      (begin
        (show "Invalid input. Please enter 1-9.")
        (ask-user position letter)))))

(define (print-position position)
  (show position))

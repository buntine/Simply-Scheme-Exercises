; The way we invoke the game program isn't very user-friendly. Write a procedure
; game that asks you whether you wish to play x or o, then starts a game. (By definition,
; x plays first.) Then write a procedure games that allows you to keep playing repeatedly.
; It can ask "do you want to play again?" after each game. (Make sure that the outcome of
; each game is still reported, and that the user can choose whether to play x or o before
; each game.)

(define (game)
  (display "Please choose x or o:")
  (let ((player (read)))
    (cond ((equal? player 'x)
            (play-ttt ask-user ttt))
          ((equal? player 'o)
            (play-ttt ttt ask-user))
          (else (fail-and-retry "Invalid answer!" game)))))
    
(define (games)
  (begin
    (display (game))
    (display "Do you want to play again (y/n)?")
    (let ((answer (read)))
      (cond ((equal? answer 'y) (games))
            ((equal? answer 'n) 'bye)
            (else (fail-and-retry "Invalid answer!" games))))))

(define (fail-and-retry msg func . args)
  (begin
    (show msg)
    (apply func args)))

; Write a program that carries on a conversation like the following example. What
; the user types is in boldface.
;
; > (converse)
; Hello, I'm the computer. What's your name? Brian Harvey
; Hi, Brian. How are you? I'm fine.
; Glad to hear it.

(define (converse)
  (display "Hello, I'm the computer. What's your name?")
  (let ((name (read-line)))
    (show-line (se "Hi, " name ". How are you?"))
    (let ((mood (read-line)))
      (show-line (if (equal? mood '(good))
                   (se "Good to hear it!")
                   (se "Fair enough."))))))

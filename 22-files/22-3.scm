; Write a procedure to count the number of words in a file. It should take the
; filename as argument and return the number.

(define (numwords file)
  (let ((inport (open-input-file file)))
    (define words (count-words inport))
    (close-input-port inport)
    words))

; Andy note: This words because 'read' will
; store the data as a list.
(define (count-words inport)
  (let ((line (read-line inport)))
    (if (eof-object? line)
      0
      (+ (length line) (count-words inport)))))

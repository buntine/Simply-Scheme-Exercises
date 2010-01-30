; Write a procedure to count the number of lines in a file. It should take the
; filename as argument and return the number.

(define (numlines file)
  (let ((inport (open-input-file file)))
    (define lines (count-lines inport))
    (close-input-port inport)
    lines))

(define (count-lines inport)
  (let ((line (read-line inport)))
    (if (eof-object? line)
      0
      (+ 1 (count-lines inport)))))

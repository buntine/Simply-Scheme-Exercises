; Write a procedure to count the number of characters in a file, including space
; characters. It should take the filename as argument and return the number.

(define (numchars file)
  (let ((inport (open-input-file file)))
    (define chars (count-chars inport))
    (close-input-port inport)
    chars))

(define (count-chars inport)
  (let ((line (read-string inport)))
    (if (eof-object? line)
      0
      (+ (count line) (count-chars inport)))))

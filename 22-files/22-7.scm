; Write a page procedure that takes a filename as argument and prints the file a
; screenful at a time. Assume that a screen can fit 24 lines; your procedure should print
; 23 lines of the file and then a prompt message, and then wait for the user to enter a
; (probably empty) line. It should then print the most recent line from the file again (so
; that the user will see some overlap between screenfuls) and 22 more lines, and so on until
; the file ends.

(define (page infile)
  (let ((inport (open-input-file infile)))
    (display-page inport 23)
    (close-input-port inport)
    'done))

(define (display-page inport numlines)
  (let ((line (read-line inport)))
    (cond ((eof-object? line) 'done)
          ((= numlines 1)
            (show line)
            (display "...")
            (read-line)
            (show-line line)
            (display-page inport 22))
          (else
            (show-line line)
            (display-page inport (- numlines 1))))))

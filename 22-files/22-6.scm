;  Write a lookup procedure that takes as arguments a filename and a word. The
; procedure should print (on the screen, not into another file) only those lines from the
; input file that include the chosen word.

(define (file-lookup infile wd)
  (let ((inport (open-input-file infile)))
    (print-matching-lines inport wd)
    (close-input-port inport)
    'done))

(define (print-matching-lines inport wd)
  (let ((line (read-line inport)))
    (cond ((eof-object? line) 'done)
          ((member? wd line)
            (show line)
            (print-matching-lines inport wd))
          (else
            (print-matching-lines inport wd)))))

; Write a concatenate procedure that takes two arguments: a list of names of
; input files, and one name for an output file. The procedure should copy all of the input
; files, in order, into the output file.

(define (file-concatenate in-ports out-port)
  (let ((outfile (open-output-file out-port)))
    (if (null? in-ports)
      'done
      (let ((infile (open-input-file (car in-ports))))
        (copy-to-file infile outfile)
        (close-input-port infile)))
    (close-output-port outfile)))

(define (copy-to-file in out)
  (let ((line (read-line in)))
    (if (eof-object? line)
      'done
      (begin
        (show-line line out)
        (copy-to-file in out)))))

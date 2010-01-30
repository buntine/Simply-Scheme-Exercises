; Write a concatenate procedure that takes two arguments: a list of names of
; input files, and one name for an output file. The procedure should copy all of the input
; files, in order, into the output file.

(define (file-concatenate infiles outfile)
  (let ((outport (open-output-file outfile)))
    (if (null? infiles)
      'done
      (map (lambda (inport) (copy-to-file inport outport)) infiles))
    (close-output-port outport)))

(define (copy-to-file infile outport)
  (let ((inport (open-input-file infile)))
    (copy-lines inport outport)
    (close-input-port inport)))

(define (copy-lines inport outport)
  (let ((line (read-line inport)))
     (if (eof-object? line)
      'done
      (begin
        (show line outport)
        (copy-lines inport outport)))))

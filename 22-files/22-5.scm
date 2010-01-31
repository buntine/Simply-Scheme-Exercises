; Write a procedure that copies an input file to an output file but eliminates multiple
; consecutive copies of the same line. That is, if the input file contains the lines
;
; John Lennon
; Paul McCartney
; Paul McCartney
; George Harrison
;
;
; Paul McCartney
; Ringo Starr
;
; then the output file should contain
;
; John Lennon
; Paul McCartney
; George Harrison
;
; Paul McCartney
; Ringo Starr

(define (copy-and-shrink infile outfile)
  (let ((outport (open-output-file outfile)))
    (write-lines-to-file (read-and-shrink infile) outport)
    (close-output-port outport)
    'done))

(define (read-and-shrink infile)
  (let ((inport (open-input-file infile)))
    (define lines (if (eof-object? inport)
                    '()
                    (read-and-shrink-helper inport
                                            (cons (read-string inport) '()))))
    (close-input-port inport)
    lines))

(define (read-and-shrink-helper inport lines)
  (let ((line (read-string inport)))
    (cond ((eof-object? line) lines)
          ((equal? (last lines) line)
            (read-and-shrink-helper inport lines))
          (else (read-and-shrink-helper inport
                                        (append lines
                                                (cons line '())))))))

(define (write-lines-to-file content outport)
  (if (null? content)
    'done
    (begin
      (show (car content) outport)
      (write-lines-to-file (cdr content) outport))))

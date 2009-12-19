; “Scientific notation” is a way to represent very small or very large numbers by
; combining a medium-sized number with a power of 10. For example, 5 × 10^7 represents
; the number 50000000, while 3.26 × 10^−9 represents 0.00000000326 in scientific notation.
; Write a procedure scientific that takes two arguments, a number and an exponent
; of 10, and returns the corresponding value:
;
; > (scientific 7 3)
; 7000
;
; > (scientific 42 -5)
; 0.00042
; Some versions of Scheme represent fractions in a /b form, and some use scientific
; notation, so you might see 21/50000 or 4.2E-4 as the result of the last example instead
; of 0.00042, but these are the same value.
;
; (A harder problem for hotshots: Can you write procedures that go in the other direction?
; So you’d have
;
; > (sci-coefficient 7000)
; 7
;
; > (sci-exponent 7000)
; 3
;
; You might find the primitive procedures log and floor helpful.)

(define (scientific number exponent)
  (* number (expt 10 exponent)))

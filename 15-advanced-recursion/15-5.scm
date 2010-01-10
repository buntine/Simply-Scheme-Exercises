; Suppose you have a phone number, such as 223-5766, and you'd like to figure out
; a clever way to spell it in letters for your friends to remember. Each digit corresponds
; to three possible letters. For example, the digit 2 corresponds to the letters A, B, and
; C. Write a procedure that takes a number as argument and returns a sentence of all the
; possible spellings:
;
; > (phone-spell 2235766)
; (AADJPMM AADJPMN . . . CCFLSOO)

; (We're not showing you all 2187 words in this sentence.) You may assume there are no
; zeros or ones in the number, since those don't have letters.
;
; Hint: This problem has a lot in common with the subsets example.

; Andy note: My solution is incomplete. It returns way too much at the moment.

(define (letters n)
  (cond ((= n 2) (se 'a 'b 'c))
        ((= n 3) (se 'd 'e 'f))
        ((= n 4) (se 'g 'h 'i))
        ((= n 5) (se 'j 'k 'l))
        ((= n 6) (se 'm 'n 'o))
        ((= n 7) (se 'p 'q 'r 's))
        ((= n 8) (se 't 'u 'v))
        ((= n 9) (se 'w 'x 'y 'z))
        (else (letters 2))))

(define (prepend-every letter sent)
  (if (empty? sent)
      '()
      (se (word letter (first sent))
          (prepend-every letter (bf sent)))))

(define (prepend-each a b)
  (if (empty? a)
    b
    (se (prepend-each (bf a) b)
        (prepend-every (first a) b))))

(define (phone-spell n)
  (if (= (count n) 1)
    (letters n)
    (se
      (prepend-each (letters (first n))
                    (phone-spell (bf n))))))

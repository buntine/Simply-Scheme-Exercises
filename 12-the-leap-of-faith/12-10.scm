; Write a procedure remove that takes a word and a sentence as arguments and
; returns the same sentence, but with all copies of the given word removed:
;
; > (remove ’the ’(the song love of the loved by the beatles))
; (SONG LOVE OF LOVED BY BEATLES)

(define (remove2 wd sent)
  (if (empty? sent)
    sent
    (se (if (= (first sent) wd)
          '()
          (first sent))
        (remove2 wd (bf sent)))))

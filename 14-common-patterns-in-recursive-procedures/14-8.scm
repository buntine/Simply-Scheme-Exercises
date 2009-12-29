; Write expand, which takes a sentence as its argument. It returns a sentence similar
; to the argument, except that if a number appears in the argument, then the return value
; contains that many copies of the following word:

; > (expand ’(4 calling birds 3 french hens))
; (CALLING CALLING CALLING CALLING BIRDS FRENCH FRENCH FRENCH HENS)

; > (expand ’(the 7 samurai))
; (THE SAMURAI SAMURAI SAMURAI SAMURAI SAMURAI SAMURAI SAMURAI)

; Classification: none, but close to every.

(define (repeat-word times wd)
  (if (= times 0)
    '()
    (se wd (repeat-word (- times 1) wd))))

(define (expand-sent sent)
  (if (empty? sent)
    sent
    (let ((f (first sent))
          (rest (bf sent)))
      (if (and (number? f)
               (> (count sent) 1))
        (se (repeat-word f (first rest))
            (expand-sent (bf rest)))
        (se f (expand-sent rest))))))

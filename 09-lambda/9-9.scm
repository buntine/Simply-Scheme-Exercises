; Write a procedure common-words that takes two sentences as arguments and
; returns a sentence containing only those words that appear both in the first sentence and
; in the second sentence.

(define (common-words senta sentb)
  (keep (lambda (wd) (member? wd sentb)) senta))

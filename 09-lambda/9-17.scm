; Write keep in terms of every and accumulate.

(define (keep pred? sent)
    (accumulate se 
                (every (lambda(x) (if (pred? x) x '()))
                sent)))

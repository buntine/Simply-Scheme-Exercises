; See ./README for introduction and specs.

; Returns the value of the given card.
(define (card-val card)
  (let ((rank (bf card)))
    (cond ((equal? 'j rank) 1)
          ((equal? 'q rank) 2)
          ((equal? 'k rank) 3)
          ((equal? 'a rank) 4)
          (else 0))))

; Calculates the card points in a hand.
(define (high-card-points hand)
  (accumulate + (every card-val hand)))

; Counts the number of cards in hand which are
; of the supplied suit.
(define (count-suit suit hand)
  (count
    (keep (lambda (c)
            (equal? suit (first c))) hand)))

; Returns a list of numbers representing the
; amount of card which satisfy each suit.
(define (suit-counts hand)
  (every (lambda (s)
           (count-suit s hand)) '(s h c d))

; Calculates the number of distribution points 
; for the amount of cards in a particular suit (n).
(define (suit-dist-points n)
  (if (< n 4) (- n 3) 0))

; Returns the total distribution points for the
; supplied hand
(define (hand-dist-points hand)
  (accumulate +
    (every suit-dist-points (suit-counts hand))))

; Returns the total number of points for the given
; hand.
(define (bridge-val hand)
  (+ (high-card-points hand) (hand-dist-points hand)))

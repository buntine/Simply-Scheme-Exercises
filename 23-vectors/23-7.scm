; Could you write vector-filter? How about vector-filter!? Explain the
; issues involved.


; Solution: Yes, you could write "vector-filter". It would return a new vector
;           containing only the items from the original vector which caused the
;           function to return a true value.
;
;           No, you could not write vector-filter! reliably. As far as I know,
;           Scheme does not provide us with the ability to physically mutate a
;           vector in this way (deletion of indexes).

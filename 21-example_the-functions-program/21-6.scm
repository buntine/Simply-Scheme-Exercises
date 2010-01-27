; The assoc procedure might return #f instead of an a-list record. How come it's
; okay for arg-count to take the caddr of assoc's return value if (caddr #f) is an
; error?


; Solution: We consider it okay because the "get-fn" procedure (which contains the assoc)
;           contains several error checking clauses. It's sufficiently robust so by the
;           time we take the caddr of the value, we know it must be valid.

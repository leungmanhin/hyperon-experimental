; Example from OpenCog Classic wiki on PLN Backward Chaining
; No explicit backward chaining is needed

(= (And T T) T)
(= (frog $x)
   (And (croaks $x)
        (eat_flies $x)))
(= (croaks Fritz) T)
(= (eat_flies Fritz) T)
(= (green $x)
   (frog $x))

!(assertEqual
  (green Fritz)
  T)

; This is not just functional programming,
; because we can do inference
(= (ift T $then) $then)
!(assertEqual
  (ift (green $x) $x)
  Fritz)

; We can also use expressions with `=` in `match`
; NOTE: `=` is not an ordinary symbol, and declarative reasoning over expressions
; with it may work differently from that over purely symbolic expressions
!(assertEqualToResult
  (match &self (= ($p Fritz) T) $p)
  (croaks eat_flies))

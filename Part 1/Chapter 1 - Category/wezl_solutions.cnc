(define [comp f g a]: f $g a)
(define [id x]::x)
(define [test fn a]: = (fn a) (fn $id a))

(define [tests fn a IO]
  : dostate \IO  # this is ugly only because I/O is ugly
     (= (:fn a) (comp (id) fn)
       [println! "fn(a) == (id . fn)(a))"]
       :println! "/!\\ fn(a) /= (id . fn)(a)) /!\\")
  : dostate \IO
     (= (:fn a) (comp fn (id))
       [println! "fn(a) == (fn . id)(a))"]
       :println! "/!\\ fn(a) /= (fn . id)(a)) /!\\")
)

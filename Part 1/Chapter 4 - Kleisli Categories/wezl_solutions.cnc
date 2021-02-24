(defstruct \optional {valid value})
(define [nothing] $ make-optional (false) {})
(define [just x] : make-optional (true) x)
(define [return] $ just)

# for pattern matching, but not necessary
(define [apply x]
  : is-optional? x
     [optional-valid x
        [/\value
        : and (is-optional value)
              (optional-valid value)
           [optional-value x (optional-value value)]
        : false]
     : /\value
        : and (is-optional value)
              (not $ optional-valid value)
           [true]
        : false
     ]
  : fallback \apply x)

# now we can pattern match like:
(define [partial-compose a b arg]
  : just \v arg
     [just \v' (:a v)
        [:b b']
     : nothing]
  : nothing)

(define [safe-reciprocal n]
  : 0 n [nothing]
  : / 1 n)

(define [safe-root n]
  : < n 0 [nothing]
  : just (root n))

(define [safe-root-reciprocal]
  $ partial-compose safe-reciprocal safe-root)
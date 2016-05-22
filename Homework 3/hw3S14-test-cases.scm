;;; Assignment 3 Test Cases

(define (sqr n) (* n n))
(define (succ n) (+ n 1))
(define (double m) (* m 2))

(funmap (list sqr succ double (lambda (n) (/ n 3))) 10)
(funmap '() 'xyz)

(let ((f (funcompose (list sqr succ double))))
  (list (f 2) (f 1.5)))

(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define three (lambda (f) (funcompose (list f f f))))
(define four (lambda (f) (funcompose (list f f f f))))

(zero-Church? zero)
(zero-Church? one)
(zero-Church? two)
(zero-Church? three)
(zero-Church? four)

(even-Church? zero)
(even-Church? one)
(even-Church? two)
(even-Church? three)
(even-Church? four)

(define head car)
(define (tail stream) (force (cdr stream)))
(define (slice n stream)
  (if (= n 0) 
      '()
      (cons (head stream)
            (slice (- n 1) (tail stream)))))

(slice 10 Factorials)

(slice 12 (multiples-of 7))

(define (integers-starting-from n)
 (cons n (delay (integers-starting-from (+ n 1)))))
(define Nats (integers-starting-from 0))

(slice 10 (map-stream sqr Nats))
(slice 10 (map-stream (lambda (n) (+ n 1)) (map-stream sqr Nats)))




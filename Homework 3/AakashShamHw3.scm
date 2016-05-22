;;;Aakash Sham
;;;CMPSC 461
;;;Homework 3
;;; 06 Feburary 2014


;;;Funmap

(define (funmap ls x) (if (eq? ls '()) '() 
						(let ((first (car ls))
							   (rest (funmap (cdr ls) x)))
						(append (map first (list x)) rest))))

;;;///
;;;Code I got from class notes
(define (map f xs)
  (if (null? xs) '()
      (cons (f (car xs))  (map f (cdr xs)))))

(define (sqr n) (* n n))
(define (succ n) (+ n 1))
(define (double m) (* m 2))
;;;///

;;;FunCompose

(define (funcompose ls) (if (eq? ls '()) (lambda (x) x)
							(if (eq? (length ls) 1) (lambda (x) ((car ls) x)) 
								(compose (car ls) (funcompose (cdr ls))))))

;;;///
;;;Code I got from class							
(define (compose f g) (lambda (x) (f (g x))))
(define (length xs)
  (if (null? xs) 0 (+ 1 (length (cdr xs)))))
;;;///


;Church Numerals Zero and Even

(define (zero-Church? cn) ((cn (lambda(x) (and #f x))) #t))

;;;//////////////////////////////////////////////////////////////

(define (even-Church? cn) ((cn (lambda(x) (not x))) #t))


;;;///
;;;Church numberals from class notes
(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define three (lambda (f) (funcompose (list f f f))))
(define four (lambda (f) (funcompose (list f f f f))))
;;;///


;;;Factorial and Multiples of

(define Factorials (cons 1 
			       (delay (multiply-streams NatsOne Factorials))))

;;///
;;;Code I got from class for testing
(define head car)
(define (tail stream) (force (cdr stream)))
(define (slice n stream)
  (if (= n 0) '()
      (cons (head stream)
	    (slice (- n 1) (tail stream)))))
(define (integers-starting-from n) (cons n (delay (integers-starting-from (+ n 1)))))
(define Nats (integers-starting-from 0))
(define NatsOne (integers-starting-from 1));;;same as nats, but starts at 1
;;;///

;;;Modified add-streams function from class
;;;Just multiplies 2 streams instead of adding them
(define (multiply-streams s1 s2)
  (let ((h1 (head s1))
	(h2 (head s2)))
    (cons (* h1 h2)
	  (delay (multiply-streams (tail s1) (tail s2))))))



;;///////////////////////////////////////////////////////////////////////////

(define (mult-funct z n) (cons z (delay (mult-funct (+ z n) n))))
(define (multiples-of z) (mult-funct z z))


;Map stream

(define (map-stream f s) (cons (f (head s)) (delay (map-stream f (tail s)))))
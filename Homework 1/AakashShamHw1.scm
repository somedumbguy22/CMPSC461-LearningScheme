;;;Aakash Sham
;;;CMPSC 461
;;;Thursday Jan 23, 2014


;;;Problem 1
;;;Double Factorial Algorithm
(define (double-factorial k) 
	(cond ( (<= k 1) 1) 
		  (#t (if (eq? (even? k) #f) (* k (double-factorial (- k 2)))
				(if (<= k 2) 2 (* k (double-factorial (- k 2))))))))


;;;Problem 2
;;;SuperFactorial
(define (super-factorial n) (super-funct n 1 1 1))

(define (super-funct n k w q) 
	(if (> k n) q (super-funct n (+ k 1) (* k w) (* k (* w q)))))


;;;Problem 3
;;;CoPrime
(define (coprime x y) (if (= 1 (coFunct x y)) #t #f))

(define (coFunct a b) (if (= b 0) a (coFunct b (modulo a b))))



;;;Problem 4
;;; Gaussian Error Function
(define (erf p n) (erfTwo p n 0))
(define (erfTwo x n w) (if (< n 0) (* w (/ 2 (sqrt 3.1415926))) 
	(erfTwo x (- n 1) (+ w (eqq x n)))))
(define (eqq x k) 
	(/ (* (power (- 0 1) k) (power x (+ (* 2 k) 1))) (* (fact k) (+ (* 2 k) 1))))



;;;Problem 5
;;;Pi-Convergence
(define (pi-Convergence e) (piTwo e 0 0 0))
(define (piTwo e k a w) (if (> k 0) (cond ((< e (- (* 2 w) (* 2 a))) 
			(piTwo e (+ k 1) (+ a (eqqPi (- k 1))) (+ w (eqqPi k)))) 
				(#t (- k 2))) (piTwo e (+ k 1) 0 (+ w (eqqPi k)))))


(define (eqqPi k) (/ (fact k) (double-factorial (+ (* 2 k) 1))))




;;;Extra Stuff
(define (fact n) (if (eq? n 0) 1 (* n (fact (- n 1)))))

(define (power m n) (if (eq? n 0) 1 (* m (power m (- n 1)))))
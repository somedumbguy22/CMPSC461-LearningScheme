(take-first 3 '((a b) (c d) (e f) (g h)))
(take-first 10 '((a b) (c d) (e f) (g h)))
(take-first 0 '((a b) (c d) (e f) (g h)))

(skip-first 6 '(2 3 5 7 11 13 15))
(skip-first 20 '(2 3 5 7 11 13 15))
(skip-first 0 '(2 3 5 7 11 13 15))

(palindrome? '(a b b c c b b a))
(palindrome? '(a b b c d c b b a))
(palindrome? '(a b b c d e c b b a))

(distinct? '(99 57 33 61 13 85 11) '(22 8 50 32 96))
(distinct? '(99 57 33 61 13 85 11) '(22 8 50 33 96))
(distinct? '() '(27 45 33))

(better-distinct? '(99 57 33 61 13 85 11) '(22 8 50 32 96))
(better-distinct? '(99 57 33 61 13 85 11) '(22 8 50 33 96))
(better-distinct? '() '(27 45 33))

(powerset '(1 2))
(powerset '(1 2 3))
(powerset '(1 2 3 4))


#let conf(
  title: none,
  course: none,
  name: none,
  student_number: none,
  authors: (),
  doc,
) = {
  set page(
    paper: "a4",
    header: align(
      right + horizon,
      text(course + " - " + student_number)
    ),
  )
  set par(justify: true)
  set text(
    font: "",
    size: 11pt,
  )

  set align(center)
  text(17pt, title)

  grid(
    columns: (1fr),
    row-gutter: 24pt,
    [
      #name \
      #student_number \
    ]
  )

  set align(left)
  line(length: 100%, stroke: rgb(128, 128, 128))
  doc
}


#show: doc => conf(
  title: [Homework 2],
  course: [Calculus 2],
  name: "Manuel Mol",
  student_number: "s3545008",
  doc,
)

#let exersise(title, term) = {
  [
    == #title  
    #term
    \ #line(length: 50%, start: (25%, 0%), stroke: gray)
  ]
}


#exersise("Exercise 1")[
  $ 
  a_1 = 2, a_2 = 1\
  a_1 < a_2\
  "if " a_(n+1) < a_n, "then we have" \ 
  a_(n+2) = 1/(3-a_(n+1)) < 1/(3-a_(n)) = a_(n+1) \
  "So" {a_n} "is decreasing".\

  lim_(a arrow infinity) 1/(3-a) = 0
  $
]

#pagebreak()

#exersise("Exercise 2")[
  a.
  $ 
  sum^infinity_(n=3) ((-9)^n)/11^n &= sum^infinity_(n=3) ((-9)/11)^n \
  S=a/(1-r)," "a=((-9)/11)^3, " "r=(-9)/11\
  S=((-729)/1331)/(1-(-9)/11) = -729/2420
  $
  b.
  $
  sum^infinity_(n=0) 2^n/7^n + 2/6^n = sum^infinity_(n=0) (2/7)^n + sum^infinity_(n=0) 2/6^n \ 
  \
  "First part of formula: " sum^infinity_(n=0) (2/7)^n\
  S=a/(1-r)," "a=1, " "r=2/7\
  1/(1-2/7) = 1/5/7 = 7/5 = 1 3/5\
\
  "Second part of formula: " sum^infinity_(n=0) 2/6^n\
  2/6^n = 2 dot.op 1/6^n = 2(1/6)^n\
  S=a/(1-r)," "a=2, " "r=1/6\
  2/(1-1/6) = 2/5/6 = 12/5 = 2 2/5 \
  "Sum:"\
  1 2/5 + 2 2/5 = 19/5 = 3 4/5
  $
]

#pagebreak()

#exersise("Exercise 3")[
  $
  "First we need to rewrite the formula"\
  1/(n(n+3)) = A/n + B / (n+3)\
  "If" n=0, A = 1/3 "and" B=-1/3 \ 
  1/(n(n+3)) = 1/(3n) - 1/(3(n+3)) \ 
  sum^infinity_(n=1)  1/(n(n+3)) = sum^infinity_(n=1) 1/(3n) - sum^infinity_(n=1) 1/(3(n+3)) \ 
  "If we write out this sum, it looks like this:" \
  1/3{1/1-1/4+1/2-1/5+1/3-1/6+1/4-1/7 +... ... + 1/n - 1/(n+3)} \
  "You can see that from" 1/4 "every term gets cancelled out." \
  = 1/3 (1/1 + 1/2 + 1/3) = 11/18
  $
]

#exersise("Exercise 4")[
  a.
  $
  lim_(n arrow infinity) 2^(n+1) / (7^(n+1)(n+2)) \/ 2^(n) / (7^(n)(n+1))
  &= lim_(n arrow infinity) 2^(n+1) / (7^(n+1)(n+2)) dot.op (7^(n)(n+1)) / 2^(n) \
  &= lim_(n arrow infinity) (2^(n+1)7^(n)(n+1)) / (2^(n) 7^(n+1)(n+2)) \ 
  &= lim_(n arrow infinity) (2(n+1)) / (7(n+2)) \ 
  &= 2/7 lim_(n arrow infinity) (n+1) / (n+2) \ 
  &= 2/7 lim_(n arrow infinity) (1+1/n) / (1+2/n) \ 
  &= 2/7 dot.op 1/1 \ 
  &= 2/7\ 
  2/7 "is between 0 and 1, so this sum converges"
  $
  #pagebreak()
  b.
  $
  lim_(n arrow infinity) 5^(n+1)/((n+1)!) \/ 5^(n)/(n!) &= lim_(n arrow infinity) (5^(n+1)n!)/( 5^(n)(n+1)!) \ 
  &= lim_(n arrow infinity) (5n!)/((n+1)!)\
  &= lim_(n arrow infinity) 5/(n+1) = 0\
  "this sum converges"
  $
  c.
  $
  lim_(n arrow infinity) (3^(n+1))/((n+1)2^(n+1)) \/ 3^n / (n 2^n) 
  &=lim_(n arrow infinity) (3^(n+1) n 2^n)/(3^n (n+1)2^(n+1)) \
  &=lim_(n arrow infinity) (3 n 2^n) / ((n+1) 2^(n+1)) \ 
  &=lim_(n arrow infinity) (3n) / (2(n+1)) \
  &= 3/2 lim_(n arrow infinity) n/(n+1) \ 
  &= 3/2 lim_(n arrow infinity) 1/(1+1/n) \ 
  &= 3/2 dot.op 1/1 \ 
  &= 1 1/2 \ 
  1 1/2 > 1, "so this sum diverges to infinity"
  $ 
  d. 
  $
  lim_(n arrow infinity) ((n+1)^3 +1) / ((n+1)!) \/ (n^3 + 1) / (n!) 
  &= lim_(n arrow infinity) (((n+1)^3 +1) n!) / ((n^3 + 1)(n+1)!) \ 
  &= lim_(n arrow infinity) (n^3 + 3n^2 + 3n + 2) / ((n+1)(n^3+1)) \
  &= lim_(n arrow infinity) (n^3 + 3n^2 + 3n + 2) / (n^4 + n^3 + n + 1) \
  &= lim_(n arrow infinity) (n^3 / n^4 + 3n^2 / n^4 + 3n / n^4 + 2 / n^4) / (1 + n^3 / n^4 + n / n^4 + 1 / n^4) \
  &= (0+0+0+0) / (1+0+0+0) \ 
  &= 0\
  "0 < 1, so this sum converges"
  $
]
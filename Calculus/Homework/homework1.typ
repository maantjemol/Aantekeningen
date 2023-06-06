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
  title: [Homework 1],
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
  a. \
  $
  (1+i)/(2-i) dot.op (3-i)/(1+i) 
  &= ((1+i)(2+i))/((2-i)(2+i)) dot.op ((3-i)(1-i))/((1+i)(1-i)) \
  &= ((2-1)+ (1+2)i) / (2^2 + 1) dot.op ((3-1) + (-3-1)i)/2\
  &= (1+3i)/5 dot.op (2-4i)/2\
  &= (1+3i)/5 dot.op (1-2i)\
  &= ((1+3i)(1-2i))/5 \ 
  &= ((1+6)+(-2+3)i)/5 \ 
  &= (7+i)/5 &= 7/5 + 1/5 i
  $

  b.
  $
  (1+i)^3 + (1-i)^2 
  &= (1+i)(1+i)(1+i) + (1-i)(1-i)\
  &= (2i)(1+i) -2i \
  &= -2 + 2i - 2i\
  &= -2
  $
]

#exersise("Exercise 2")[
  $
  z = 3+4i", " w = 5-12i \ 
  z^2w 
  &= (3+4i)(3+4i)(5-12i) \
  &= ((9-16) + (12+12)i)(5-12i) \
  &= (-7 + 24i)(5-12i) \ 
  &= (-7 dot.op 5) - (24 dot.op -12) + ((-7 dot.op -12) + (24 dot.op 5))i \ 
  &= -35 + 288 + (84 + 120)i \ 
  &= 253 + 204i
  $
]
#pagebreak()


#exersise("Exercise 3")[
  $
  z^2 - sqrt(3)z+1 = 0 "to the form" r(cos(phi.alt) + i sin(phi.alt)) \
  r =  sqrt(1^2 + sqrt(3)^2) = sqrt(4) = 2\
  phi.alt = tan^(-1)((-sqrt(3))/1) = tan^(-1)(-sqrt(3)) = - pi/3 \
  r(cos(phi.alt) + i sin(phi.alt)) = 2 (cos(-pi/3) + sin(-pi/3))
  $
]

#exersise("Exercise 4")[
  $
  x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a)\
  a = 1 "gives"
  x = (-b plus.minus sqrt(b^2 - 4c)) / (2)\
  z = (1 + i) / 2 \ 
  "From this we can say that:" \ 
  -b = 1, sqrt(b^2 - 4c)) = i\
  "From here," b = -1 \ 
  sqrt(b^2 - 4c)) = i "becomes" sqrt((-1)^2 - 4c)) &= sqrt(-1) \ 
  1-4c = -1 \
  -4c = -2 \ 
  c = 1/2", " b = -1 \
  "If we plug " b "and" c "in our original formula we get:" \ 
  x = (-(-1) plus.minus sqrt((-1)^2 - 4 dot.op 1/2)) / (2) = (1 plus.minus i) / (2)\
  "The second root is:"
  (1 minus i) / (2)\
  $
]

#pagebreak()

#exersise("Exercise 5")[
  a.
  $
  "To dertermine if the sequence" a^n &= n/(2^n), n gt.eq 1 "is monotonic, we can determine if" a^(n+1) \ "is always "gt.eq" or "lt.eq" then " a^n.
  "The sequence" a^n "looks like this:"\
  a^n &= {1/2, 1/2, 3/8, 4/16, ...} \ 
  "You can see that the sequence keeps getting smaller. From this we can conclude that " a^n \ "is monotonic, because " a^n gt.eq a^(n+1) \ \
  
  "limit:"\
  $

  $ lim_(n arrow infinity)  n/(2^n) =lim_(n arrow infinity) (n \/ 2^n) / (2^n \/ 2^n) = lim_(n arrow infinity) (n \/ 2^n) / 1 = 0 / 1 = 0 
  $
  b.
  $
  "To dertermine if the sequence" b^n &= sqrt(n^2 + n) - n, n gt.eq 1 "is monotonic, we can determine if"\ b^(n+1) "is always "gt.eq" or "lt.eq" then " b^n.
  "The sequence" b^n "looks like this:"\
  a^n &= {sqrt(2)-1, sqrt(5)-2, sqrt(12)-3, ...} \ 
  "You can see that the sequence keeps getting bigger. From this we can conclude that " a^n \ "is monotonic, because " a^n lt.eq a^(n+1) \ \
  "limit:"
  $

  $
  lim_(n arrow infinity) sqrt(n^2+n)-n &= lim_(n arrow infinity)(sqrt(n^2+n)-n)/1 dot.op (sqrt(n^2+n)+n) / (sqrt(n^2+n)+n) \ 
  &= lim_(n arrow infinity) n / (sqrt(n^2+n)+n) \ 
  & = lim_(n arrow infinity) 1 / (sqrt(1 + 1/n)+1) \
  & = 1 / (sqrt(1 + 0)+1) \
  & = 1/2\
  $
]
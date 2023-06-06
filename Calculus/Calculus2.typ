#align(
  center
)[
= Calculus 2
=== Summary
]
#set heading(numbering: "1.")
#outline(indent: true, depth: 2)

= Complex numbers:
== Definition:
$CC$, a complex number is a number that extends the $RR$eal numbers. It is written in the form:
$ a+b i $
It is formed like this:
$ i^2 &= -1 \
i &= sqrt(-1) $

== Operations with complex numbers
let $ZZ = a + b i " and " WW = c + d i $ \
=== Addition:
$ ZZ + WW = (a+c) + (b+d)i $ 
=== Subtract:
$ ZZ - WW = (a-c) + (b-d)i $

Complex numbers behave like vectors. $ZZ + WW$ cna be written as $ZZ+WW=(a+c, b+d)$ where $ZZ=(a,b)$ and $WW=(c,d)$

=== Multiply:
$ ZZ dot.op WW = (a c-b d)+(a d + b c)i $
Multiply by constant
$ 5 dot.op ZZ = 5a+5b dot.op i $

=== Complex conjugate
Flip the sign of your complex number:
$ macron(ZZ) = a-b i $
You can create a $RR$eal number by multiplying your $ZZ$ with $macron(ZZ)$
$ ZZ dot.op macron(ZZ) = a^2 + b^2 $

=== Divide:\
$ ZZ / WW = (ZZ dot.op macron(WW)) / (WW dot.op macron(WW)) $


#pagebreak()

=== Modulus of a complex number:
$ |ZZ| := sqrt(a^2+b^2) = sqrt(ZZ dot.op macron(ZZ)) $

== Argument:
$ arg(ZZ) = tan^(-1)(b/a) $
The argument is a infinite set of angles, for example: ${pi/2, pi/2 + 2pi, pi/2 + 4pi, ...,pi/2 +s  n pi}$


= Formulas:
$ (a+b i)(a-b i)=a^2+b^2 $
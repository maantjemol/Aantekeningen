// Settings:
#set text(
  font: "Merriweather",
  size: 10pt
)
#show math.equation: set text(size: 12pt)

// Document:

#align(
  center
)[

#text(size: 20pt)[Introduction to Logic]

#line(length: 100%, stroke: gray)
]

= Propositional Logic
== Syntax:
You can make well-formed formulas (*wff*) $phi$ from:
$ p, "a variable"\ bot\ phi and phi\ phi or phi\ phi arrow phi \ (phi)  $
$and$ and $or$ have precedence over $arrow$. This means that the formula \ 
$ r and u arrow w $
is equal to 
$ (r and u) arrow w $ 

From this you can derive:
#align(center)[
#table(
  columns: (auto, auto),
  inset: 8pt,
  align: horizon,
  stroke: gray, 
  [*Connective*], [*Definition*],
  $not phi$, $phi arrow bot$,
  $top$, $not bot$,
  $not phi$, $phi arrow bot$,
  $phi arrow.l.r psi$, $(phi arrow psi) and (psi arrow phi)$,
)
]

#line(length: 100%)
== Subformulas:
let $phi$ be a formula. The set of _subformulas_ of $phi$ is determined like this:
$ phi = not p and q arrow p arrow s \
  "Sub"(phi) &= {phi} union "Sub"(not p) union "Sub"(p arrow s)\
  &= {phi, not p and q, not p, p, bot, q, p arrow s, s}
$
#line(length: 100%)
== Truth table:
To check if a formula is true or false, you can use a truth table: $p or (q arrow p) arrow q arrow p$

#align(center)[
  #image("./bigtruthtable.png", height: 64pt,)
]

#pagebreak()

== Tautologies:
#align(center)[
#table(
  columns: (auto, auto),
  inset: 8pt,
  align: horizon,
  stroke: gray, 
  [*Symbol*], [*Meaning*],
  "PForm", "a set of all formulas",
  $Gamma$, "a set of some formulas",
  $models$, "entails",
  $Gamma models phi$, 
  $
  "A set of formulas entails one formula"\ 
  "for example:"\ 
  { ("human" arrow "mortal"), "human" } models "mortal", \ 
  Gamma = { ("human" arrow "mortal"), "human" } \ 
  phi = "mortal"\
  "From " Gamma "you can draw the conclusion"\
  "that " phi "is true"
  $
)]
\
For some random formulas *$phi$ *and *$psi$*, we can say that:
- *satisfiable*,  $phi$ is _satisfiable_ if there is a way to assign true or false values to each of the variables in $phi$ in such a way that the entire formula becomes true.

- *tautology*, $phi$ is a _tautology_ if $phi$ is always true no matter what variables you use.

- *semantically equivalent*, $phi$ and $psi$ are _semantically equivalent_ if every valuation of $phi$ and $psi$ are the same. This can be written as $phi ident psi$, meaning $phi$ is identical to $psi$.

#line(length: 100%)
== Natural deduction:
#align(center)[
#table(
  columns: (auto, auto),
  inset: 8pt,
  align: horizon,
  stroke: gray, 
  [*Symbol*], [*Meaning*],
  $Gamma tack.r phi$, $phi "can be derived or proved from the set of premises represented by" Gamma$,
)]
=== Rules:
#align(center)[
  #image("./naturaldeduction.png", width: 76%)
]

= TODO, rules uit video hier uitleggen/neerzetten
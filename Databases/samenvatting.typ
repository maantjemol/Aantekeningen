// Settings:
#set text(
  // font: "Merriweather",
  // size: 10pt
)
#show math.equation: set text(size: 12pt)


#align(
  center
)[
#text(size: 20pt)[Databases]
#line(length: 100%, stroke: gray)
]
// Document:

= Relational algebra: 
Operational – step-by-step computation of the
result. Very useful for representing query execution plans.
== Schema & syntax:
#align(center)[
  #image("./images/exampleSailors.png", width: 80%)
]

// == Operators:
== Selection $sigma_c(R)$:
Returns tuples (rows) of relation instance that satisfy
the selection condition, i.e., c(a1, ..., an).
#align(center)[
  #image("./images/ExampleSelection.png", width: 80%)
]

== Projection $pi_(a_1,...,a_n)(R)$:
Deletes fields (columns) that are not in projection list
and then removes duplicate tuples.
#align(center)[
  #image("./images/ExampleProjection.png", width: 80%)
]

#pagebreak()
== Cross-product $R times S$:
Allows us to combine two relations, we cross every row $R$ with every row of $S$. We get $R_"rows" dot.op S_"rows"$
#align(center)[
  #image("./images/ExampleCrossProduct.png", width: 80%)
]

== Renaming $rho_(i_1 arrow a'_i_1,...,i_k arrow a'_i_k)$:
Renames fields using positional notation
#align(center)[
  #image("./images/ExampleRenaming.png", width: 80%)
]


== Difference $R_1 \\ R_2$:
The difference between $R_1$ and $R_2$. 
#align(center)[
  #image("./images/ExampleDifference.png", width: 80%)
]

== Union $R_1 union R_2$:
Returns a combination of $R_1$ and $R_2$

== Intersection $R_1 sect R_2$:
Intersection between 2 relations, meaning the rows both in $R_1$ and $R_2$
$ = R_1 \\ (R_1 \\ R_2) $

== Theta-Join $R join_(c(a_1,...,a_n)) S$
Computes all combinations of tuples from $R$ and $S$ that satisfy condition $c(a_1, ..., a_n)$.
In other words:
$ R join_(c(a_1,...,a_n)) S = sigma_(c(a_1,...,a_n))(R times S) $
#align(center)[
  #image("./images/ExampleJoinComp.png", width: 80%)
]


== Equi-Join $R join_(a_1,...,a_k) S$:
Computes all combinations of tuples from R and S that satisfy condition$R.a_1 = S.a_1, ..., R.a_k = S.a_k$ and deletes duplicate columns (the first occurrence is kept):
$ R join_(a_1,...,a_k) S = sigma_(R.a_1 = S.a_1,...,R.a_k = S.a_k)(R times S) $

== Natural Join $R join S$:
Computes equi-join on all common attributes of $R$ and $S$. Columns with same name of associate relations will appear once only once (first occurrence in the positional notation).
#align(center)[
  #image("./images/ExampleJoinNatural.png", width: 70%)
]


#pagebreak()

== Division $R \/ S$:
Find tuples in X that are related to all tuples in Y.\ 
For all relations $S$ and $R$ it holds $(S times R)\/R = S$.
#align(center)[
  #image("./images/ExampleDivision.png", width: 80%)
]

= Schema Refinement and Normal Forms
#align(center)[
  #image("./images/ExampleDecomposition.png", width: 80%)
]

== Functional dependence's:
Given 2 tuples in $r$, if the value $X$ agrees, then $Y$ must also agree. For example the *rating* of an employee that *determines* the *hourly wage*. You write this as:
$ R arrow W $
Where $R$ is the *rating* and $W$ is the *wage*. \
This dependency *brings some problems* with it:
- What if we want to update the wage for everyone
- What happens when we insert an employee and don't know the wages for his rating
- If we delete all employees with rating 5, we loose all information for rating 5
To solve this we can use decomposition. *We put the wages and ratings in another table*. You can often refine a table to remove redundancy. For example: \
Employees work in an department. All employees have a attribute named parking. Parking is shared between departments. It is better to move parking attribute to the departments.

#pagebreak()
== Armstrong's Axioms:
=== *Reflexivity* (Axiom of reflexivity):
If you have a set of attributes $A$, then $A arrow A$.

Example: Suppose we have a table called "*Employees*" with attributes (columns) such as *EmployeeID*, *Name*, and *Department*. If we know that *EmployeeID* *determines* *EmployeeID* (which is always true since it is the primary key), we can say that *EmployeeID $arrow$ EmployeeID* is a functional dependency.

=== *Augmentation* (Axiom of augmentation):
If $A arrow B$, then $A C arrow B C$ for any attribute $C$.

Example: Continuing with the "Employees" table, if we know that *EmployeeID determines Name*, we can use the axiom of augmentation to infer that *EmployeeID also determines both Name and Department*. So, we can say that EmployeeID $arrow$ Name and EmployeeID $arrow$ Department are functional dependencies.

=== *Transitivity* (Axiom of transitivity):
If $A arrow B$ and $B arrow C$, then $A arrow C$.

Example: Consider a table called *"Courses" with attributes CourseID, Instructor, and Department*. If we know that *CourseID determines Instructor* (each course is taught by a specific instructor), and *Instructor determines Department* (an instructor belongs to a specific department), we can apply the axiom of transitivity to conclude that *CourseID determines Department*. Therefore, we have CourseID $arrow$ Department as a functional dependency.

=== Union:
If $X arrow Y $ and $X arrow Z$, then $X arrow Y Z$

=== Decomposition:
If $X arrow Y Z$, then $X arrow Y$ and $X arrow Z$

== Key and superkey
A superkey is a *set of attributes that uniquely identifies a record* in a table, while a minimal key is a *superkey that contains the smallest possible number of attributes* needed to uniquely identify a record.

=== Right-hand side rule:
The following functional dependencies (FDs) exist: \ 
- OrderID $->$ CustomerID, ProductID, OrderDate
- CustomerID $->$ OrderDate
The right-hand side rule states that if an attribute never appears on the right-hand side of any FD in a table, then that attribute must be present in every key of the table.

In other words, in order to uniquely identify a record in the "Orders" table, we must include the attribute "OrderID" in every key. For instance, a key could be composed of {OrderID, CustomerID} or {OrderID, ProductID}, among other possibilities.

#pagebreak()
=== Left-hand side rule:
Let's say we have the following functional dependencies:

- EmployeeID $->$ Name
- EmployeeID $->$ Department
- Department $->$ Salary

In our example, the attribute "Salary" never appears on the left-hand side of any functional dependency but appears on the right-hand side of the dependency Department $->$ Salary. According to the left-hand side rule, we can conclude that "Salary" does not belong to any key of the "Employees" table.

This means that "Salary" is not necessary to uniquely identify a record in the table. It implies that two employees with the same EmployeeID, Name, and Department can have different salaries. Therefore, "Salary" is not a part of the key attributes for the "Employees" table.

=== Starting from small attribute sets:
Starting with small attribute sets (minimal keys) and excluding their proper supersets when searching for keys. This approach helps streamline the search process and ensures that we identify only the minimal keys that uniquely identify records in a table.

== Normal Forms
=== Third normal form:
Every non-key attribute should dependent on the key, the whole key, and nothing but the key.

== Decomposition:
Suppose we have a relation $R$ with some attributes. A decomposition of $R$ consists of two or more relations such that:
- Each new relation scheme contains a subset of the attributes of $R$
- Together the relations include all attributes in $R$

=== Example:
${A B, B C D, C D}$ is a decomposition of $A B C D$, but ${A B, B C}$ is not because it does not include $D$. 


#pagebreak()
#align(center)[
  = Handy shit:
]
== Check if R is in 3NF:
$R = {A, B, C, D, E} \ 
A arrow B \ 
B C arrow E \ 
E D arrow A
$\
Check if the letters in the right side are in the left side. Here, $B, E$ and $A$ are all in the left side so 3NF

== Check if R is in BCNF:
$R = {A, B, C, D, E} \ 
A arrow B \ 
B C arrow E \ 
E D arrow A
$\
Check if the left side is a *Superkey*, meaning left should reach everything that is in R. For example $E D C$ is a superkey, because $E D -> A$, and $A -> B$ meaning you can reach everything from $E D C$. 

== Decompose into BCNF:
First check if $R$ is in BCNF. If it is not follow these steps:
1. Take all the dependence's that are not *Superkeys* of $R$ and choose one.
2. Split the tree into the dependence and $R - $ the dependency. See the tree structure below:
#align(center)[
  #image("./images/ExampleTree.png", width: 70%)
]
3. Check if the branches are in BCNF, if not, repeat. Also check if dependencies are lost. If so, add these as new relations. For example: 
$ A -> B C "becomes the relation" A B C $
If these are not in BCNF you are pretty much fucked and BCNF is not possible.

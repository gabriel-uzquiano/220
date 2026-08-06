---
title: models
author: Gabriel Uzquiano
description: |
  Models

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# models

We now set out to interpret the language of quantificational logic. Recall that we used truth tables to test the validity of arguments formulated in the language of propositional logic. We will now use *models* to test the validity of arguments formulated in quantificational logic. To that purpose, we will now explain what is a model for quantificational logic and what it takes for a formula of the language to be true at a model.

Definition

:	A *model* for quantificational logic consists of three main ingredients:

1. a *domain* of discourse over which the quantifiers range
2. a *denotation* for each constant of the language
3. an *extension* for each predicate of the language. Now:
   - for a *one-place* predicate, an extension is a list of items in the domain to which it applies.
   - for a *two-place* predicate, an extension is a list of *ordered pairs* of items in the domain to which it applies in that order.
   - for a *three*-place predicate, an extension is a list of *ordered triples* of items in the domain to which it applies in that order
   - Etc



### how to specify a model

We use models to interpret some formulas of quantificational logic. We may, for example, be interested in the question of whether there is an interpretation of the formulas below on which they all come out true:

1. $Raa$
2. $Qa \to Pa$
3. $Rab$

Now, to specify a model, we provide a domain and an interpretation of the constants and predicates of the language.

1. A *domain*:	

   LA, SD, SF

2. A *denotation* for each constant:

   $a$:	LA

   $b$:	SD

3. An *extension* for each predicate:

   $P \_$:	LA, SD

   $Q \_$:	SF

   $R$ \_ \_:	[LA, LA], [LA, SD], [SD, SD]

We will eventually ask whether each of the formulas are true or false *in the model*, e.g., $Rab$ is true in the model because the denotation of $a$, namely, LA, is related to the denotation of $b$, namely, SD, by the interpretation of $R$ in the model.

### models in carnap

Carnap requires you to use numbers to specify the domain, denotations and extensions of constants and predicates respectively. 

Example

:	Consider the formulas of quantifional logic given below:

1. $Raa$
2. $Qa \to Pa$
3. $Rab$​

Here is how to specify a model in Carnap.

```{.CounterModeler .Simple system="gamutND" submission="none"}
1. Pa, Qa -> Pa, Rab
|Domain : 0, 1, 2
|P(_) : 1, 2
|Q(_) : 2
|R(_,_) : [1, 1], [1,2]
|a : 1
|b : 2
```

Alternatively:

```{.CounterModeler .Simple system="gamutND" submission="none"}
1.a. Pa, Qa -> Pa, Rab
```

Example

:	Find a model that verifies the formulas given below:

1. $Rab \wedge \neg Rba$
2. $Pa \wedge \neg Rac$
3. $Qa \to Rac$

```{.CounterModeler .Simple system="gamutND" submission="none"}
2. Rab /\ -Rba, Pa /\ -Rac, Qa -> Rac
|Domain : 0, 1, 2
|P(_) : 0
|Q(_) : 1
|R(_,_) : [0, 1]
|a : 0
|b : 1
|c : 2
```

For another example:

```{.CounterModeler .Simple system="gamutND" submission="none"}
2.a. Rab /\ -Rba, Pa /\ -Rac, Qa -> Rac
```



Or, alternatively, we may use models in Carnap to check that an argument given in quantificational logic is not valid.

Example

:	Find a model on which the premises of the following argument are true and the conclusion false:

1. $Pa \vee Pb$
2. $Qa$
3. $Pb \wedge Qa$
4. $Pa$

```{.CounterModeler .Validity system="gamutND" submission="none"}
3. Pa \/ Pb, Qa, Pb /\ Qa :|-: Pa
```

Now, we find another:

```{.CounterModeler .Validity system="gamutND" submission="none"}
3.a. Pa \/ Pb, Qa, Pb /\ Qa :|-: Pa
```



Example

:	Find a model on which the premises of the following argument are true and the conclusion false:

1. $Pa \to Rab$
2. $Rab \to (Raa \vee \neg Rba)$
3. $Rba$
4. $\neg Pa$

```{.CounterModeler .Validity system="gamutND" submission="none"}
4. Pa -> Rab, Rab -> (Raa \/ -Rba), Rba :|-: -Pa
```

```{.CounterModeler .Validity system="gamutND" submission="none"}
4.a. Pa -> Rab, Rab -> (Raa \/ -Rba), Rba :|-: -Pa
```



### diagrams

One more alternative is to make use of a diagram in order to specify a model.

Example

:	Consider the formulas of quantifional logic:

1. $Pa$
2. $Qa \to Pa$
3. $Rab$​

![](diagram model.png)

**Diagram Key**:

1. Domain:

    $p_1$, $p_2$

2. Denotations for each constant:
   $a$: $p_1$

   $b$: $p_1$

3. Extensions for each predicate:

   $P( \_ )$: __ is enclosed in a circle

   $Q(\_):$ __ is enclosed in a grey figure

   $R(\_,\_):$ __ points to __

Carnap models and diagrams are helpful heuristics, but they have limitations, since some models, e.g., models with an infinite domain, are much too complex to be represented by means of a finite diagram. The method will, however, suffice for *some* purposes; it will enable us to establish the invalidity of a broad family of arguments in quantificational logic.

## truth in a model

We eventually want to explain what is for a sentence to be true in a model, but we will proceed in steps:

1. We will explain what is for a formula, whether open or closed, to be true in a model *relative to an assignment of values to the variables*.

2. We will then explain what is for a *closed* formula to be true in a model.


### variable assignments

Definition

:	A *variable assignment* $\alpha$ over a model $M$ is a map from variables to items in the domain of the model.

Example

:	If the domain of a model $M$ consists of the numbers $0, 1, 2, 3, 4$​​​, then a variable assignment maps all the variables of the language to numbers in the domain.

$\alpha$

<table>
  <tr>
    <th> $x$</th>
    <th> $y$</th>
    <th> $z$</th>
    <th> $x_1$</th>
    <th> $y_2$</th>
    <th> $z_3$</th>
    <th> $\dots$</th>
  </tr>
  <tr>
    <th> 1</th>
    <th> 2</th>
    <th> 3</th>
    <th> 1</th>
    <th> 0</th>
    <th> 3</th>
    <th> $\dots$</th>
  </tr>
</table>

​	

If, however, the domain  of another model consists of points $p_1, p_2, p_3$, then a variable assignment will map all the variables of the language. to points in the domain.

​	$\beta$	

<table>
  <tr>
    <th> $x$</th>
    <th> $y$</th>
    <th> $z$</th>
    <th> $x_1$</th>
    <th> $y_2$</th>
    <th> $z_3$</th>
    <th> $\dots$</th>
  </tr>
  <tr>
    <th> $p_1$</th>
    <th> $p_1$</th>
    <th> $p_2$</th>
    <th> $p_3$</th>
    <th> $p_1$</th>
    <th> $p_2$</th>
    <th> $\dots$</th>
  </tr>
</table>	



Given a model $M$ and a variable assignment $\alpha$ for $M$, we will often speak of the value of a variable $x$ in the model $M$ *relative to assignment* $\alpha$. This is just the object $\alpha$ assigns to the variable $x$.

We have defined a variable assignment over a model as a map from variables to items in the domain of the model. We now explain what is for a formula, whether open or closed, to be true at a model under an assignment.

## truth in a model under an assignment

We proceed in stages. That is, we explain what is for a formula of each type to be true in a model under an assignment. 

### atomic formulas

Definition

:	If $P\tau_1 \dots \tau_n$ is an atomic formula, then $P\tau_1 \dots \tau_n$ is true in a model $M$ under an assignment $\alpha$ iff the denotations of the constants and the values of the variables in $\tau_1 \dots \tau_n$ under $\alpha$ fall under the interpretation of $P$ in the model.

Example

:	Let $M$ and $\alpha$ be as described:

```{.CounterModeler .Simple system="gamutND" submission="none"}
1. Pa, Qabc, Rab
|Domain : 0, 1, 2
|P(_) : 0
|Q(_,_,_) : [0,1,2], [2, 1, 0]
|R(_,_) :[0,1], [1,2]
|a: 0
|b: 1
|c: 2
```

$\alpha$ is an assignment on which:

<table>
  <tr>
    <th> $x$</th>
    <th> $y$</th>
    <th> $z$</th>
    <th> $x_1$</th>
    <th> $y_2$</th>
    <th> $z_3$</th>
    <th> $\dots$</th>
  </tr>
  <tr>
    <th> 1</th>
    <th> 0</th>
    <th> 2</th>
    <th> 1</th>
    <th> 0</th>
    <th> 2</th>
    <th> $\dots$</th>
  </tr>
</table>


We now check the truth value of different open formulas under the assignment:

$Py$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
1.a. true or false under the assignment?
| *true, since 0 falls under the interpretation of P.
| not true, since 0 does not fall under the interpretation of P
```

$Qayx$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
1.b. true or false under the assignment?
|true, since [0,0,1] falls under the interpretation of R.
|*not true, since [0,0,1] does not fall under the interpretation of Q
```

$Ryb$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
1.c. true or false under the assignment?
|*true, since [0,1] falls under the interpretation of R.
|not true, since [0,1] does not fall under the interpretation of R.
```

$Qaxz$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
1.d. true or false under the assignment?
|*true, since [0,1,2] falls under the interpretation of R.
|not true, since [0,1,2] does not fall under the interpretation of Q
```

$Rxz$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
1.e. true or false under the assignment?
|*true, since [1,2] falls under the interpretation of R.
|not true, since [1,2] does not fall under the interpretation of R.
```


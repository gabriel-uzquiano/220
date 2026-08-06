---
title: "models"
author: Gabriel Uzquiano
description: |
  truth in a model

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

## 

What is for a formula, whether open or closed, to be true at a model under an assignment?

## truth in a model under an assignment

We proceed in stages. That is, we explain what is for a formula of each type to be true in a model under an assignment. 

### atomic formulas

Definition

:	An atomic formula $P\tau_1 \dots \tau_n$ is true in a model $M$ under $\alpha$ iff the denotations of the constants and the values of the variables in $\tau_1 \dots \tau_n$ under $\alpha$ fall under $P$ in the model.

Example

:	Let $M$ and $\alpha$ be as described:

```{.CounterModeler .Simple system="gamutND" submission="none"}
1. Pa, Rbc, Rab
|Domain : 0, 1, 2
|P(_) : 0
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


$Py$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
1.a. true or false under the assignment?
| *true, since 0 falls under the interpretation of P.
| not true, since 0 does not fall under the interpretation of P
```

$Ryb$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
1.b. true or false under the assignment?
|*true, since [0,1] falls under the interpretation of R.
|not true, since [0,1] does not fall under the interpretation of R.
```



### negations and conjunctions

Definition

:	A negation $\neg \varphi$ is true in $M$ under $\alpha$ iff $\varphi$ is not true in $M$ under $\alpha$.

:	A conjunction $(\varphi \wedge \psi)$ is  true in $M$ under $\alpha$ iff $\varphi$ is true in $M$ under $\alpha$ and $\psi$ is true in $M$ under $\alpha$.

Example

:	Let $M$ and $\alpha$ be as described:

```{.CounterModeler .Simple system="gamutND" submission="none"}
2. Pa, Rbc, Rab
|Domain : 0, 1, 2
|P(_) : 0
|R(_,_) :[0,1], [1,2]
|a: 0
|b: 1
|c: 2
```

$\alpha$​ is an assignment on which:

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



$\neg Rxy$​

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
2.a. true or false under the assignment?
|*true, since Rxy is not true relative to the assignment.
|not true, since Rxy is true relative to the assignment.
```

To check the truth value of $Rxy$​ in the model under that assignment, we note that $[1,0]$ is not in the list of pairs to which $R$ applies.

$(Py \wedge Rxc)$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
2.b. true or false under the assignment?
|*true, since Py and Rxc are each true relative to the assignment.
|not true, since at least one of Py and Rxc is not true relative to the assignment.
```

We need only check the truth value of each $Py$ and $Qxyx$ in the model under that assignment.

### disjunctions and conditionals

Definition

:	A disjunction $(\varphi \vee \psi)$ is true in $M$ under $\alpha$ iff $\varphi$ is true in $M$ relative to $\alpha$ or $\psi$ is true in $M$ relative to $\alpha$.

:	A conditional $(\varphi \to \psi)$ is  true in $M$ under $\alpha$ iff $\varphi$ is not true in $M$ relative to $\alpha$ or $\psi$ is true in $M$ relative to $\alpha$.

Example

:	Let $M$ and $\alpha$ be as described:

```{.CounterModeler .Simple system="gamutND" submission="none"}
3. Pa, Rbc, Rab
|Domain : 0, 1, 2
|P(_) : 0
|R(_,_) :[0,1], [1,2]
|a: 0
|b: 1
|c: 2
```

$\alpha$​ is an assignment on which:

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


$(Rxx \vee Rax)$​

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
3.a. true or false under the assignment?
|*true, since at least one of Rxx and Rax is true relative to the assignment.
|not true, since neither Rxx nor Rax are true relative to the assignment.
```

$(Rxy \to Rxx)$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
3.b. true or false under the assignment?
|*true, since Rxy is false under the assignment or Rxx is true under the assignment.
|not true, since Rxy is true under the assignment and Rax is not true under the assignment.
```

We need only check the truth value of each $Py$ and $Qxyx$ in the model relative to that assignment.

### quantification

We now look at quantified formulas of the form $\exists v \varphi$ and $\forall v \varphi$ in turn.

Definition

:	An assignment $\beta$ over a model $M$ is a $v$-variant of an assignment $\alpha$ iff $\beta$ differs from $\alpha$ *at most* with respect to the value it assigns to $v$.

Definition

:	An existential quantification $\exists v \varphi$ is  true in $M$ under $\alpha$ iff $\varphi$ is true in $M$ under some $v$-variant of $\alpha$.

$\exists v \varphi$ is true in $M$ under $\alpha$ if there is something in the domain we can assign to $v$ to make $\varphi$ true in the model *while leaving $\alpha$ otherwise unchanged*.

Example

:	Let $\alpha$ an assignment over a model $M$​ on which:

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

An assignment $\beta$ just like $\alpha$ except for the fact that $\beta$ assigns $2$ to $x$ would be a $x$-variant of $\alpha$, e.g.,

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
    <th> 2</th>
    <th> 0</th>
    <th> 2</th>
    <th> 1</th>
    <th> 0</th>
    <th> 2</th>
    <th> $\dots$</th>
  </tr>
</table>



Example

:	Let $M$ and $\alpha$ be as described:

```{.CounterModeler .Simple system="gamutND" submission="none"}
3. Pa, Rbc, Rab
|Domain : 0, 1, 2
|P(_) : 0
|R(_,_) :[0,1], [1,2]
|a: 0
|b: 1
|c: 2
```

$\alpha$​ is an assignment on which:

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


$\exists x Px$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
4.a. true or false under the assignment?
|*true, since Px is true under a x-variant of the assignment.
|not true, since there is no x-variant of the assignment under which Px comes out true
```

$Px$ is true when we assign $0$ to $x$ and leave the assignment unchanged everywhere else.

$\exists z (Pz \wedge \neg Rzz)$​

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
4.b. true or false under the assignment?
|*true, since the conjunction is true under a z-variant of the assignment.
|not true, since there is no z-variant of the assignment on which the conjunction comes out true
```

Consider a $z$-variant of $\alpha$ on which we assign $0$ to $z$ and leave the assignment unchanged everywhere else.

Definition

:	A universal quantification $\forall v \varphi$ is  true in $M$ relative to $\alpha$ iff $\varphi$ is true in $M$ under every $v$-variant of $\alpha$.

$\forall v \varphi$ is true in $M$ under $\alpha$ if $\varphi$ remains true in the model under the assignment no matter what we may assign to $v$ *while leaving $\alpha$ otherwise unchanged*.

Example

:	Let $M$ and $\alpha$ be as described:

```{.CounterModeler .Simple system="gamutND" submission="none"}
3. Pa, Qabc, Rab
|Domain : 0, 1, 2
|P(_) : 0
|R(_,_) :[0,1], [1,2]
|a: 0
|b: 1
|c: 2
```

$\alpha$​ is an assignment on which:

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



$\forall x Px$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
5.a. true or false under the assignment?
|true, since Px is true under every x-variant of the assignment.
|*not true, since there are x-variants of the assignment under which Px comes out false.
```

$Px$ is not true when we assign $1$ to $x$ and leave the assignment unchanged everywhere else.

$\forall x (Px \to \neg Rxx)$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
5.b. true or false under the assignment?
|*true, since the conditional is true under every x-variant of the assignment.
|not true, since there are x-variants of the assignment under which the conditional comes out false.
```

There are three cases to consider:

$(Px \to \neg Rxx)$ 

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
5.b.1. true or false under a x-variant assigning 0 to x?
|*true, since the consequent is true under that assignment.
| not true, since the antecedent is true and the consequent is false under that assignment.
```

$(Px \to \neg Rxx)$ 

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
5.b.1. true or false under a x-variant assigning 1 to x?
|*true, since the antecedent is false under that assignment.
|not true, since the antecedent is true and the consequent is false under that assignment.
```

$(Px \to \neg Rxx)$ 

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
5.b.1. true or false under a x-variant assigning 2 to x?
|*true, since the antecedent is false under that assignment.
|not true, since the antecedent is true and the consequent is false under that assignment.
```

# truth in a model

We now explain what is for a formula to be true in a model.

Definition

:	A formula $\varphi$ is *true in a model* $M$ iff $\varphi$ is true in $M$ under *every assignment*.

Example

:	Let $M$ be a model as described. 

```{.CounterModeler .Simple system="gamutND" submission="none"}
1. Ex Px, Ax Ey Rxy
|Domain : 0, 1, 2
|P(_) : 0
|R(_,_) :[0,1], [1,2], [2,0]
|a: 0
|b: 1
|c: 2
```

$\exists x Px$ says that *something is P*, and when we look at the domain of the model, we find that at least one thing in the domain is in the list for $P$, namely, $0$.

More formally, $\exists x Px$ is true in the model $M$ because $\exists x Px$ is true in the model under every assignment. If $\alpha$ is an assignment over $M$, then $Px$ is true under a $x$-variant of $\alpha$ on which $x$ is assigned $0$.

Notice that $\forall x \exists y Rxy$ says that *every thing* $x$ in the domain is related to *some thing* $y$ in the domain --- that is, *everything* in the domain is related to *something*. That is true of each of the objects in the domain: $0$ is related to $1$, $1$ is related to $2$, and $2$ is related to $0$.

More formally, $\forall x \exists y Rxy$ is true in the model $M$ because $\forall x \exists y Rxy$ is true in the model under every assignment. If $\alpha$ is an assignment over $M$, then no matter what $\alpha$ assigns to $x$, $\exists y Rxy$ is true under under $\alpha$. This is because there is a $y$-variant of $\alpha$ under which $Rxy$ is true. (Which $y$-variant it is depends on what is the value of $x$ under $\alpha$.)



# logical truth, equivalence, and validity

Definition

:	A formula $\varphi$ is *true in a model* $M$ iff $\varphi$ is true in $M$ under every assignment.

Example

:	Let $M$ be a model as described. 

```{.CounterModeler .Simple system="gamutND" submission="none"}
1. Ex Px, Ax Ey Rxy
|Domain : 0, 1, 2
|P(_) : 0
|R(_,_) :[0,1], [1,2], [2,0]
|a: 0
|b: 1
|c: 2
```

$\exists x Px$ is true in the model $M$ because $\exists x Px$ is true in the model under every assignment. 

$\forall x \exists y Rxy$ is true in the model $M$ because $\forall x \exists y Rxy$ is true in the model under every assignment. 

## logical truth

Definition

:	A formula is a *logical truth* iff there is no model in which it is ever false.

Example

:	$Pa \to \exists x Px$​ is a logical truth.

No model of quantificational logic will ever falsify that formula. Once we specify a domain and a denotation for the constant $a$, we find that no matter how we interpret $P$, will either make $Pa$ false or we will make $\exists x Px$ true. Either way, the formula will come out true in the model.

We cannot establish the logical truth of a formula through a survey of every model for the language of quantificational logic, since there is an infinity of them. On the other hand, we need only provide one model to refute the claim that a given formula is a logical truth.

Example

:	The formula $\exists x Px \to Pa$ is *not* a logical truth.

```{.CounterModeler .Simple counterexample-to="tautology" system="gamutND" submission="none"}
2. ExPx -> Pa
|Domain:0,1
|P(_) : 1
|a:0
```

The model verifies $\exists x Px$ but not $Pa$, which means that $\exists x Px \to Pa$​ is false in the model.

## equivalence

Definition

:	Two formulas are *equivalent* iff they are true in exactly the same models.

Example

:	The formulas $\forall x Px$ and $\neg \exists x \neg Px$ are equivalent.

No model of quantificational logic will ever verify one formula without the other. Once we specify the domain of a model and the interpretation of $P$, we will find that either something in the domain does not fall under $P$ in which case both formulas would be false or else everything in the domain falls under $P$ in which case both formulas would be true.

We need only provide a model as a witness to the non-equivalence of two formulas.

Example

:	The formulas $\exists x Px \wedge \exists x Qx$ and $\exists x (Px \wedge Qx)$ are *not* equivalent.

```{.CounterModeler .Simple counterexample-to="equivalence" system="gamutND" submission="none"}
3. Ex Px /\ Ex Qx, Ex (Px /\ Qx)
|Domain : 0,1
|P(_) : 0
|Q(_) : 1
```

No matter what we assign to the variables, the model will verify the first formula (as something in the domain is $P$ and something is $Q$) but not the second (as nothing in the domain is *both* $P$ and $Q$​).

Example

:	The formulas $\exists x \forall y Rxy$ and $\forall x \exists y Rxy$ are *not* equivalent.

```{.CounterModeler .Simple counterexample-to="equivalence" system="gamutND" submission="none"}
4. ExAyRxy, AxEyRxy
|Domain : 0, 1
```

One formula requires something to relate to everything in the domain, whereas the other merely requires that everything be related to something in the domain.

## consistency

Definition

:	A set of formulas of quantificational logic is *consistent* iff there is at least one model in which they are all true. Otherwise, the set is *inconsistent*.

Example

:	The set consisting of $\exists x Px, \exists x Qx$, and $\neg \exists x (Px \wedge Qx)$ is consistent.

The model we used above is one in which all three formulas come out true.

Example

:	The set consisting of $Rab, Pa, Qb, \exists x (Px \wedge Qx)$ is consistent.

```{.CounterModeler .Simple system="gamutND" submission="none"}
5. Rab, Pa, Qb, Ex (Px/\Qx)
|Domain : 0,1
|P(_) : 0
|Q(_) : 0, 1
|R(_,_): [0,1]
|a:0
|b:1
```

## validity

Definition

:	An argument is *valid* iff there is no model in which the premises are true and the conclusion false.

Example

:	The argument given below is valid:

1. $\forall x (Px \to Qx)$
2. $Pa$
3. $Qa$

There is *no* model in which the premises are true and the conclusion false. If $M$ is a model, then the denotation of $a$ in the model will fall under the interpretation of $P$ if the second premise is true. On the other hand, the truth of the first premise requires everything in the interpretation of $P$ to be in the interpretation of $Q$, which means, however, that the denotation of $a$ falls under the interpretation of $Q$. So, the conclusion must be true in the model if the first two premises are true there.

To establish the invalidity of an argument, we must specify a model in which the premises are true and the conclusion is false.

Example

:	The argument given below is invalid:

1. $\neg \forall x (Px \to Rxa)$
2. $Pb \wedge Rba$
3. $Rbc$

```{.CounterModeler .Validity system="gamutND" options="turnstilemark double-turnstile exam check"submission="none"}
6. -Ax(Px->Rxa), Pb /\Rba :|-: Rbc
|Domain : 0,1
|P(_) : 0, 1
|R(_,_): [0,1],[1,0]
|a:0
|b:1
|c:1
```

Example

:	The argument given below is invalid:

1. $\forall x \exists y Rxy$
2. $\forall x \exists y Ryx$
3. $\forall x \forall y Rxy$

```{.CounterModeler .Validity system="gamutND" options="turnstilemark double-turnstile exam check"submission="none"}
7. Ax Ey Rxy, Ax Ey Ryx :|-: Ax Ay Rxy
|Domain : 0,1,2
|R(_,_): [0,1],[1,2],[2,0]

```



The use of models to establish the invalidity of an argument in quantificational logic will help us determine the invalidity of many natural language arguments.

Definition

:	A natural language argument is *quantificationally valid* if, and only if, it translates into a valid argument of quantificational logic.

Example

:	Consider the following natural language argument:

1. Aristotle follows someone who follows Socrates.
2. Every follower of Socrates is a follower of Plato.
3. So, Aristotle follows Plato.

We will translate the argument into the language of quantificational logic with the help of a translation key.

**Translation Key**

$R(\_,\_)$:	__ follows __

​	$a$:	Aristotle

​	$b$:	Socrates

​	$c$:	Plato

```{.Translate .FOL system="gamutND" submission="none"}
8. Ex(Rax /\ Rxb) : Aristotle follows someone who follows Socrates
|Ex(Rax /\ Rxb)
```

```{.Translate .FOL system="gamutND" submission="none"}
9. Ax(Rxb -> Rxc) : Every follower of Socrates is a follower of Plato
|Ax(Rxb -> Rxc)
```

```{.Translate .FOL system="gamutND" submission="none"}
10. Rac : Aristotle follows Plato
|Rac
```

The translation of the original argument into quantificational logic is *invalid* because there is a model on which both premises come out true and the conclusion comes out false.



1. $\exists x (Rax \wedge Rxb)$
2. $\forall x (Rxb \to Rxc)$
3. $Rac$

```{.CounterModeler .Validity system="gamutND" options="turnstilemark double-turnstile exam check"submission="none"}
11. Ex(Rax /\ Rxb), Ax(Rxb -> Rxc) :|-: Rac
|Domain : 0,1,2,3
|R(_,_): [0,1],[1,2],[1,3]
|a:0
|b:2
|c:3
```

Example

:	Consider the following natural language argument:

1. Everything has a cause.
2. Only a deity can be a cause of everything.
3. So, something is a deity.

We will translate the argument into the language of quantificational logic with the help of a translation key.

**Translation Key**

$R(\_,\_)$:	__ causes __

$P(\_)$:	__ is a deity



```{.Translate .FOL system="gamutND" submission="none"}
12. AxEyRxy : Everything has a cause.
|AxEyRxy
```

```{.Translate .FOL system="gamutND" submission="none"}
13. Ax(AyRxy -> Px) : Only a deity can be a cause of everything.
|Ax(AyRxy -> Px)
```

```{.Translate .FOL system="gamutND" submission="none"}
14. Ex Px : Something is a deity.
|Ex Px
```

The translation of the original argument into quantificational logic is *invalid* because there is a model on which both premises come out true and the conclusion comes out false.

1. $\forall x \exists y Rxy$
2. $\forall x (\forall y Rxy \to Px)$
3. $\exists x Px$

```{.CounterModeler .Validity system="gamutND" options="turnstilemark double-turnstile exam check"submission="none"}
15. AxEyRxy, Ax(AyRxy -> Px) :|-: Ex Px
|Domain : 0,1
|R(_,_): [0,1],[1,0]
|P(_): 
```


---
title: "logical truth, equivalence, and validity"
author: Gabriel Uzquiano
description: |
  Validity

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



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


---
title: natural deduction continued
author: Gabriel Uzquiano
description: |
  validity in quantificational logic with identity

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---

# quantificational logic with identity

We have expanded the language of quantificational logic with identity, but we now need to explain how to supplement the rules of the natural deduction system in order to accommodate formulas of the expanded argument. Once we do that, we will be in a position to assess a larger class of natural language arguments.

### translation

We may now translate from English into the language of quantificational logic with identity. We will use the identity symbol to translate both explicit and less overt talk of numerical identity.

**Translation Key**

Domain:	People

$P \_$:	__ is Greek

$R \_,\_$:	__ can defeat  __

​	$a$:	Achilles

​	$b$:	Hector

```{.Translate .FOL system="gamutND" submission="none"}
1.  Ax (Rxb -> x =a) : Only Achilles can defeat Hector
```

```{.Translate .FOL system="gamutND" submission="none"}
2. Rab /\ ~Ex (Rxb /\ ~x=a) : Achilles can defeat Hector, but no one else can
```

```{.Translate .FOL system="gamutND" submission="none"}
3. AxAy(((Px /\ Rxb) /\ (Py /\ Ryb)) -> x = y) : At most one Greek can defeat Hector 
```

```{.Translate .FOL system="gamutND" submission="none"}
4. Ex ((Px /\ Rxb) /\ Ay((Py /\ Ryb) -> x =y)) :Exactly one Greek can defeat Hector 
```

### natural deduction rules for identity

There are two simple natural deduction rules for identity. We begin with the simplest one.

Introduction ($I=$)

:	You may write an identity of the form $\tau = \tau$ by itself on a line.

![I=](idi.png)

The rationale for the rule is that as a matter of logic no matter what some individual may be, it is self-identical. 

Let us look at some applications of the rule.

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
1. :|-: Ex x=x
|a=a :I=
|Ex x=x :IE 1
```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
2. Ax (x = a -> Px) :|-: Pa
|Ax(x=a -> Px) :assumption
|a=a -> Pa :EA 1
|a=a :I=
|Pa :E-> 2, 3
```

Elimination ($E=$)

:	You may substitute every occurrence of $\tau_2$ for $\tau_1$ in a formula $\varphi$ when both that formula and an identity $\tau_1 = \tau_2$ occur at prior available lines of a proof.

![I=](ide.png)

The rationale for the elimination rule is that given an identity $\tau_1 = \tau_2$, we have that $\tau_1$ is one the same object as $\tau_2$​, which means that whatever is true of one should remain true of the other.

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
3. Ex(Px/\Rxb), Ax(Rxb -> x =a) :|-: Pa
|Ex(Px/\Rxb) :assumption
|Ax(Rxb -> x =a) :assumption
| Pc/\Rcb :assumption
| Pc :E/\ 3
| Rcb :E/\ 3
| Rcb -> c =a :EA 2
| c=a :E-> 5, 6
| Pa :E= 4, 7
|(Pc/\Rcb)-> Pa :I-> 3-8
|Pa :EE 1, 9

```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
4. Ax(Px -> Qx), -Qa, Pb :|-: -a=b
|Ax(Px -> Qx) :assumption
|-Qa :assumption
|Pb :assumption
| a=b :assumption
| Pa :E= 3, 4
| Pa -> Qa :EA 1
| Qa :E-> 5, 6
| !? :E- 2, 7
|-a=b :I- 4-8

```

### validity in quantificational logic with identity

We are now in a position to assess a larger class of natural language arguments.

Example

:	Consider the following argument:

> Only Achilles can defeat Hector. Some Greek can defeat Hector. Therefore, Achilles is Greek.

In premise conclusion form:

1. Only Achilles can defeat Hector.
2. Some Greek can defeat Hector.
3. Achilles is Greek

We are not able to translate the first premise into the language of quantificational logic unless we expand it with a brand new symbol for numerical identity.

**Translation Key**

Domain:	People

$P(\_)$:	__ is Greek

$R(\_,\_)$:	__ can defeat  __

​	$a$:	Achilles

​	$b$:	Hector

```{.Translate .FOL system="gamutND" submission="none"}
5.  Ax(Rxb -> x=a): Only Achilles can defeat Hector.
```

```{.Translate .FOL system="gamutND" submission="none"}
6. Ex(Rxb /\ Px) : Some Greek can defeat Hector.
```

```{.Translate .FOL system="gamutND" submission="none"}
7. Pa : Achilles is Greek.
```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
8. Ax(Rxb -> x=a), Ex(Rxb /\ Px) :|-: Pa
|Ax(Rxb -> x=a) :assumption
|Ex(Rxb /\ Px) :assumption
| Rcb /\ Pc :assumption
| Rcb -> c = a :EA 1
| Rcb :E/\ 3
| c=a :E-> 4, 5
| Pc :E/\ 3
| Pa :E=2.718 6, 7
|(Rcb /\ Pc) -> Pa :I-> 3-8
|Pa :EE 2, 9
```

Example

:	Consider the following argument:

> No one other than Achilles can defeat Hector. Achilles is Greek. Therefore, some Greeks can defeat Hector.

In premise conclusion form:

1. No one other than Achilles can defeat Hector.
2. Achilles is Greek.
3. Some Greeks can defeat Hector.



We are able to translate the argument into the language of quantificational logic with identity.

**Translation Key**

Domain:	People

$P(\_)$:	__ is Greek

$R(\_,\_)$:	__ can defeat  __

​	$a$:	Achilles

​	$b$:	Hector



```{.Translate .FOL system="gamutND" submission="none"}
9.  Ax(-x=a -> -Rxb): No one other than Achilles can defeat Hector.
|Ax(-x=a -> -Rxb)
```

```{.Translate .FOL system="gamutND" submission="none"}
10. Pa : Achilles is Greek.
|Pa
```

```{.Translate .FOL system="gamutND" submission="none"}
11. Ex(Px/\Rxb) : Some Greeks can defeat Hector.
|Ex(Px/\Rxb)
```

We first attempt to provide a model in which the premises are true and the conclusion is false.

```{.CounterModeler .Validity system="gamutNDPlus" options="turnstilemark double-turnstile" options="check" submission="none"}
12. Ax(-x=a -> -Rxb), Pa :|-: Ex(Px/\Rxb)
|Domain : 0, 1
|P(_) : 0
|R(_,_):
|a: 0
|b: 1

```

Once we manage to do this, we conclude that the argument is invalid.

Example

:	Consider the following argument:

> Hector fought Achilles, but Paris did not. So, Hector is not Paris.

In premise conclusion form:

1. Hector fought Achilles, but Paris did not.
2. Hector is not Paris.



We are able to translate the argument into the language of quantificational logic with identity.



**Translation Key**

Domain:	People

$R\_,\_$:	__ fought  __

​	$a$:	Achilles

​	$b$:	Hector

​	$c$:	Paris



```{.Translate .FOL system="gamutND" submission="none"}
13.  Rba /\ -Rca: Hector fought Achilles, but Paris did not.
|Rba /\ -Rca
```

```{.Translate .FOL system="gamutND" submission="none"}
14. Pa : Hector is not Paris
|-b=c
```

To assess the validity of the argument, we may first attempt to provide a counter model:

```{.CounterModeler .Validity system="gamutNDPlus" options="turnstilemark double-turnstile" options="check" submission="none"}
15. Rba /\ -Rca :|-: -b=c

```

Once we realize that we cannot produce such a model, we set out to find a derivation of the conclusion from the premise:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
16. Rba /\ -Rca :|-: -b=c
|Rba /\ -Rca :assumption
| b=c :assumption
| Rba :E/\ 1
| -Rca :E/\ 1
| -Rba :E= 2, 4
| !? :E- 3, 5
|-b=c :I- 2-6

```

Example

:	Consider the following argument:

> Mark Twain wrote *Huckleberry Finn*, and so did Samuel Clemens. Only one individual wrote *Huckleberry Finn*. Therefore, Mark Twain is Samuel Clemens.

In premise conclusion form:

1. Mark Twain wrote *Huckleberry Finn*, and so did Samuel Clemens.

2. Only one individual wrote *Huckleberry Finn*. 

3. Mark Twain is Samuel Clemens.

   

We now translate the argument into the language of quantificational logic with identity.

**Translation Key**

Domain:	People

$R \_,\_$:	__ wrote  __

​	$a$:	Mark Twain

​	$b$:	Samuel Clemens

​	$c$:	*Huckleberry Finn*



```{.Translate .FOL system="gamutND" submission="none"}
17.  Rac /\ Rbc: Mark Twain wrote "Huckleberry Finn", and so did Samuel Clemens.
|Rac /\ Rbc
```

```{.Translate .FOL system="gamutND" submission="none"}
18. Ax(Rxc -> Ay(Ryc -> x =y)) : Only one individual wrote "Huckleberry Finn"
|Ax(Rxc -> Ay(Ryc -> x =y))
```

```{.Translate .FOL system="gamutND" submission="none"}
19. a = b : Mark Twain is Samuel Clemens.
|a=b
```

We may first attempt to provide a counter model:

```{.CounterModeler .Validity system="gamutNDPlus" options="turnstilemark double-turnstile" options="check" submission="none"}
20. Rac /\ Rbc, Ax(Rxc -> Ay(Ryc -> x =y))  :|-: a = b

```

Once we realize that we cannot produce such a model, we set out to find a derivation of the conclusion from the premise:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
21. Rac /\ Rbc, Ax(Rxc -> Ay(Ryc -> x =y))  :|-: a = b
|Rac /\ Rbc :assumption
|Ax(Rxc -> Ay(Ryc -> x =y)) :assumption
|Rac :E/\ 1
|Rbc :E/\ 1
|Rac -> Ay(Ryc -> a = y) :EA 2
|Ay(Ryc -> a = y) :E-> 3, 5
|Rbc -> a=b :EA 6
|a=b :E-> 4, 7

```


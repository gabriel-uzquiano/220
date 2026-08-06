---
title: natural deduction continued
author: Gabriel Uzquiano
description: |
  quantification and identity

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---

# quantification and identity

Example

:	Consider the argument below:

> Only Achilles can defeat Hector. Some Greek can defeat Hector. So, Achilles is Greek.
>

In premise conclusion form:

1. Only Achilles can defeat Hector.
2. Some Greek can defeat Hector
3. Achiles is Greek.

We are not able to translate the first premise into the language of quantificational logic unless we expand it with a brand new symbol for numerical identity.

**Translation Key**

Domain:	People

$P \_$:	__ is Greek

$R \ \_,\_$:	__ can defeat  __

​	$a$:	Achilles

​	$b$:	Hector

```{.Translate .FOL system="gamutND" submission="none"}
1.  Ax(Rxb -> x=a): Only Achilles can defeat Hector.
```

```{.Translate .FOL system="gamutND" submission="none"}
2. Ex(Rxb /\ Px) : Some Greek can defeat Hector.
```

```{.Translate .FOL system="gamutND" submission="none"}
3. Pa : Achilles is Greek.
```

## numerical versus qualitative identity

We must first make a distinction between two different uses of the predicate 'is the same as' in English, namely, qualitative versus numerical identity.

Example

:	Compare and contrast two different interpretations of the sentence:

> Alex and Beth use the same computer.

On one use of that sentence, we simply convey the fact that Alex and Beth use the same make of computer, e.g., maybe they both use a powerbook. That is, the computer Alex uses is *qualitatively identical* to the computer Beth uses.

On another use, we intend to express the fact that Alex and Beth share one and the same machine. There is only one computer they both use. That is, the computer Alex uses is *numerically identical* to the computer Beth uses.

## quantificational logic with identity

We will now expand the language of quantificational logic with a new logical symbol for numerical identity, namely, $=$​. That will require us to make adjustments to the definition the syntax and to enrich the characterization of a model in order to cope with the new formulas. Finally, we will expand the natural deduction system with two new rules designed to exploit identity.

### syntax

We will now modify the definition of an *atomic formula* to allow for equalities of the form $\tau_1 = \tau_2$, where $\tau_1$ and $\tau_2$​ are either constants or variables.

We will generalize the definition of a formula accordingly.

### models

We retain the definition of a model, but expand the characterization of truth in a model relative to an assignment.

Definition

:	If $\tau_1 = \tau_2$ is an atomic formula, then $\tau_1 = \tau_2$ is true in a model $M$ under an assignment $\alpha$ if the denotation of $\tau_1$ under $\alpha$ is the same as that of $\tau_2$ under $\alpha$.

Example

:	Let $M$ and $\alpha$ be as described:

```{.CounterModeler .Simple system="gamutND" submission="none"}
4. Pa, Rab, a = b
|Domain : 0, 1
|P(_) : 0
|R(_,_) :[0,0]
|a: 0
|b: 0
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

$a = y$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
4.a. true or false under the assignment?
| *true, since the constant and variable stand for the same object
| not true, since they do not stand for the same object
```

$x = b$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
4.a. true or false under the assignment?
| true, since the constant and variable stand for the same object
| *not true, since they do not stand for the same object
```

$x = y$

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
4.a. true or false under the assignment?
| true, since the variables stand for the same object
| * not true, since they do not stand for the same object
```

Example

:	Consider the models for quantificational logic with identity given below.

```{.CounterModeler .Simple system="gamutND" submission="none"}
5. Pa, Qb, Rab, Ax(Px->Qx), a=c /\-a=b
```

```{.CounterModeler .Simple system="gamutND" submission="none"}
6. Ax Px, Qb -> AxRxb, Ax(Qx -> x=a)
```

### translation

We may now translate from English into the language of quantificational logic with identity. We will use the identity symbol to translate both explicit and less overt talk of numerical identity.

**Translation Key**

Domain:	People

$P \_$:	__ is Greek

$Q \_$:	__ is Trojan

$R \_,\_$:	__ can defeat  __

​	$a$:	Achilles

​	$b$:	Hector

```{.Translate .FOL system="gamutND" submission="none"}
7. - a=b /\ Ex (Gx /\ x = a) : Achilles is not Hector, but some Greek is Achilles.
|- a=b /\ Ex (Gx /\ x = a)
```

```{.Translate .FOL system="gamutND" submission="none"}
8. Ax (Rxa -> x=b) :Only Hector can defeat Achilles.
|Ax (Rxa -> x=b)
```

```{.Translate .FOL system="gamutND" submission="none"}
9. Rba /\ -Ex(Rxa /\ -x=b) : Hector can defeat Achilles but no one else can.
|Rba /\ -Ex(Rxa /\ -x=b) 
```

```{.Translate .FOL system="gamutND" submission="none"}
10. Ex(Qx /\ Rxa): At least one Trojan can defeat Achilles.
|Ex(Qx /\ Rxa)
```

```{.Translate .FOL system="gamutND" submission="none"}
11. Ax((Qx /\ Rx) -> Ay((Qy/\Ry)-> x=y)) :At most one Trojan can defeat Achilles.
| Ax((Qx /\ Rx) -> Ay((Qy/\Ry)-> x=y))
```

```{.Translate .FOL system="gamutND" submission="none"}
12. Ex ((Qx /\Rxa) /\ Ay((Qy /\Rya) -> x =y)) :Exactly one Trojan can defeat Achilles.
|Ex ((Qx /\Rxa) /\ Ay((Qy /\Rya) -> x=y)) 
```

```{.Translate .FOL system="gamutND" submission="none"}
13. Ex (((Qx /\Rxa) /\ Ay((Qy /\Rya) -> x =y)) /\ x = b) : There is exactly one Trojan who can defeat Achilles, who is Hector.
|Ex (((Qx /\Rxa) /\ Ay((Qy /\Rya) -> x =y)) /\ x = b)
```




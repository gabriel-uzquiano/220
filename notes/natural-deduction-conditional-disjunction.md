---
title: "natural deduction: conditional and disjunction"
author: Gabriel Uzquiano
description: |
  Natural Deduction: conditional and disjunction

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# natural deduction: conditional and disjunction

We have by now provided introduction and elimination rules for conjunction. To expand the deductive system, we must provide rules for the other connectives. We begin with the conditional.

### conditional

We have two rules of inference for the conditional.

Elimination $\to$​

:	You may write $\psi$ if both the conditional $\varphi \to \psi$ and the formula $\varphi$ are available at prior lines.

![E$\to$](cond elim.png)

By way of illustration, consider the proofs below:

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
1. (p/\ q) -> t, p, q :|-: t
|(p/\ q) -> t :assumption
|p :assumption
|q :assumption
|p/\q :I/\ 2, 3
|t :E-> 1, 4
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
2. p -> (q -> r), p/\ q :|-: r
|p -> (q -> r) :assumption
|p/\q :assumption
|p :E/\ 2
|q-> r :E-> 1, 3
|q :E/\ 2
|r :E-> 4, 5
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
3. p, (p /\ q) -> r, p -> q :|-: r
|p :assumption
|(p/\ q) -> r :assumption
|p -> q :assumption

```



The rule of conditional introduction requires more explanation.

Introduction $\to$  

:	You may write $\varphi \to \psi$ if you are able to derive $\psi$ from the assumption that $\varphi$. Once you do, you should bracket the lines employed in your auxiliary derivation of $\psi$ from the assumption that $\varphi$​  and never ever appeal to them again.

![I$\to$](cond intro.png)

For assorted applications of the rule, consider:

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
4. p -> (q /\ r) :|-: p -> r
|p -> (q/\r) :assumption
| p :assumption
| q/\ r :E-> 1, 2
| r :E/\ 3
|p->r :I-> 2-4
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
5. p -> r, q -> t :|-: (p /\ q) -> (r /\ t)
|p -> r :assumption
|q->t :assumption
| p /\ q :assumption
| p :E/\ 3
| r :E-> 1, 4
| q :E/\ 3
| t :E-> 2, 6
| r/\t :I/\ 5, 7
|(p/\q) -> (r/\t) :I-> 3-8
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
6. p -> (q -> r) :|-: q -> (p -> r)
|p -> (q -> r) :assumption


```



Here is a proof box you may use in order to experiment with derivations:

```{.Playground .GamutPND options="indent resize render popout tabindent" submission="none"}

```



### disjunction

We have two rules of inference for conjunction.

Introduction $\vee$

:	 You may write a disjunction $\varphi \vee \psi$ if one of the disjuncts $\varphi$ or $\psi$ becomes available at a prior line.

![I$\vee$](disj intro.png)

Here is how to apply the rule in proofs:

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
7. p, q :|-: (p \/ r) /\ (r \/ q)
|p :assumption
|q :assumption
|p\/r :I\/ 1
|r \/ q :I\/ 2
|(p\/r)/\(r\/q) :I/\ 3, 4
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
8. p, (p \/ q)-> r :|-: r
|p :assumption
|(p\/q) -> r :assumption
|p \/ q :I\/ 1
|r :E-> 2, 3
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
9. p /\ q :|-: (p \/ r) /\ (q \/ t)
|p /\ q :assumption

```



Elimination $\vee$​

:	You may write $\chi$ if the disjunction $\varphi \vee \psi$ and the conditionals $\varphi \to \chi$ and $\psi \to \chi$ are available at prior lines.

![E$\vee$](disj elim.png)

Let us look at some examples:

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
10. p > r, q > r, r> t, (p \/ q) :|-: t
|p > r :assumption
|q > r :assumption
|r > t :assumption
|p\/q :assumption
| p :assumption
| r :E-> 1, 5
| t :E-> 3, 6
|p->t :I-> 5-7
| q :assumption
| r :E-> 2, 9
| t :E-> 3, 10
|q-> t :I-> 9-11
|t :E\/ 4, 8, 12
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
11. (p /\ q) \/ (r /\ p) :|-: p
|(p /\ q) \/ (r /\ p) :assumption
| p /\ q :assumption
| p :E/\ 2
|(p /\ q)-> p :I-> 2-3
| r /\ p :assumption
| p :E/\ 5
|(r/\p)->p :I-> 5-6
|p :E\/ 1, 4, 7

```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
12. (p /\ q) \/ (p /\ r) :|-: q \/ r
|(p /\ q) \/ (p /\ r) :assumption
| p /\ q :assumption
| q :E/\ 2
| q \/ r :I\/ 3
|(p/\q) -> (q\/r) :I-> 2-4
| p/\r :assumption
| r :E/\ 6
| q\/r :I\/ 7
|(p/\r)-> (q\/ r) :I-> 6-8
|q\/r :E\/ 1, 5, 9
```



### applications

We are now in a position to justify the validity of a great number of arguments.

> The British are coming by land or they are coming by sea. Paul Revere will light one lamp if the British are coming by land. However, Paul Revere will light two lamps if they are coming by sea. So, Paul Revere will light one lamp or he will light two lamps.

### premise-conclusion form

1. The British are coming by land or they are coming by sea.
2. If the British are coming by land, then Paul Revere will light one lamp.
3. If the British are coming by sea, then Paul Revere will light two lamps.
4. Paul Revere will light one lamp or he will light two lamps.



### translation

**Translation Key**

$p$:	The British are coming by land.

$q$:	The British are coming by sea.

$r$:	Paul Revere will light one lamp.

$s$:	Paul Revere will light two lamps.

```{.Translate .Prop system="gamutPND" options="exam, nocheck"}
1. p \/ q : The British are coming by land or they are coming by sea.
|p \/ q
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck"}
2. p -> r : If the British are coming by land, then Paul Revere will light one lamp.
|p -> r 
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck"}
3. q -> s : If the British are coming by sea, then Paul Revere will light two lamps.
| q -> s
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck"}
4. r \/ s : Paul Revere will light one lamp or he will light two lamps.
| r \/ s
```



### validity

The argument is valid because there is a derivation of its conclusion from its premises.

```{.Playground .GamutPND options="indent resize render popout tabindent" submission="none"}
|p \/ q :assumption
|p -> r :assumption
|q -> s :assumption
| p :assumption
| r :E-> 2, 4
| r \/ s :I\/ 5
|p-> (r \/ s) :I-> 4-6
| q :assumption
| s :E-> 3, 8
| r\/ s :I\/ 9
|q -> (r\/ s) :I-> 8-10
|r\/s :E\/ 1, 7, 11
```


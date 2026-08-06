---
title: "natural deduction: negation"
author: Gabriel Uzquiano
description: |
  Natural Deduction: negation

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# natural deduction: negation

Negation requires special attention. We will first introduce introduction and elimination rules for negation, and we will proceed to motivate two further rules for the connective without which we would be unable to derive the conclusion of some valid arguments from their premises.

### negation

We begin our discussion of negation with introduction and elimination rules for that connective. To reason with negation, it will be convenient to introduce a *new* symbol into the deductive system: $\bot$. This symbol, which is sometimes called *falsum* or *bottom* or *bot*, is simply used to record the fact that we have arrived at a contradiction, and though it is **not** an official symbol of the language of propositional logic, it will play an auxiliary role in the formulation of the introduction and elimination rules for negation.



Elimination ($E\neg$)

:	You may write $\bot$ once a formula and its negation have become available in accessible prior lines.

![E$\neg$](neg elim.png)

The rule of negation elimination will generally be used to take an auxiliary step for the application of the rule of negation introduction.

Introduction ($I\neg$)

:	You may write a negation $\neg \varphi$  if you are able to derive $\bot$ from the assumption that $\varphi$. Once you do, you should bracket the lines employed in your auxiliary derivation of $\bot$ from the assumption that $\varphi$  and never ever appeal to them again.

![I$\neg$](neg intro.png)

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
1. p -> q, -q :|-: -p
|p -> q :assumption
|-q :assumption
| p :assumption
| q :E-> 1, 3
| !? :E- 2, 4
|-p :I- 3-5
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
2. p -> -p :|-: -p
|p -> -p :assumption
| p :assumption
| -p :E-> 1, 2
| !? :E- 2, 3
|-p :I- 2-4

```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
3. -(p \/ q) :|-: -p /\ -q
|-(p\/q) :assumption
| p :assumption
| p \/ q :I\/ 2
| !? :E- 1, 3
|-p :I- 2-4
| q :assumption
| p \/ q :I\/ 6
| !? :E- 1, 7
|-q :I- 6-8
|-p /\ -q :I/\ 5, 9
```

Negation is a special connective. For it turns out that the introduction and elimination rules for negation are not sufficient to account for the validity of some arguments in which negation is crucially involved. Consequently, we will now introduce two further rules of inference for negation:

Ex Falso Sequitor Quodlibet (EFSQ)

:	You may write any formula once $\bot$ becomes available at a prior line.



The Latin phrase *Ex Falso Sequitur Quodlibet* means that anything at all follows from a contradiction, and we will use the initials EFSQ to abbreviate the rule that enables to write an arbitrary formula after a contradiction.

![EFSQ](EFSQ.png)

Let us look at an illustration of the rule:

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
4. p, -p :|-: q
|p :assumption
|-p :assumption
|!? :E- 1,2
|q :EFSQ 3
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
5. p \/ q, -p :|-: q
|p \/ q :assumption
|-p :assumption
| p :assumption
| !? :E- 2, 3
| q :EFSQ 4
|p -> q :I-> 3-5
| q :assumption
| q :rep 7
|q -> q :I-> 7-8
|q :E\/ 1, 6, 9
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
6. p /\ q, -p :|-: r
|p/\q :assumption
|-p :assumption
|p :E/\ 1
|!? :E- 2, 3
|r :EFSQ 4
```



The last rule of inference for negation is designed to allow us to cancel a double negation.

Double Negation ($\neg \neg$)

:	You may write a formula $\varphi$ if a double negation $\neg \neg \varphi$ is available at a prior line.

![DN](double negation.png)

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
7. -p -> -q, q :|-: p
|-p -> -q :assumption
|q :assumption
| -p :assumption
| -q :E-> 1, 3
| !? :E- 2, 4
|--p :I- 3-5
|p :-- 6
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
8. :|-: p \/ -p
| -(p \/ -p) :assumption
|  p :assumption
|  p \/ -p :I\/ 2
|  !? :E- 1, 3
| -p :I- 2-4
| p \/ -p :I\/ 5
| !? :E- 1, 6
|--(p\/-p) :I- 1-7
|p\/-p :-- 8
```

Here is another proof box you may use in order to experiment further:

```{.Playground .GamutPND options="indent resize render popout tabindent" submission="none"}
```

### applications

We are now in a position to justify the validity of a great number of arguments.

> If you flip the coin, then it will land heads or tails but not both. Now, I win only if the coin lands heads. However, you win only if the coin lands tails. You will flip the coin. So, we will not both win.

### premise-conclusion form

1. If you flip the coin, then it will land heads or tails but not both.
2. I win only if coin lands heads. 
3. You win only the coin lands tails.
4. You will flip the coin.
5. It is not the case that we both win.



### translation

**Translation Key**

$p$:	You flip the coin.

$q$:	The coin lands heads.

$r$:	The coin lands tails.

$s$:	I win.

$t$:	You win.

```{.Translate .Prop system="gamutPND" options="exam, nocheck"}
1. p -> ((q \/ r) /\ -(q/\ r)) : If you flip the coin, then it will land heads or tails but not both.
|p -> ((q \/ r) /\ -(q/\ r))
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck"}
2. s -> q : I win only if the coin lands heads.
|s -> q 
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck"}
3. t -> r : You win only if the coin lands tails.
| t -> r
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck"}
4. p : You flip the coin.
| p
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck"}
5. -(s /\ t) : It is not the case that we both win.
|-(s /\ t)
```



### validity

The argument is valid because there is a derivation of its conclusion from its premises.

```{.Playground .GamutPND options="indent resize render popout tabindent" submission="none"}
|p -> ((q \/ r) /\ -(q/\ r)) :assumption
|s -> q :assumption
|t -> r :assumption
|p :assumption
| s/\t :assumption
| s :E/\ 5
| t :E/\ 5
| q :E-> 2, 6
| r :E-> 3, 7
| q/\r :I/\ 8, 9
| (q \/ r) /\ -(q/\ r) :E-> 1, 4
| -(q/\ r) :E/\ 11
| !? :E- 10, 12
|-(s/\t) :I- 5-13
```


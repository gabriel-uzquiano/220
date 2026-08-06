---
title: "natural deduction: conjunction"
author: Gabriel Uzquiano
description: |
  Natural Deduction: conjunction

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# natural deduction: conjunction

We have a decision method for propositional validity. If an argument formulated in the language of propositional logic is valid, then we should be able to establish its validity in a finite number of steps. If the argument is invalid, then we will find an assignment of truth values to propositional variables on which the premises are true and the conclusion false. On the other hand, if the argument is valid, then a close look at its truth table will reveal that. Unfortunately, matters are more complicated for more expressive languages for which we lack a similar decision method.

We now introduce another strategy for validity. If an argument is valid, then we should be able to prove its conclusion from its premises by means of a chain of steps constrained by certain rules of inference, which constrain the behavior of the logical connectives of propositional logic. One reason the method is of interest is that unlike the truth table method, it will be generalized to cover more expressive languages.

Example

:	Consider the argument:

> *Interest rates are high. Inflation will come down if interest rates are high and economic growth is slow. As it turns out, economic growth is slow. So, inflation will come down.*

In premise-conclusion form:

1. Interest rates are high.
2. If interest rates are high and economic growth is slow, then inflation will come down.
3. Economic growth is slow.
4. Inflation will come down.

We may now reason as follows:

From 1 and 3, we infer:

- Interest rates are high and economic growth is slow.

From 2, we have:

- If interest rates are high and economic growth is slow, then inflation will come down.

From these two observations, we now infer:

- Inflation will come down.

In order to turn the argument into a proof, we translate the argument English into the language of propositional logic:

**translation key**

$p$:	Interest rates are high.

$q$:	Economic growth is slow.

$r$:	Inflation will come down.

```{.Translate .Prop system="gamutPND" submission="none"}
1. p : Interest rates are high.
| p
```

```{.Translate .Prop system="gamutPND" submission="none"}
2. (p /\ q) -> r : If interest rates are high and economic growth is slow, then inflation will come down.
| (p /\ q) -> r 
```

```{.Translate .Prop system="gamutPND" submission="none"}
3. q : Economic growth is slow.
| q
```

```{.Translate .Prop system="gamutPND" submission="none"}
4. r: Inflation will come down.
| r
```



We now aim to produce a *proof* of the conclusion from the premises. A proof generally consists of a sequence of formulas each of which is either a premise or assumption or a *consequence* we derive from earlier formulas by means of a rule of inference.

Here is how we will prove the conclusion of the argument above on the basis of the premises:

```{.ProofChecker .GamutPND options="indent resize popout fonts render tabindent" submission="none"}
1. p, (p /\ q) > r, q :|-: r
|p :assumption
|(p /\ q) > r :assumption
|q :assumption
|p/\q :I/\ 1,3
|r :E-> 2, 4
```

We annotated the key steps in lines 4 and 5 with the name of a rule of inference for conjunction and conditional, respectively, and the lines to which each rule had been applied. 

More generally:

Definition

:	A *derivation* or *proof* is a finite sequence of formulas each of which is either an *assumption* or the outcome of an application of a rule of inference to prior formulas. The last formula in the sequence is the *conclusion* of the proof.

If an argument of propositional logic is valid, then we will be able to provide a proof of the conclusion of the argument from its premises.

We now specify the catalogue of rules of inference you may employ in a proof. There will be one structural rule, and rules associated to specific connectives of propositional logic. Each connective will come with at least two different rules: a rule of *introduction* will specify the conditions under which we are allowed to write a formula with that connective as the main connective on the basis of prior formulas, and a rule of *elimination* will specify the conditions under which we are allowed to exploit a formula with that connective as the main connective in combination with other formulas.

## natural deduction rules

Repetition

:   You may repeat a formula $\varphi$ on a line if it is available on a prior line of the derivation.

![repetition](Repetition.png)

Here is the simplest proof you will ever encounter:

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
1. p :|-: p
|p :assumption
|p :rep 1
```

### conjunction

We have two rules of inference for conjunction.

Introduction $\wedge$

:	 You may write a conjunction $\varphi \wedge \psi$ on a line if $\varphi$ and $\psi$​ are available at prior lines in the derivation.

![I$\wedge$](conj intro.png)

Here is how to apply the rule in a derivation:

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
2. p, q :|-: p /\ q
|p :assumption
|q :assumption
|p/\q :I/\ 1,2
```

For another illustration, consider:

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
3. p, q, r :|-: (p/\r) /\ q
|p :assumption
|q :assumption
|r :assumption
|p/\r :I/\ 1, 3
|(p/\r)/\q :I/\ 2, 4
```

Elimination $\wedge$​

:	You may write a conjunct $\varphi$ on a line if a conjunction $\varphi \wedge \psi$ is available at a prior line

:	You may write a conjunct $\psi$ on a line if a conjunction $\varphi \wedge \psi$ is available at a prior line

![E$\wedge$](conj elim.png)

Let us look at some examples:

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
4. p, (q/\r) :|-: p /\ r
|p :assumption
|q/\ r :assumption
|r :E/\ 2
|p/\ r :I/\ 1,3
```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
5. (p/\q)/\(r/\t) :|-: (p/\r) /\ (q /\ t)
|(p/\q)/\(r/\t) :assumption
|p/\q :E/\ 1
|r/\t :E/\ 1
|p :E/\ 2
|r :E/\ 3
|q :E/\ 2
|t :E/\ 3
|p/\r :I/\ 4, 5
|q/\t :I/\ 6, 7
|(p/\r)/\(q/\t) :I/\ 8, 9
```

Let us put the rules into practice:

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
6. p, q, r :|-: (p /\ q) /\ (q /\ r)
|p :assumption
|q :assumption
|r :assumption

```

```	{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
7. (p /\ q), (r /\ s) :|-: (p /\ r) /\ (q /\ s)
|p /\ q :assumption
|r /\ s :assumption

```

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
8. (p /\ (q /\ r)), ((p /\ t) /\ s) :|-: r /\ t
|p /\ (q /\ r) :assumption
|(p/\t)/\ s :assumption

```



Here is a proof box you may use in order to experiment with these rules:

```{.Playground .GamutPND options="indent resize render popout tabindent" submission="none"}

```




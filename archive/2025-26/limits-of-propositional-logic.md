---
title: natural deduction continued
author: Gabriel Uzquiano
description: |
  The issue with conditionals

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# conditionals

We have noted that propositional logic is not sufficient to account for the validity of a vast array of natural language arguments, which remain propositionally invalid. To that purpose, we will introduce the language of quantificational logic, which will be able to capture quantificational structure responsible for the validity of a variety of natural language arguments.

The plan now is to look at another feature of propositional logic, which classifies as propositionally valid a variety of arguments that involve conditionals that may strike one as invalid. The propositional validity of the arguments given below relies crucially on the alleged truth-functional behavior of the conditionals in question, and they have been used to question whether certain uses of 'if $\dots$, then $\dots$' in English are aptly captured by the material conditional $\to$ of propositional logic. 

Example

:	Consider the argument below due to William Harper:

1. If I put sugar in my coffee, then it will taste fine.

2. If I put sugar and motor oil in my coffee, then it will taste fine.

   

**Translation Key**

$p$:	I put sugar in my coffee.

$q$:	I put motor oil in my coffee.

$r$:	My  coffee will taste fine.

```{.Translate .Prop system="gamutPND" submission="none"}
1. p -> q : If I put sugar in my coffee, then it will taste fine.
| p -> q
```

```{.Translate .Prop system="gamutPND" submission="none"}
2. (p /\ r) -> q : If I put sugar and motor oil in my coffee, then it will taste fine.
| (p /\ r) -> q
```

The argument is *valid* as we are able to derive its conclusion from its premise.

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
3. p -> q :|-: (p /\ r) -> q
|p -> q :assumption
| p /\ r :assumption
| p :E/\ 2
| q :E-> 1, 3
|(p/\r) -> q :I-> 2-4
```

That makes the natural language argument *propositionally valid*. We are confronted by a puzzle, since the premise seems true and the conclusion false. Yet, no valid argument has true premises and a false conclusion.

What gives? We have two main options before us:

1. We may question the adequacy of the translation into the language of propositional logic on the grounds that the indicative conditional 'if $\dots$ , then $\dots$' is not used truth-functionally in the argument. 

   The question then would be to explain what the appropriate semantics for such uses of the indicative conditionals may be.

2. We may alternatively insist on the truth-functional behavior of the indicative conditional 'if $\dots$, then $\dots$' and conclude that the original argument is valid despite appearances to the contrary. 

   The question then would be to explain away the apparent invalidity of the argument. On the truth-functional interpretation of the conditional, the first premise states that adding sugar to my coffee is *sufficient* regardless of what else may be the case for my coffee to taste fine, but as the conclusion makes plain, that is not the case. 

The menu of options will be similar for each of the arguments given below.



Example (Dorothy Edgington)

:	Consider the argument below:

1. If  God doesn't exist, then it's not the case that if I pray, my prayers will be answered. 
2. I don't pray.
3. God exists



**Translation Key**

$p$:	God exists.

$q$:	I pray.

$r$:	My prayers will be answered.



```{.Translate .Prop system="gamutPND" submission="none"}
1. -p -> -(q -> r) : If  God doesn't exist, then it's not the case that if I pray, my prayers will be answered. 
| -p -> -(q -> r)
```

```{.Translate .Prop system="gamutPND" submission="none"}
2. -q : I don't pray.
|-q
```

```{.Translate .Prop system="gamutPND" submission="none"}
3. p : God exists.
| p
```

The argument is *valid* as we are able to derive its conclusion from its premise.

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
4. -p -> -(q -> r), -q :|-: p
|-p -> -(q -> r) :assumption
|-q :assumption
| -p :assumption
| -(q -> r) :E-> 1, 3
|  q :assumption
|  !? :E- 2, 5
|  r :EFSQ 6
| q -> r :I-> 5-7
| !? :E- 4, 8
|--p :I- 3-9
|p :-- 10
```

This may again come as a surprise. By the lights of an atheist, the premises seem true and the conclusion false. Here is a parallel argument for a different apparently false conclusion:

1. If I'm not a millionaire, then it is not the case that if you ask me to give you a a million dollars, I will give the money to you.
2. You haven't asked me to give you a million dollars.
3. Therefore, I'm a millionaire.

The form of this argument is completely parallel to Edgington's argument, yet its premises seem true and its conclusion false.



Example

:	Consider the argument below:

1. If I turn left at the intersection and you turn right at the intersection, then we will crash into each other. 
2. We will crash into each other if I turn left at the intersection or we will crash into each other if you turn right at the intersection.



**Translation Key**

$p$:	I turn left at the intersection.

$q$:	You turn right at the intersection.

$r$:	We crash into each other.

```{.Translate .Prop system="gamutPND" submission="none"}
1. (p /\ q) -> r : If I turn left at the intersection and you turn right at the intersection, then we will crash into each other.
| (p /\ q) -> r
```

```{.Translate .Prop system="gamutPND" submission="none"}
2. (p  -> r) \/ (q -> r) : We will crash into each other if I turn left at the intersection or we will crash into each other if you turn right at the intersection.
| (p  -> r) \/ (q -> r)
```

The argument is *propositionally valid* as we are able to derive its conclusion from its premise.

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
5. (p /\ q) -> r :|-: (p  -> r) \/ (q -> r)
|(p /\ q) -> r :assumption
| -((p  -> r) \/ (q -> r)) :assumption
|  q :assumption
|   p :assumption
|   p /\ q :I/\ 3, 4
|   r :E-> 1, 5
|  p -> r :I-> 4-6
|  (p -> r) \/ (q -> r) :I\/ 7
|  !? :E- 2, 8
| -q :I- 3-9
|  q :assumption
|  !? :E- 10, 11
|  r :EFSQ 12
| q-> r :I-> 11-13
| (p -> r) \/ (q -> r) :I\/ 14
| !? :E- 2, 15
|--((p  -> r) \/ (q -> r)) :I- 2-16
|(p  -> r) \/ (q -> r) :-- 17
```

This may again come as a surprise, since you may imagine a scenario in which the premise is true and the conclusion false.

Example

:	Consider the argument below:

1. If I travel to Europe, it will not be to Paris.
2. If I travel to Paris, then I will not travel to Europe.

**Translation Key**

$p$:	I travel to Europe

$q$:	I travel to Paris

```{.Translate .Prop system="gamutPND" submission="none"}
1. p -> -q : If I travel to Europe, it will not be to Paris.
| p -> -q
```

```{.Translate .Prop system="gamutPND" submission="none"}
2. q -> -p : If I travel to Paris, I will not travel to Europe.
|q -> - p
```



The argument is *propositionally valid* as we are able to derive its conclusion from its premise.

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
6. p -> -q :|-: q -> -p
|p -> -q :assumption
| q :assumption
|  p :assumption
|  -q :E-> 1, 3
|  !? :E- 2, 4
| -p :I- 3-5
|q -> -p :I-> 2-6
```



Example

:	Consider the argument *without premises* below:

1. There will be a recession if inflation remains high or there will be a recession if inflation does not remain high.

**Translation Key**

$p$:	There will be a recession

$q$:	Inflation remains high



```{.Translate .Prop system="gamutPND" submission="none"}
1.  (q -> p) \/ (-q -> p) : There will be a recession if inflation remains high or there will be a recession if inflation does not remain high.
| (q -> p) \/ (-q -> p)
```

The argument is *propositionally valid* as we are able to derive its conclusion even without premises.

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
7. :|-: (q -> p) \/ (-q -> p)
| -(q \/ -q) :assumption
|  q :assumption
|  q \/ -q :I\/ 2
|  !? :E- 1, 3
| -q :I- 2-4
| q \/ -q :I\/ 5
| !? :E- 1, 6
|--(q \/ -q) :I- 1-7
|q\/-q :-- 8
| q :assumption
|  -q :assumption
|  !? :E- 10, 11
|  p :EFSQ 12
| -q -> p :I-> 11-13
| (q > p) \/ (-q > p) :I\/ 14
|q-> ((q -> p) \/ (-q -> p)) :I-> 10-15
| -q :assumption
|  q :assumption
|  !? :E- 17, 18
|  p :EFSQ 19
| q-> p :I-> 18-20
| (q -> p) \/ (-q -> p) :I\/ 21
|-q-> ((q -> p) \/ (-q -> p)) :I-> 17-22
|(q -> p) \/ (-q -> p) :E\/ 9, 16, 23
```






---
title: "propositional validity"
author: Gabriel Uzquiano
description: |
  How to construct proofs

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# propositional validity 

The ability to translate from natural language into the language of propositional logic enables one to check whether a natural language argument exemplifies a valid *propositional form*. 

Definition

:	A natural language argument is *propositionally valid* if, and only if, it translates into a valid argument of propositional logic.

Example

:	Consider the natural language argument below:

*You'll be rich tomorrow if you buy a lottery ticket from me. You'll buy a ticket from me if the lottery is rigged and you think that I'm part of the scheme. The lottery is rigged, but you won't be rich tomorrow. Therefore, you don't think that I'm part of the scheme.*

### premise-conclusion form

1. You will be rich tomorrow if you buy a lottery ticket from me.
2. You will buy a lottery ticket from me if the lottery is rigged and you think that I'm part of the scheme.
3. The lottery is rigged, but you will not be rich tomorrow.
4. You do not think that I'm part of the scheme.

### translation

**Translation Key**

$p$:	You will be rich tomorrow.

$q$:	You will buy a lottery ticket from me.

$r$:	The lottery is rigged.

$s$:	You think I'm part of the scheme.

```{.Translate .Prop system="gamutPND" submission="none"}
1. q -> p : You will be rich tomorrow if you buy a lottery ticket from me.
| q -> p
```

```{.Translate .Prop system="gamutPND" submission="none"}
2. (r /\ s) -> q : You will buy a lottery ticket from me if the lottery is rigged and you think that I'm part of the scheme.
| (r /\ s) -> q
```

```{.Translate .Prop system="gamutPND" submission="none"}
3. r /\ -p : The lottery is rigged, but you will not be rich tomorrow.
| r /\ -p
```

```{.Translate .Prop system="gamutPND" submission="none"}
4. -s: You do not think I'm part of the scheme
| -s
```

### validity

The argument is valid because there is a derivation of its conclusion from its premises.

```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
5. q -> p, (r/\s) ->q, r /\ -p :|-: -s
|q -> p :assumption
|(r /\ s) > q :assumption
|r /\ -p :assumption
| s	:assumption
| r :E/\ 3
| r/\s :I/\ 4, 5
| q :E-> 2, 6
| p :E-> 1, 7
| -p :E/\ 3 
| !? :E- 8, 9
|-s :I- 4-10
```

We conclude that the initial natural language argument is *propositionally valid*, since it exemplifies a valid argument form.

The important point to note now is that propositional validity is just one way in which a natural language argument may be valid. To be sure,

Fact

:	If a natural language argument is propositionally valid, then it is valid simpliciter.

However:

Fact

:	A natural language arguments may still valid even if it is *not* propositionally valid.

That means, a natural language argument may exemplify a valid form *even if it does not exemplify a propositionally valid form.* This is what will motivate the introduction of the language of quantificational logic.

In the meantime, it will pay to consider a few more examples from the practice timed test.

## A

*If the board committed fraud, then they'll be charged if there is any evidence against them. There is evidence against them if they committed fraud. So, unless they are charged, there is no evidence against them.*

### premise-conclusion form



1. If the board committed fraud, then they will be charged if there is evidence against them. 
2. There is evidence against them if they committed fraud.
3. Unless they are charged, there is no evidence against them.



### translation

**Translation Key**

$p$:	The board committed fraud.

$q$:	The board will be charged.

$r$:	There is evidence against them.

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
1. p ->(r -> q)  : If the board committed fraud, then they will be charged if there is any evidence against them.
|p ->(r -> q)
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
2. p -> r : There is evidence against them if they committed fraud.
|p -> r 
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
3. - q -> -r : Unless they are charged, there is no evidence against them.
| -q -> -r
```

### validity

The argument is *invalid* because there is an assignment on which the premises are true and the conclusion false, namely, $p:F$, $q:F$, and $r:T$, as shown by the partial truth table given below.

```{.TruthTable .Partial system="gamutPND" options="turnstilemark double-turnstile nodash" submission="none"}
4. p -> (r -> q), p -> r, -q -> -r
|  F T   T F  F   F T  T  TF  F FT  
```





## B

*If you flip the coin, then it'll land heads or tails but not both. If the coin is biased, then it'll land heads. So, if you flip the coin and the coin lands tails, then it's not biased.*

### premise-conclusion form

1. If you flip the coin, then it will land heads or tails but not both.
2. If the coin is biased, then it will land heads.
3. if you flip the coin and the coin lands tails, then it is not biased.



### translation

**Translation Key**

$p$:	You flip the coin.

$q$:	The coin lands heads.

$r$:	The coin lands tails.

$s$:	The coin is biased.

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
1. p ->((q \/ r) /\ -(q /\ r))  : If you flip the coin, then it will land heads or tails but not both.
|p ->((q \/ r) /\ -(q /\ r))
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
2. s -> q : If the coin is biased, then it will land heads.
|s -> q 
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
3. (p /\ r) -> - s : if you flip the coin and the coin lands tails, then it is not biased.
| (p /\ r) -> - s
```

### validity

The argument is valid because there is a derivation of its conclusion from its premises.

```{.Playground .GamutPND options="indent resize render popout tabindent" submission="none"}
p ->((q \/ r) /\ -(q /\ r)) :assumption
s -> q :assumption
 p/\r :assumption
 p :E/\ 3
 (q \/ r) /\ -(q /\ r) :E-> 1, 4
 r :E/\ 3
  s :assumption
  q :E-> 2, 7
  q/\r :I/\ 6, 8
  -(q/\r) :E/\ 5
  !? :E- 9, 10
 -s :I- 7-11
(p/\r)-> -s :I-> 3-12 
```



## C

*If you're in the Expo line, then you'll reach Santa Monica only if you board a westbound train. Although you're in the Expo line, you're not boarding a westbound train. Therefore, you won't reach Santa Monica.*



### premise-conclusion form



1. If you're in the Expo line, then you will reach Santa Monica only if you board a westbound train. 
2. Although you're in the Expo line, you're not boarding a westbound train.
3. You will not reach Santa Monica.



### translation

**Translation Key**

$p$:	You are in the Expo line.

$q$:	You will reach Santa Monica.

$r$:	You're boarding a westbound train.

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
1. p ->(q -> r)  : If you're in the Expo line, then you will reach Santa Monica only if you board a westbound train. 
|p ->(q -> r)
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
2. p /\ -r : Although you're in the Expo line, you're not boarding a westbound train.
|p /\ -r
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
3. - q : You will not reach Santa Monica.
| -q
```

### validity

The argument is *valid* because there is a derivation of its conclusion from its premises.

```{.Playground .GamutPND options="indent resize render popout tabindent" submission="none"}
p ->(q -> r) :assumption
p /\ -r :assumption
 q :assumption
 p :E/\ 2
 q-> r :E-> 1, 4
 r :E-> 3, 5
 -r :E/\ 2
 !? :E- 6, 7
-q :I- 3-8
```





## D

*I'll win the hand if I'm dealt an ace. On the other hand, if I'm dealt a four of hearts, then I will still win the hand unless someone else is dealt an ace. I'll be dealt an ace or a four of hearts. Therefore, I'll win the hand.*

### premise-conclusion form



1. I will win the hand if I'm dealt an ace.
2. If I'm dealt a four of hearts, then I will still win the hand unless someone else is dealt an ace.
3. I will be dealt an ace or a four of hearts.
4. I will win the hand.



### translation

**Translation Key**

$p$:	I will win the hand.

$q$:	I'm dealt an ace.

$r$:	I'm dealt a four of hearts.

$s$:	Someone else is dealt an ace.

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
1. q -> p  : I will win the hand if I'm dealt an ace.
|q -> p
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
2. r -> (-s -> p) : If I'm dealt a four of hearts, then I will still win the hand unless someone else is dealt an ace.
|r -> (-s -> p) 
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
3. q \/ r : I will be dealt an ace or a four of hearts.
| q \/ r
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
4. p : I will win the hand.
|p
```



### validity

The argument is *invalid* because there is an assignment on which the premises are true and the conclusion false, namely, $p:F$, $q:F$, $r:T$, and $s:T$, as shown by the partial truth table given below.

```{.TruthTable .Partial system="gamutPND" options="turnstilemark double-turnstile nodash" submission="none"}
5. q -> p, r -> (-s -> p), q \/ r, p
|  F T  F  T T   FT T  F   F  T T  F
```


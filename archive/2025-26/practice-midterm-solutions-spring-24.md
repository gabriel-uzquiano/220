---
title: introduction to logic
author: Gabriel Uzquiano
description: |
  practice midterm
base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tuftextra.css
---

# solutions to practice midterm

Two of the arguments given below are *propositionally valid* and two are *propositionally invalid*. For each argument, you should:

1. state the argument in *premise-conclusion form* (5 pts)

2. *translate* the argument into the language of propositional logic (10 pts)

3. *determine* whether the argument is propositionally valid or invalid (10 pts)

   

   - If the argument is *valid*, provide a derivation of the conclusion from its premises.

   - If the argument is *invalid*, provide an assignment on which the premises are true and the conclusion false.

## A

*If the board committed fraud, then they will be charged if there is any evidence against them. There is evidence against them if they committed fraud. So, unless they are charged, there is no evidence against them.*

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

*If you flip the coin, then it will land heads or tails but not both. If the coin is biased, then it will land heads. So, if you flip the coin and the coin lands tails, then it is not biased.*

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

*If the Expo line stops at USC, then you will end up in Santa Monica only if you board a westbound train. The Expo line stops at USC, but you will not board a westbound train today. Therefore, you will not end up in Santa Monica today.*



### premise-conclusion form



1. If the Expo line stops at USC, then you will end up in Santa Monica today only if you board a westbound train. 
2. The Expo line stops at USC, but you will not board a westbound train today.
3. You will not end up in Santa Monica today.



### translation

**Translation Key**

$p$:	The Expo line stops at USC.

$q$:	You will end up in Santa Monica today.

$r$:	You board a westbound train today.

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
1. p ->(q -> r)  : If the Expo line stops at USC, then you will end up in Santa Monica today only if you board a westbound train
|p ->(q -> r)
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
2. p /\ -r : The Expo line stops at USC, but you will not board a westbound train today.
|p /\ -r
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
3. - q : You will not end up in Santa Monica today.
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

*I will win the hand if I'm dealt an ace. If I'm dealt a four of hearts, then I will still win the hand unless someone else is dealt an ace. I will be dealt an ace or a four of hearts. Therefore, I will win the hand.*

### premise-conclusion form



1. I will win the hand if I'm dealt an ace.
2.  If I'm dealt a four of hearts, then I will still win the hand unless someone else is dealt an ace.
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


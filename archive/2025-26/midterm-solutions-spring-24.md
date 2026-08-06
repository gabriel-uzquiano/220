---
title: introduction to logic
author: Gabriel Uzquiano
description: |
  practice midterm
base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tuftextra.css
---

# solutions to midterm

Two of the arguments given below are *propositionally valid* and two are *propositionally invalid*. For each argument, you should:

1. state the argument in *premise-conclusion form* (5 pts)

2. *translate* the argument into the language of propositional logic (10 pts)

3. *determine* whether the argument is propositionally valid or invalid (10 pts)

   

   - If the argument is *valid*, provide a derivation of the conclusion from its premises.

   - If the argument is *invalid*, provide an assignment on which the premises are true and the conclusion false.

## A

*If all mammals live on land, then whales live on land if they are mammals. Whales are mammals but they do not live on land. Therefore, not all mammals live on land.*

### premise-conclusion form

1. If all mammals live on land, then whales live on land if they are mammals.
2. Whales are mammals but they do not live on land.
3. Not all mammals live on land.



### translation

**Translation Key**

$p$:	All mammals live on land.

$q$:	Whales are mammals.

$r$:	Whales live on land.

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
1. p ->(q -> r)  : If all mammals live on land, then whales live on land if they are mammals. 
|p ->(q -> r)
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
2. q /\ - r : Whales are mammals but they do not live on land.
|q /\ -r
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
3. -p : Not all mammals live on land.
| -p
```

### validity

The argument is valid because there is a derivation of its conclusion from its premises.

```{.Playground .GamutPND options="indent resize render popout tabindent" submission="none"}
|p ->(q->r) :assumption
|q /\ -r :assumption
| p :assumption
| q -> r :E-> 1, 3
| q :E/\ 2
| -r :E/\ 2
| r :E-> 4, 5
| !? :E- 6, 7
|-p :I- 3-8
```





## B

*If faculty and students both drive to campus, then there will not be enough parking space for everyone. Students drive to campus only if there is enough parking space for everyone. Therefore, faculty will not drive to campus.*

### premise-conclusion form

1. If faculty and students both drive to campus, then there will not be enough parking space for everyone.
2. Students will drive to campus only if there is enough parking space for everyone.
3. Faculty will not drive to campus.



### translation

**Translation Key**

$p$:	Faculty drive to campus.

$q$:	Students drive to campus.

$r$:	There is enough parking space for everyone.



```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
1. (p /\ q) -> -r : If faculty and students both drive to campus, then there will not be enough parking space for everyone.
|(p /\ q) -> -r
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
2. q -> r : Students will drive to campus only if there is enough parking space for everyone.
|q -> r
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
3. -p : Faculty will not drive to campus.
|-p
```

### validity

The argument is *invalid* because there is an assignment on which the premises are true and the conclusion false, namely, $p:T$, $q:F$,  and $r:F$, as shown by the partial truth table given above.

```{.TruthTable .Partial system="gamutPND" options="turnstilemark double-turnstile nodash" submission="none"}
5. (p /\ q) -> -r, q -> r, -p
|   T F  F   T TF  F T  F  FT
```





## C

*Cobalt but not nickel is present in the sample. If cobalt and manganese are present in the sample, then a brown color will eventually appear. So, a brown color will eventually appear.*

### premise-conclusion form



1. Cobalt but not nickel is present in the sample.
2. If cobalt and manganese are present in the sample, then a brown color will eventually appear.
3. A brown color will eventually appear.



### translation

**Translation Key**

$p$:	Cobalt is present in the sample.

$q$:	Nickel is present in the sample.

$r$:	Manganese is present in the sample.

$s$:	A brown color will eventually appear.

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
1. p /\ - q  : Cobalt but not nickel is present in the sample.
|p /\ -q
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
2. (p /\ r) -> s: If cobalt and manganese are present in the sample, then a brown color will eventually appear.
|(p /\ r) -> s
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
3. s : A brown color will eventually appear.
| s
```

### validity

The argument is *invalid* because there is an assignment on which the premises are true and the conclusion false, namely, $p: T$, $q: F$, $r: F$, and $s: F$, as shown by the partial truth table given above.

```{.TruthTable .Partial system="gamutPND" options="turnstilemark double-turnstile nodash" submission="none"}
5. p /\ -q, (p /\ r) -> s, s
|  T  T TF   T F  F  T  F  F
```





## D

*If your argument is sound, then it is valid and its premises are true. But if your argument is valid, then its premises are true only if its conclusion is true as well. So, if your argument is sound, then its conclusion is true.*

### premise-conclusion form



1. If your argument is sound, then it is valid and its premises are true. 
2. If your argument is valid, then its premises are true only if its conclusion is true as well.
3. So, if your argument is sound, then its conclusion is true.



### translation

**Translation Key**

$p$:	Your argument is sound.

$q$:	Your argument is valid.

$r$:	The premises of your argument are true.

$s$:	The conclusion of your argument is true.

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
1. p -> (q/\r)  : If your argument is sound, then it is valid and its premises are true. 
|p -> (q/\r)
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
2. q -> (r -> s) : If your argument is valid, then its premises are true only if its conclusion is true as well.
|q -> (r -> s)
```

```{.Translate .Prop system="gamutPND" options="exam, nocheck" submission="none"}
3. p -> s : If your argument is sound, then its conclusion is true.
| p-> s
```



### validity

The argument is valid because there is a derivation of its conclusion from its premises.

```{.Playground .GamutPND options="indent resize render popout tabindent" submission="none"}
|p -> (q/\r) :assumption
|q -> (r -> s) :assumption
| p  :assumption
| q/\ r :E-> 1, 3
| q :E/\ 4
| r-> s :E-> 2, 5 
| r :E/\ 4
| s	:E-> 6, 7
|p -> s :I-> 3-8
```






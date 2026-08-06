---
title: "complex translation"
author: Gabriel Uzquiano
description: |
  Syntax of Propositional Logic

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# complex translation

We will now use the skills we have developed thus far for the evaluation of real life arguments. They will involve three main steps in each case:

1. We will write the argument in premise-conclusion form.
2. We will translate the argument into the language of propositional logic.
3. We will use a truth table to determine whether the argument is valid.

Example

:	Consider the argument:

> *My client is not the burglar. For if there are no signs of forced entry, then, if my client had been the burglar, she would have had an accomplice inside the building. But we can discard that option, as no one in the building could have known my client before today. Nor are there any signs of forced entry.*

### premise-conclusion form

1. If there are no signs of forced entry, then if my client had been the burglar, then she would have had an accomplice inside the building.
2. She did not have an accomplice inside the building.
3. There are no signs of forced entry.
4. My client is not the burglar.

### translation

1. (([<span style="color: red;">**If**</span>]{.underline} there are no signs of forced entry, [<span style="color: red;">**then**</span>]{.underline} (<span style="color: red;">**if**</span> my client had been the burglar, <span style="color: red;">**then**</span> she would have had an accomplice inside the building.))

2. It is [<span style="color: red;">**not**</span>]{.underline} the case that she had an accomplice inside the building.

3. It is [<span style="color: red;">**not**</span>]{.underline} the case that there are signs of forced entry.
4. It is [<span style="color: red;">**not**</span>]{.underline} the case that my client is the burglar.



**translation key**

$p$:	There are signs of forced entry

$q$:	My client is the burglar

$r$:	My client had an accomplice inside the building

```{.Translate .Prop system="gamutPND" submission="none"}
1. -p > (q > r): If there are no signs of forced entry, then if my client was the burglar, then she had an accomplice inside the building.
```

```{.Translate .Prop system="gamutPND" submission="none"}
2. -r: She did not have an accomplice inside the building.
```

```{.Translate .Prop system="gamutPND" submission="none"}
3. -p: There are no signs of forced entry.
```

```{.Translate .Prop system="gamutPND" submission="none"}
4. -q: My client is not the burglar.
```

### evaluation

Once we have a translation of the argument into propositional logic, we may make use of a truth table in order to determine its validity or invalidity.

```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="turnstilemark double-turnstile nodash autoAtoms" submission="none"}
A. -p > (q > r), -r, -p :|-: -q
```

We find that the argument is *valid* because there is *no* assignment of truth values to the propositional variables on which the premises come out true and the conclusion false.



Example

:	Consider the argument:

> *If the mind is the same thing as the brain, then the mind is made of matter only if the brain is made of matter. Unless the mind is mortal, it is not made of matter. The brain is made of matter. Therefore, the mind is not the same thing as the brain.*



### premise-conclusion form

1. If the mind is the same thing as the brain, then the mind is made of matter only if the brain is made of matter.
2. Unless the mind is mortal, it is not made of matter.
3. The brain is made of matter.
4. The mind is not the same thing as the brain.

### translation

1. (([<span style="color: red;">**If**</span>]{.underline} the mind is the same thing as the brain, [<span style="color: red;">**then**</span>]{.underline} (<span style="color: red;">**if**</span> the mind is made of matter, <span style="color: red;">**then**</span> the brain is made of matter.))

2. ([<span style="color: red;">**If**</span>]{.underline} it is <span style="color: red;">**not**</span> the case that the mind is mortal, [<span style="color: red;">**then**</span>]{.underline} it is <span style="color: red;">**not**</span> the case that the mind is made of matter)

3. The brain is made of matter.
4. It is [<span style="color: red;">**not**</span>]{.underline} the case that the mind is the same thing as the brain.



**translation key**

$p$:	The the mind is the same thing as the brain.

$q$:	The mind is made of matter.

$r$:	The brain is made of matter.

$t$:	The mind is mortal



```{.Translate .Prop system="gamutPND" submission="none"}
5. p > (q > r): If the mind is the same thing as the brain, then the mind is made of matter only if the brain is made of matter.
```

```{.Translate .Prop system="gamutPND" submission="none"}
6. -t > ~q: Unless the mind is mortal, it is not made of matter.
```

```{.Translate .Prop system="gamutPND" submission="none"}
7. r: The brain is made of matter.
```

```{.Translate .Prop system="gamutPND" submission="none"}
8. -p: The mind is not the same thing as the brain.
```

### evaluation

Once we have a translation of the argument into propositional logic, we may make use of a truth table in order to determine its validity or invalidity.

```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="turnstilemark double-turnstile nodash autoAtoms" submission="none"}
B. p > (q > r), -t > ~q, r :|-: -p
```



We may, if we like, directly look for a counterexample to validity by means of a *partial* truth table. Here we simply list premise and conclusion and we look for an assignment that makes the premises true and the conclusion false. 

```{.TruthTable .Partial system="gamutPND" options="turnstilemark double-turnstile nodash" submission="none"}
B.1. p > (q > r), -t > ~q, r, -p
```

To make the conclusion false in this case, we must make the negation $\neg p$ False, which requires $p$ to be true. Similarly, to make the third premise true, we must make $r$ true. Notice that making $q$ and $t$ false provides us with an assignment on which the premises are true and the conclusion false. So, we conclude that the assignment $TFTF$ is a counterexample to the validity of the argument. 



Example

:	Consider the following example adapted from W.V. O. Quine's *Methods of Logic*:

>  *If Jones is ill or Smith is away, then unless Robinson comes to his senses, neither will the Argus deal be concluded nor will the directors declare a dividend. Consequently, if Smith is away and Robinson does not come to his senses, the Argus deal will not be concluded.*



### premise-conclusion form

1. If Jones is ill or Smith is away, then unless Robinson comes to his senses, neither will the Argus deal be concluded nor will the directors declare a dividend.
2. If Smith is away and Robinson does not come to his senses, then the Argus deal will not be concluded.



### translation

1. (([<span style="color: red;">**If**</span>]{.underline} (Jones is ill <span style="color: red;">**or**</span> Smith is away), [<span style="color: red;">**then**</span>]{.underline} (<span style="color: red;">**if**</span> (Robinson does <span style="color: red;">**not**</span> come to his senses, <span style="color: red;">**then**</span> (the Argus deal will <span style="color: red;">**not**</span> be completed <span style="color: red;">**and**</span> the directors will <span style="color: red;">**not**</span> declare a dividend))).
2. (([<span style="color: red;">**If**</span>]{.underline} (Smith is away <span style="color: red;">**and**</span> Robinson does <span style="color: red;">**not**</span> come to his senses), [<span style="color: red;">**then**</span>]{.underline} the Argus deal will <span style="color: red;">**not**</span> be concluded.

**translation key**

$p$:	Jones is ill.

$q$:	Smith is away

$r$:	Robinson comes to his senses

$s$:	The Argus deal will be completed

$t$:	The directors will declare a dividend

```{.Translate .Prop system="gamutPND" submission="none"}
9. (p \/ q) > (-r > (-s /\ -t)): If Jones is ill or Smith is away, then if Robinson does not come to his senses, then the Argus deal will not be completed and the directors will not declare a dividend.
```

```{.Translate .Prop system="gamutPND" submission="none"}
10. (q /\ -r) > - s: If Smith is away and Robinson does not come to his senses, then the Argus deal will not be concluded.
```

### evaluation

Once we have a translation of the argument into propositional logic, we may make use of a truth table in order to determine its validity or invalidity. Unfortunately, the truth table in question has $2^5$, that is, $32$ rows, which means that it would take too long to complete.

```{.TruthTable .Validity .Partial system="gamutPND" options="turnstilemark double-turnstile nodash autoAtoms" submission="none"}
C. (p \/ q) > (-r > (-s /\ -t)) :|-: (q /\ -r) > - s
```

We may instead directly look for a counterexample to validity by means of a *partial* truth table. Here we simply list premise and conclusion and we look for an assignment that makes the premises true and the conclusion false. We may convince ourselves of the validity of the argument if we realize that there is *no way* to fill the partial truth table to make the premise true and the conclusion false.

```{.TruthTable .Partial system="gamutPND" options="turnstilemark double-turnstile nodash" submission="none"}
C.1. (p \/ q) > (-r > (-s /\ -t)), (q /\ -r) > - s
```

To make the conclusion false in this case, we must make the conditional $(q \ \wedge \ \neg r) \to \neg s$ false, which would require to make $q$ true, $r$ false, and $s$ false. However, when we do that, we realize that the premise comes out true: if $r$ is false, then the conditional $\neg r \to (\neg s \wedge \neg t)$ is automatically true making the first premise in fact true. So, *there is no way to correctly fill the partial truth table making the premise true and the conclusion false*. 

That means that there is *no* assignment of truth values to the propositional variables on which the premises come out true and the conclusion false. The argument is valid.



Example

:	Consider the argument adapted from Michael Resnik's *Elementary Logic*.

> If the horse loses a shoe, the owner will shoe the horse or hire someone to do so. If the owner shoes the horse, the owner will have a sore back. The race will be canceled if the owner has a sore back. So, if the horse loses a shoe and the owner does not hire someone to shoe the horse, the race will be canceled.



### premise-conclusion form

1. If the horse loses a shoe, then the owner will shoe the horse or hire someone to do so.
2. If the owner shoes the horse, then the owner will have a sore back.
3. The race will be canceled if the owner has a sore back.
4. If the horse loses a shoe and the owner does not hire someone to shoe the horse, the race will be canceled.

### translation

1. ([<span style="color: red;">**If**</span>]{.underline} the horse loses a shoe, [<span style="color: red;">**then**</span>]{.underline} (the owner will shoe the horse <span style="color: red;">**or**</span> hire someone to do so.))
2. ([<span style="color: red;">**If**</span>]{.underline} the owner shoes the horse, [<span style="color: red;">**then**</span>]{.underline} the owner will have a sore back.)
3. ([<span style="color: red;">**If**</span>]{.underline} the owner has a sore back, [<span style="color: red;">**then**</span>]{.underline} the race will be canceled.)
4. ([<span style="color: red;">**If**</span>]{.underline} (the horse loses a shoe <span style="color: red;">**and**</span> the owner does <span style="color: red;">**not**</span> hire someone to shoe the horse), [<span style="color: red;">**the**</span>]{.underline} race will be canceled.)



**translation key**

$p$:	The horse loses a shoe.

$q$:	The owner will shoe the horse.

$r$:	The owner will hire someone to shoe the horse.

$s$:	The owner will have a sore back.

$t$:	The race will be canceled.

```{.Translate .Prop system="gamutPND" submission="none"}
11. p > (q \/ r): If the horse loses a shoe, then the owner will shoe the horse or hire someone to do so.
```

```{.Translate .Prop system="gamutPND" submission="none"}
12. q > s: If the owner shoes the horse, the owner will have a sore back.
```

```{.Translate .Prop system="gamutPND" submission="none"}
13. s > t: If the owner has a sore back, then the race will be canceled.
```

```{.Translate .Prop system="gamutPND" submission="none"}
14. (p /\ -r) > t: If the horse loses a shoe and the owner does not hire someone to shoe the horse, then the race will be canceled.
```



### evaluation

Once we have translated the argument into propositional logic, we may use a truth table in order to determine its validity or invalidity. Unfortunately, much like before,  the truth table in question consists of $2^5$, that is, $32$ rows, which means that the task to completely fill out the table becomes unmanageable.

```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="turnstilemark double-turnstile nodash autoAtoms" submission="none"}
D. p > (q \/ r), q > s, s > t :|-: (p /\ -r) > t
```

We may instead directly look for a counterexample to validity by means of a *partial* truth table. Here we simply list the premises and conclusion of the argument, and we look for an assignment that makes the premises true and the conclusion false. 

```{.TruthTable .Partial system="gamutPND" options="turnstilemark double-turnstile nodash" submission="none"}
D.1. p > (q \/ r), q > s, s > t, (p /\ -r) > t
```

To make the conclusion false in this case, we must make the conditional $(p \ \wedge \ \neg r) \to t$ false, which would require to make $p$ true, $r$ false, and $t$ false. However, when make $t$ false, we find we must make $s$ false as well; otherwise, the premise $s \to t$ would be false. And that leads us to make $q$ false as well; otherwise, $q \to s$ would similarly be false. At this point, however,  we have made $p$ true and both $q$ and $r$ false, which means that the first premise $p \to (q \ \vee \ r)$ is in fact false. So, *there is no way to correctly fill the partial truth table making the premise true and the conclusion false*. 

We conclude that the argument is *valid* because there is *no* assignment of truth values to the propositional variables on which the premises come out true and the conclusion false.


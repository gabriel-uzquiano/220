---
title: "issues with translation"
author: Gabriel Uzquiano
description: |
  issues with translation

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# issues with translation

We now look at difficulties raised by special quantifier phrases and by the structural ambiguity of a variety of English sentences.

## special phrases

### 'a'

Example

:	Consider the following sentences:

1. A whale lives underwater.

2. A whale came close to shore.

**Translation Key**

Domain:	Animals

$P \ \_$:	__ is a whale

$Q \ \_$:	__ lives underwater

$R. \ \_$:	__ came close to shore

While strictly speaking ambiguous, two different readings become salient in each case:

1. Every whale lives underwater.

   For every $x$, if $x$ is a whale, then $x$ lives underwater.

```{.Translate .FOL system="gamutND" submission="none"}
1. Ax (Px -> Qx) : A whale lives underwater.
|Ax (Px -> Qx)
```

2. Some whale came close to shore.

   Some $x$ is such that $x$ is a whale and $x$ came close to shore.

```{.Translate .FOL system="gamutND" submission="none"}
2. Ex (Px /\ Rx) : A whale came close to shore.
|Ex(Px /\ Rx)
```

Notice that the syntax of 1 is consistent with $\exists x (Px \wedge Qx)$ but it is difficult to hear that reading in common contexts. Similarly, while the syntax of 2 is strictly speaking consistent with $\forall x(Px \to Rx)$, it is difficult to hear that reading in common contexts. 

### 'only'

Example

:	Consider the following sentences:

3. Only credit cards are welcome.

4. Some restaurants only accept credit cards.

   

**Translation Key**

Domain:	Establishments and payment methods

$P \ \_$:	__ is a credit card

$Q \ \_$:	__ is a welcome method

$R \ \_$:	__ is a restaurant

$S \ \_ \ \_$:	__ accepts __

​	

The first step as usual is to paraphrase the target sentences:

3. All welcome methods are credit cards.

   For every $x$, $x$ is a welcome method **only if** $x$ is a credit card.

   For every $x$, **if** $x$ is a welcome method, **then** $x$ is a credit card.

```{.Translate .FOL system="gamutND" submission="none"}
3. Ax (Qx -> Px) : Only credit cards are welcome.
|Ax (Qx -> Px)
```

4. Some restaurants only accept credit cards.

   Some $x$ is such that $x$ is a restaurant and $x$​ accepts only credit cards.

   Some $x$ is such that $x$ is a restaurant and for every $y$, $x$ accepts $y$ **only if** $y$ is a credit card.

   Some $x$ is such that $x$ is a restaurant and for every $y$, **if** $x$ accepts $y$, **then** $y$ is a credit card.

```{.Translate .FOL system="gamutND" submission="none"}
4. Ex (Rx /\ Ay(Sxy -> Py)) : Some restaurants only accept credit cards.
|Ex (Rx /\ Ay(Sxy -> Py))
```

### 'no $P$ is \___'

Example

:	Consider the following sentences:

5. No credit card is welcome.

We paraphrase the sentence as follows:

5. All credit cards are not welcome

   Every $x$ is such that if $x$ is a credit card, then $x$ is not welcome.

```{.Translate .FOL system="gamutND" submission="none"}
5. Ax (Px -> -Qx) : No credit card is welcome.
|Ax (Px -> -Qx)
```

Or, equivalently:

5. It's not the case that some credit card is welcome.

   It's not the case that some $x$ is such that $x$ is a credit card and $x$ is welcome.

```{.Translate .FOL system="gamutND" submission="none"}
5. -Ex (Px /\ Qx) : No credit card is welcome.
|-Ex (Px /\ Qx)
```

Both translations are acceptable as they are equivalent to each other.

### 'any'

One difficulty with 'any' is that its translation calls for different quantifiers in different contexts.

Example

:	Consider the sentences below:

6. Any credit card is welcome.
7. If any credit card is welcome, then they all are.

We proceed to paraphrase them in turn:

6. All credit cards are welcome.

   Every $x$ is such that if $x$ is a credit card, then $x$ is welcome.

```{.Translate .FOL system="gamutND" submission="none"}
6. Ax (Px -> Qx) : Any credit card is welcome.
|Ax (Px -> Qx)
```

7. If some credit card is welcome, then all credit cards are welcome.

   If some $x$ is such that $x$ is a credit card and $x$ is welcome, then for every $x$, if $x$  is a credit card, then $x$ is welcome.

```{.Translate .FOL system="gamutND" submission="none"}
5. Ex(Px /\ Qx) -> Ax(Px -> Qx) : If any credit card is welcome, then they all are.
|Ex(Px /\ Qx) -> Ax(Px -> Qx)
```

## multiple generality and structural ambiguity

Ambiguity is the source of special difficulties for purposes of translation.

### multiple generality

The presence of multiple quantifiers often makes for structural ambiguity in English.

Example

:	Consider the sentence:

8. There is a cause for everything

   

**Translation Key**

Domain:	Events

$R \ \_ \ \_$:	__ causes __

There are two candidate interpretations of the sentence:

8. Every $x$ is such that $x$​ has a cause

   Every $x$ is such that some $y$ is such that $y$ causes $x$.

```{.Translate .FOL system="gamutND" submission="none"}
8. Ax Ey Ryx : Everything has a cause.
|Ax Ey Ryx
```

8. Some $x$​ is a cause of everything.

   Some $x$ is such that every $y$ is such that $y$ causes $x$.

```{.Translate .FOL system="gamutND" submission="none"}
8. ExAy Rxy :Everything has a cause.
|ExAy Rxy
```

Which one is the *correct* translation? We have to rely on contextual cues to find out which one is the interpretation intended by the speaker, but in case of doubt it is best to provide both translations and explain that the target sentence is ambiguous between the two of them.

Example

:	Consider the sentence:

9. Every student must register for some logic class.

**Translation Key**

Domain:	Students and courses

$P \ \_$:	__ is a student

$Q \ \_$:	__ is a logic class

$R \ \_ \ \_$:	__ registers for __

There is again a choice between two non-equivalent readings of the sentence:

9. Every $x$ is such that if $x$ is a student, then $x$ must register for some logic class.

   Every $x$ is such that if $x$ is a student, then for some $y$, $y$ is a logic class and $x$ must register for $y$.

```{.Translate .FOL system="gamutND" submission="none"}
9. Ax(Px -> Ey(Qy /\Rxy)) : Every student must register for some logic class.
|Ax(Px -> Ey(Qy /\Rxy))
```

9. Some $x$ is such that $x$ is a logic class and every student must register for $x$.

   Some $x$ is that $x$ is a logic class and for every $y$, if $y$ is a student, then $y$ must register for $x$.

```{.Translate .FOL system="gamutND" submission="none"}
9. Ex(Qx /\ Ay(Py -> Ryx)) : Every student must register for some logic class.
|Ex(Qx /\ Ay(Py -> Ryx))
```

Example

:	Consider the sentence:

10. Every student must register for every logic course.

We first paraphrase the target sentence as follows:

10. Every $x$ is such that if $x$ is a student, then $x$ must register for every logic course.

    Every $x$ is such that if $x$ is a student, then for every $y$, if $y$ is a logic course, then $x$ must register for $y$.

```{.Translate .FOL system="gamutND" submission="none"}
10. Ax(Px -> Ay(Qy -> Rxy)) : Every student must register for every logic course.
|Ax(Px -> Ay(Qy -> Rxy))
```


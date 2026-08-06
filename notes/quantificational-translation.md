---
title: "translation into quantificational logic"
author: Gabriel Uzquiano
description: |
  translation into quantificational logic

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# translation

We now build on the translation strategies we used for propositional logic. We first explain how the target sentence is made up out of simpler sentences with the help of propositional connectives. But unlike in the case of propositional logic, we will not use propositional variables to stand for them. Instead, we use the vocabulary of quantificational logic to identify further structure in them.

## predication

Example

:	Consider the English sentences given below:

1. Aristotle followed Plato, but Plato followed Socrates.

2. Aristotle and Plato followed each other.

3. Aristotle followed Socrates only if Plato did.

We specify a translation key:

> **Translation Key**
>
> Domain:	People
>
> $R \ \_ \ \_$:	__ followed __
>
> ​	$a$:	Aristotle
>
> ​	$b$:	Plato
>
> ​	$c$:	Socrates

Now:

1. Aristotle followed Plato, but Plato followed Socrates.

   (Aristotle followed Plato $\wedge$ Plato followed Socrates)

```{.Translate .FOL system="gamutND" submission="none"}
1. Rab /\ Rbc : Aristotle followed Plato, but Plato followed Socrates.
|Rab /\ Rbc
```

2. Aristotle and Plato followed each other.

   (Aristotled followed Plato $\wedge$​ Plato followed Aristotle)

```{.Translate .FOL system="gamutND" submission="none"}
2. Rab /\ Rba : Aristotle and Plato followed each other.
|Rab /\ Rba
```

3. Aristotle followed Socrates only if Plato did.

   (Aristotle followed Socrates $\to$ Plato followed Socrates)

```{.Translate .FOL system="gamutND" submission="none"}
3. Rac -> Rbc : Aristotle followed Socrates only if Plato did.
|Rac -> Rbc
```

## quantification

Quantifier phrases require more care. We begin with the simplest cases and build from them. 

### 'something', 'everything', 'nothing'

Example

:	Consider the sentences below:

4. Something is heavy.
5. Everything is concrete. 
6. Nothing lasts forever.

The expressions 'something', 'everything', or 'nothing' are **not** designators, since their primary semantic function is not to refer but rather to express generality. 

We specify a translation key:

> **Translation Key**
>
> Domain:	Things
>
> $P \ \_$:	__ is heavy
>
> $Q \ \_$:	__ is concrete
>
> $R \ \_$:	__ is lasts forever

We rephrase the first two sentences as follows:

4. Something is heavy.

   Some *thing* is such that *it* is heavy.

   Some $x$ is such that $x$ is heavy.

```{.Translate .FOL system="gamutND" submission="none"}
4. Ex Px : Something is heavy
| Ex Px
```

5. Everything is concrete.

   Every *thing* is such that *it* is concrete.

   Every $x$ is such that $x$​ is concrete.

```{.Translate .FOL system="gamutND" submission="none"}
5. Ax Qx : Everything is concrete
| Ax Qx
```

What should we make now of the third sentence:

6. Nothing lasts forever.

   It's not the case that something lasts forever.

   It's not the case that some *thing* is such that *it* lasts forever.

```{.Translate .FOL system="gamutND" submission="none"}
6. -Ex Rx :Nothing lasts forever.
| -Ex Rx
```

Alternatively:

6. Nothing lasts forever.

   Everything doesn't last forever.

   Every *thing* is such that *it* does not last forever

```{.Translate .FOL system="gamutND" submission="none"}
6. ~Ex Rx :Nothing lasts forever.
|Ax -Rx
```

### 'some $P$ is \_\_\_' and 'every $P$ is \_\_\_'

The expressions 'some' and 'every' often combine with a predicate to form a quantifier phrase such as for example, 'some apple', 'every apple', 'some computer' or 'every computer'. 

We now focus on two types of sentences.

Example

:	Consider now the sentence:

7. Some apples are delicious.

> **Translation Key**
>
> Domain:	Things
>
> $P \ \_$:	__ is an apple
>
> $Q \ \_$:	__ is delicious



7. Some apples are delicious.

   Some *thing* is such that *it* is an apple **and** *it* is delicious.

   Some $x$ is such that $x$ is an apple and $x$ is delicious.

   Some $x$ is such that ($x$ is an apple $\wedge$ $x$ is delicious).

```{.Translate .FOL system="gamutND" submission="none"}
7. Ex(Px/\Qx) : Some apples are delicious.
|Ex(Px/\Qx)
```



Example

:	Consider:

8. Every computer is expensive.

> **Translation Key**
>
> Domain:	Things
>
> $P \ \_$:	__ is a computer
>
> $Q \ \_$:	__ is expensive
>



8. Every computer is expensive.

   Every *thing* is such that **if** *it* is a computer, **then** *it* is expensive.

   Every $x$ is such that **if** $x$ is a computer, **then** $x$ is expensive.

   Every $x$ is such that (if $x$ is a computer $\to$ $x$ is expensive).

```{.Translate .FOL system="gamutND" submission="none"}
8. Ax(Px->Qx) : Every computer is expensive.
|Ax(Px->Qx)
```

Example

:	Consider the sentences below:

9. Some computers are connected to the network.

10. Every computer is connected to the network.

> **Translation Key**
>
> Domain:	Things
>
> $P \ \_$:	__ is a computer
>
> $R \ \_ \ \_$:	__ is connected to __
>
> ​	$a$:	the network
>

We first rephrase the sentences as follows:

9. Some computers are connected to the network.

   Some *thing* is such that *it* is a computer and *it* is connected to the network.

   Some $x$ is such that ($x$ is a computer $\wedge$ $x$​​ is connected to the network)

```{.Translate .FOL system="gamutND" submission="none"}
9. Ex (Px /\ Rxa) : Some computers are connected to the network.
|Ex (Px /\ Rxa)
```



10. Every computer is connected to the network.

    Every *thing* is such that if *it* is a computer, then *it* is connected to the network.

    Every $x$ is such that (if $x$ is a computer $\to$ $x$ is connected to the network)

```{.Translate .FOL system="gamutND" submission="none"}
10. Ax (Px -> Rxa) : Every computer is connected to the network.
|Ax (Px -> Rxa)
```

## multiple generality

One further layer of complexity involves predicates with more than one argument place. 

Example

:	Compare the sentences given below:

11. Aristotle followed Plato.
12. Someone followed Plato.
13. Aristotle followed someone.
14. Everyone followed Plato.
15. Aristotle followed everyone.
16. Someone followed someone.
17. Someone followed everyone.
18. Everyone followed someone.
19. Everyone followed everyone.

Here is a translation key we may use for these and further examples down below:

> **Translation Key**
>
> Domain:	People
>
> $R \ \_ \ \_$:	__ follows __
>
> $P \ \_$:	__ is a philosopher
>
> $Q \ \_$:	__ is a mathematician
>
> ​	$a$:	Aristotle
>
> ​	$b$:	Plato
>

We know how to translate the first five sentences, since they involve the quantifers 'someone' and 'everyone':

```{.Translate .FOL system="gamutND" submission="none"}
11. Rab : Aristotle followed Plato.
```

```{.Translate .FOL system="gamutND" submission="none"}
12. Ex Rxb : Someone followed Plato.
```

```{.Translate .FOL system="gamutND" submission="none"}
13. Ex Rax : Aristotle followed someone.
```

```{.Translate .FOL system="gamutND" submission="none"}
14. Ax Rxb : Everyone followed Plato.
```

```{.Translate .FOL system="gamutND" submission="none"}
15. Ax Rax : Aristotle followed everyone.
```

The next four sentences are more delicate, but we break down the task into simpler pieces:

16. Someone followed someone

    Some $x$ is such that $x$ followed someone.

    Some $x$ is such that some *one* is such that $x$ followed *them*.

    Some $x$ is such that some $y$ is such that $x$ followed $y$​

```{.Translate .FOL system="gamutND" submission="none"}
16. Ex Ey Rxy : Someone followed someone.
|Ex Ey Rxy
```

17. Someone followed everyone

    Some $x$ is such that $x$ followed everyone.

    Some $x$ is such that every *one* is such that $x$ followed *them*.

    Some $x$ is such that every $y$ is such that $x$ followed $y$​

```{.Translate .FOL system="gamutND" submission="none"}
17. Ex Ay Rxy : Someone followed everyone.
|Ex Ay Rxy
```

18. Everyone followed someone

    Every $x$ is such that $x$ followed someone.

    Every $x$ is such that some *one* is such that $x$ followed *them*.

    Every $x$ is such that some $y$ is such that $x$ followed $y$​

```{.Translate .FOL system="gamutND" submission="none"}
18. Ax Ey Rxy : Everyone followed someone.
|Ax Ey Rxy
```

19. Everyone followed everyone

    Every $x$ is such that $x$ followed everyone.

    Every $x$ is such that every *one* is such that $x$ followed *them*.

    Every $x$ is such that every $y$ is such that $x$ followed $y$​

```{.Translate .FOL system="gamutND" submission="none"}
19. Ax Ay Rxy : Everyone followed everyone.
|Ax Ay Rxy
```

Example

:	Consider the sentences below:

20. Some philosophers followed Plato.
21. Plato followed some philosophers.
22. Every philosopher followed Plato.
23. Plato followed every philosopher.

We proceed as before by making sure we break the task into simpler pieces.

20. Some philosopher followed Plato.

    Some $x$ is such that $x$ is a philosopher and $x$ followed Plato.

    Some $x$ is such that ($x$ is a philosopher $\wedge$ $x$​ followed Plato)

```{.Translate .FOL system="gamutND" submission="none"}
20. Ex (Px /\ Rxb) : Some philosopher followed Plato.
|Ex (Px /\ Rxb)
```

21. Plato followed some philosophers.

    Some $x$ is such that $x$ is a philosopher and Plato followed $x$.

    Some $x$ is such that ($x$ is a philosopher $\wedge$ Plato followed $x$)

```{.Translate .FOL system="gamutND" submission="none"}
21. Ex (Px /\ Rbx) :  Plato followed some philosophers.
|Ex (Px /\ Rbx)
```



22. Every philosopher followed Plato.

    Every $x$ is such that if $x$ is a philosopher, then $x$ followed Plato.

    Every $x$ is such that ($x$ is a philosopher $\to$ $x$ followed Plato).

```{.Translate .FOL system="gamutND" submission="none"}
22. Ax(Px -> Rxb) : Every philosopher followed Plato.
|Ax(Px -> Rxb)
```



23. Plato followed every philosopher.

    Every $x$ is such that if $x$ is a philosopher, then Plato followed $x$.

    Every $x$ is such that ($x$ is a philosopher $\to$ Plato followed $x$).

```{.Translate .FOL system="gamutND" submission="none"}
23. Ax(Px -> Rbx) : Plato followed every philosopher.
|Ax(Px -> Rbx)
```



Example

:	Consider now the sentences:

24. Some philosophers followed some mathematicians.
25. Every philosopher followed some mathematicians.
26. Every philosopher followed every mathematician.



24. Some philosophers followed some mathematicians.

    Some $x$ is such that $x$ is a philosopher and $x$ followed some mathematician.

    Some $x$ is such that ($x$ is a philosopher $\wedge$ $x$ followed some mathematician).

    Some $x$ is such that ($x$ is a philosopher $\wedge$ some $y$ is such that ($y$ is a mathematician $\wedge$ $x$ followed $y$)).

```{.Translate .FOL system="gamutND" submission="none"}
24. Ex(Px /\ Ey (Qy /\ Rxy)) : Some philosophers followed some mathematicians.
|Ex(Px /\ Ey (Qy /\ Rxy))
```

25. Every philosopher followed some mathematicians.

    Every $x$ is such that if $x$ is a philosopher, then $x$ followed some mathematicians.

    Every $x$ is such that ($x$ is a philosopher $\to$ $x$ followed some mathematician).

    Every $x$ is such that ($x$ is a philosopher $\to$ some $y$ is such that ($y$ is a mathematician $\wedge$ $x$ followed $y$)).

```{.Translate .FOL system="gamutND" submission="none"}
25. Ax (Px -> Ey(Qy /\ Rxy)) : Every philosopher followed some mathematicians.
|Ax (Px -> Ey(Qy /\ Rxy))
```

26. Every philosopher followed every mathematician.

    Every $x$ is such that if $x$ is a philosopher, then $x$ followed every mathematician.

    Every $x$ is such that ($x$ is a philosopher $\to$ $x$ followed every mathematician).

    Every $x$ is such that ($x$ is a philosopher $\to$ every $y$ is such that ($y$ is a mathematician $\to$ $x$ followed $y$)).

```{.Translate .FOL system="gamutND" submission="none"}
26. Ax (Px -> Ay(Qy -> Rxy)) : Every philosopher followed every mathematician.
|Ax (Px -> Ay(Qy -> Rxy))
```


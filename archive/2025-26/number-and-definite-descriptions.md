---
title: natural deduction continued
author: Gabriel Uzquiano
description: |
  number and definite descriptions

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---

# definite descriptions

We now focus on phrases such as 'the author of *Huckleberry Finn*' or 'the instructor for PHIL 220'. In quantificational logic (without identity), we simply treated them as designators, expressions whose primary semantic function is to designate an object. 

Example

:	Consider the following sentence:

The instructor for PHIL 220g is late.

You may think that the expression 'the instructor for PHIL 220g' is a designator we use to designate a certain individual, namely, whoever is the instructor for that course. If so, the sentence will be true if, and only if, that individual is late.

But there is a problem ...

### some puzzles

There are at least two serious problems with that treatment:

### empty definite descriptions

Many definite descriptions fail to denote an object.

Example

:	Consider the following sentence:

The instructor for PHIL 220g is late.

What exactly is the truth value of that sentence? France is a republic, which means that no one is a king of France. 

There is nothing we can take 'the king of France' to denote, and that raises the question of whether the sentence is true or false. 

One may be tempted to respond by denying that the sentence has a truth value. Instead, we may say that sentences with *empty* terms such as 'the King of France' are *neither true nor false*.

Unfortunately, that is not tenable view either ...

### negative existentials

Some sentences involving definite descriptions *are true*.

Example

:	Consider the following sentence:

The King of France doesn't exist

The puzzle in that case is that we want the sentence to come out true even if 'the King of France' fails to denote anything. In fact, that is precisely the reason why we want it to come out as true, but it is not clear we can do that if we continue to assimilate definite descriptions to names.

### Russell's theory of definite descriptions

Bertrand Russell famously suggested that definite descriptions should instead be treated as quantifier phrases. He thought we should treat definite descriptions such as 

- the author of *Huckleberry Finn*

as akin to *quantifier phrases* such as

- every author of *Huckleberry Finn*
- some author of *Huckleberry Finn*.
- $\cdots$

What do quantifier phrases such as  'some philosopher', 'no student', 'every instructor' mean? Nothing, they have no meaning in isolation.

Unlike names, quantifier expressions are meaningful only to the extent to which they contribute to the meaning of the sentences in which they appear. The suggestion now is that definite descriptions of the form 'the such-and-such' fall under that category as well.

He offered the following style of paraphrase for sentences involving definite descriptions.

Russell's Rule for Definite Descriptions

:	Analyze a sentence of the form 'the $\varphi$ is $\psi$' as follows:

There is exactly one $x$ such that $\varphi(x)$ and $\psi(x)$.

$\exists x (\varphi(x)\wedge (\forall y(\varphi(y)\to x = y) \wedge \psi(x))$.

Example

:	Consider the following sentence:

The king of France is bald.

For Russell, an adequate paraphrase of that sentence is:

There is one, and only one king of France, and he is bald.

**Translation Key**

Domain:	People

$P \_$:	__ is a king of France

$Q \_$:	__ is bald

```{.Translate .FOL system="gamutND" submission="none"}
11.  Ex(Px/\(Ay(Py -> x=y)/\Qx)): The king of France is bald.
|Ex(Px/\(Ay(Py -> x=y)/\Qx))
```

The sentence is *false* not *because* there is such an individual as a non-bald king of France, but rather *because* it is not the case that there is one, and only one king of France, much less a bald one.

Russell's treatment of definite descriptions helps with both puzzles mentioned above. On the one hand, it is false that there is exactly one individual who is both a king of France and bald. On the other hand, the best translation of a negative existential becomes:

```{.Translate .FOL system="gamutND" submission="none"}
12. -Ex(Px/\Ay(Py -> x =y)) :The King of France doesn't exist
|-Ex(Px/\Ay(Py -> x =y))
```



We have developed a framework for the assessment of the validity of a broad family of natural language arguments. Some arguments, however, still fall outside the scope of quantificational logic with identity.

## modality

Example

:	Consider the argument given below:

*Whether or not there is one, it is at least possible that a perfect being exists. But now, if it is possible that a perfect being exists, then it is thereby possible that it exists necessarily. That means that it is possible that a perfect being exists necessarily. Therefore, a perfect being exists.*

In premise conclusion form:

1. It is possible that a perfect being exists. 
2. If it is possible that a perfect being exists, then it is possible that a perfect being exists necessarily.
3. A perfect being exists necessarily.
4. A perfect being exists.

There is no adequate translation of the premises into quantificational logic with identity. Even if we use $\exists x Px$ as a translation of the conclusion, it is not clear how to translate the adverb 'necessarily' or the expression 'it is possible that'.

**Translation Key**

Domain:	Things

$P \_$:	__ is a perfect being

One way to overcome the difficulty is to supplement the vocabulary of quantificational logic with the modal operators $\Box$ for "necessarily" and $\Diamond$ for "possibly". We may now translate the argument as follows:

1. $\Diamond \exists x Px$
2. $\Diamond \exists x Px \to \Diamond \Box \exists x Px$
3. $\Diamond \Box \exists x Px$
4. $\exists x Px$

We would now assess the validity of the argument in quantified *modal* logic. The question will now largely depend on the status of inferences of the form:
$$
\Diamond \Box \varphi \models \varphi
$$
That is the formal version of the question whether we may generally make the inference:

1. It is possible that necessarily, $\varphi$
2. Therefore, $\varphi$.

The methods of quantified modal logic will help us answer that question. We would first explain how to interpret the language of quantificational modal logic with the help of *possible worlds models*. We would then explain that an argument is valid iff it is true in every possible worlds model in which the premises are true.

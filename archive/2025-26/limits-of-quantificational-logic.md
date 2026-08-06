---
title: limits
author: Gabriel Uzquiano
description: |
  limits of quantificational logic

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---

# limits of quantificational logic

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

$P(\_)$:	__ is a perfect being

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

We could similarly devise a proof system for the language, which would allow us to derive the conclusion of a valid argument from its premises.

Example

:	Consider the argument given below:

*You will either ace or not ace the final. If you will ace the final, then since it is already true that you will, you will necessarily ace it. And if not, then since it is already true that you will not do it, you will necessarily not ace it. But if it is necessarily the case that you will ace the final, then there is no point preparing for it. On the other hand, if it is necessarily the case that you will not ace the final, then there is no point preparing for it. So, either way there is no point spending more time preparing for the final.*

Here is a first pass at a translation of this *unsound* argument:

**Translation Key**

Domain:	People and things

$R(\_,\_)$:	__ will ace  __

$S(\_,\_)$:	 __ should spend time preparing for  __

​	$a$:	you	

​	$b$:	the final exam

1. $Rab \vee \neg Rab$
2. $Rab \to \Box Rab$
3. $\neg Rab \to \Box \neg Rab$​
4. $\Box Rab \to \neg Sab$
5. $\Box \neg Rab \to \neg Sab$
6. $\neg Sab$

The question of soundness now boils down to the status of formulas:
$$
\varphi \to \Box \varphi.
$$
That again is the formal counterpart of the question of whether we are ever entitled to assume the truth of statements of the form:

1. If $\varphi$, then necessarily so.

We would be in a position to answer this question in the presence of a possible worlds semantics, which would help us interpret the formal language of quantificational modal logic.

## possible worlds

We want to provide an interpretation of modal formulas of the form $\Box \varphi$ and $\Diamond \varphi$, which are read, respectively: "it is necessary that $\varphi$" and "it is possible that $\varphi$". The key is to observe that two propositions may have the same truth value and nonetheless differ with respect to *the circumstances under which* they are true.

Example

:	Consider the contrast between the propositions expressed by the sentences:

1. Los Angeles has over 3 million inhabitants.

2. Kilimanjaro rises to 5,895 meters.

They are both true, but it is not difficult to imagine circumstances under which one would be true and the other is false. In some other cases, there may not even be any circumstances under which a proposition may be true or false:

3. The square root of 2 is a rational number.

4. There are square circles.

The modal operators $\Box$ and $\Diamond$ are designed to help us capture those differences.

In order to codify talk of circumstances under which a proposition is true or false, we introduce the concept of a *possible world*.

- A *possible world* is a complete specification of a way the world may be, one which settles every question as to how things are.

So, we may say that while the propositions expressed by 1 and 2 are true, there are possible worlds in which 1 is true but 2 is false, namely, a world in which Los Angeles is pretty much how it is now but Kilimanjaro is replaced with a geological formation that rises to fewer than 5,000 meters. And there are possible worlds in which 1 is false but 2 is true, namely, a world in which the history of the area turns out to be different and very few people settle in Los Angeles even though the geological facts surrounding Kilimanjaro remain exactly the same.

We now have the first ingredient of a possible worlds semantics for modal logic.

- We will evaluate formulas of modal logic at a possible world $w$

Once we take on board the thought that a sentence may be true when evaluated at one possible world but not at another, we may ask what is for a possible world to be *possible relative to* another. 

- $u$ *possible relative to* $v$ if the facts of the $v$ do not rule out that $u$ is a way the world might be.

The proposition that I'm a philosopher is true given how the world is, but there are possible circumstances under which I'm an engineer.  We codify that as the thought that a world at which I'm an engineer is *possible with respect to* the world of evaluation. We will call a possible world is *accessible from* another world if the former is possible with respect to the latter. 

We may momentarily focus on the language of *propositional modal logic,* which results from the addition of modal operators to propositional logic. We may now consider arguments of the form:

1. $\Diamond \Box p$
2. $p$

And we may similarly ask what it would be for a formula of the form $p \to \Box p$ to be true in a model.

We may define a possible worlds model for propositional modal logic as follows:

A possible worlds model $M$ consists of 

1. a collection of *possible worlds* $W$, 
2. an *accessibility relation* $R$ on the collection $W$, and
3. a *valuation function*, which specifies which propositions are true at what possible worlds.

Given a possible worlds model, we may declare an argument valid if, and only if, for every model $M$, for every possible world $w$ in the model $M$, if the premises are all true at $w$, then the conclusion is likewise true at $w$. And an argument is invalid if there is a model $M$ and a possible world $w$ in the model where the premises are all true while the conclusion is false.

You can experiment with possible worlds models at the [Modal Logic Playground](https://rkirsling.github.io/modallogic/), an online resource designed to introduce students to modal logic.

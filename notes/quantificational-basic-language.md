---
title: "basic quantificational language"
author: Gabriel Uzquiano
description: |
  syntax of quantificational logic

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# designators, predicates, and quantifiers

Propositional logic remains unable to account for the validity of a large family of risk-free arguments in English.

Example

:	Consider the natural language below:

> Every US citizen can travel to the UK without a visa. You are a US citizen. Therefore, you can travel to the UK without a visa.

### premise-conclusion form

1. Every US citizen can travel to the UK without a visa.
2. You are a US citizen.
3. You can travel to the UK without a visa.

### translation

**Translation Key**:

$p$:	Every US citizen is allowed to travel to the UK without a visa.

$q$:	You are a US citizen.

$r$:	You are allowed to travel to the UK without a visa.

```{.Translate .Prop system="gamutPND" submission="none"}
1. p :Every US citizen is allowed travel to the UK without a visa.
| p
```

```{.Translate .Prop system="gamutPND" submission="none"}
2. q :You are a US citizen.
|q
```

```{.Translate .Prop system="gamutPND" submission="none"}
3. r :You are allowed to travel to the UK without a visa.
|r
```

### validity

The argument is invalid because there is an assignment on which the premises are true and the conclusion false, namely, $p:T$, $q:T$, and $r:F$.

```{.TruthTable .Partial system="gamutPND" options="turnstilemark double-turnstile nodash" submission="none"}
4. p, q, r
|  T  T  F
```

That means that the argument is propositionally invalid, despite the fact that it is *risk-free*. That is, there is no risk that the conclusion is false given the truth of the premises. And it is risk-free because it exemplifies a certain form. 

1. Every $P$ is $Q$
2. $a$ is $P$
3. $a$ is $Q$

The framework of propositional logic is too coarse-grained to represent that form, which is what motivates the move to a richer language.

Here is another example of an argument, whose validity is not explained by propositional logic:

1. No US citizen is allowed to travel to the UK without a visa

2. Jones is a US citizen

3. Jones is not allowed to travel to the UK without a visa

   

4. No $P$ is $Q$

5. $a$ is $P$

6. $a$ is not $Q$

We begin with a distinction between three broad grammatical categories a subsentential expression may belong to.

## designators

We may break the second premise 'you are a US citizen' into two main constituents, namely, 'you' and the expression 'are a US citizen'. The primary function of the frst constituent, namely, 'you' is to *designate* an individual. More generally, we will use the term 'designator' to refer to expressions whose primary semantic function is to designate something.

Definition

:	A *designator* is an expression whose primary function is to designate something.

Example

:	We have highlighted the occurrences of designators in each of the sentences below:

- [Zeno]{.mark} is a Greek philosopher
- [Wednesday]{.mark} comes between [Tuesday]{.mark} and [Thursday]{.mark}
- [The Griffith Observatory]{.mark} is a historic-cultural landmark, and [it]{.mark} is free to visit.
- Someone will meet [you]{.mark} before [lunch]{.mark}
- All philosophers are curious

Notice how the pronoun 'it' is used in the last sentence to co-refer to the designation of 'The Griffith Observatory' , which is itself a designator. However, not all occurrences of a pronoun in a sentence are occurrences of a designator, e.g.,

- Something is a historic-cultural landmark, and it is free to visit.

We will discuss these occurrences of a pronoun in connection to the category of a quantifier phrase.

## predicates

In the second premise of the argument above, 'you are a US citizen', the expression 'are a US citizen' is used not to designate anything but rather to *predicate* something of you, which is to say of you that you are a certain way. 

Definition

:	A *predicate* is an expression whose primary function is to say of something that it is a certain way.

Example

:	We have highlighted the occurrences of predicates in each of the sentences below:

- Zeno [is a Greek philosopher]{.mark}
- Wednesday [comes between]{.mark} Tuesday [and]{.mark} Thursday

- The Griffith Observatory [is a historic-cultural landmark]{.mark}, and it [is free to visit]{.mark}
- Something [is a historic-cultural landmark]{.mark}, and it [is free to visit]{.mark}

- Someone [will meet]{.mark} you [before]{.mark} lunch
- All philosophers [are curious]{.mark}

Notice that a predicate expression may combine with different numbers of expressions or *arguments* as we may call them. For example, '__ is a Greek philosopher' takes one argument, whereas the predicate  '__ comes between __  and ___' takes three arguments.

### quantifier phrases

One more category of expressions is that of a *quantifier phrase*, which is an expression used to express generality. In the first premise, 'Every US citizen can travel to the UK without a visa', the expression 'every US citizen' is neither a designator nor a predicate. It is *not* a designator because it fails to denote something. Nor is it a predicate since it is not used to predicate anything of anything. Instead, it is an expression used to make a general claim, one concerned with US citizens.

Definition

:	A *quantifier phrase* is an expression used to indicate generality.

Example

:	We have highlighted the occurrences of designators in each of the sentences below:

- Zeno is a Greek philosopher
- Wednesday comes between Tuesday and Thursday

- The Griffith Observatory is a historic-cultural landmark, and it is free to visit
- [Something]{.mark}  is a historic-cultural landmark, and it is free to visit

- [Someone]{.mark} will meet you before lunch
- [All philosophers]{.mark} are curious

The expressions 'someone' and 'all philosophers' are not used to designate anything or to say of something that it is a certain way. Instead, they are used to express generality.

Quantifier expressions may bind certain occurrences of pronouns in natural language.

- [Something]{.mark}  is a historic-cultural landmark, and [it]{.mark} is free to visit

The language of quantificational logic will contain formal counterparts for each category of expressions.

# basic language

To specify the syntax, we specify:

- a *vocabulary* or stock of primitive symbols.
- a *grammar* or set of rules for the formation of formulas out of primitive symbols.



## vocabulary

The vocabulary contains three types of symbols:

Constants

:	These are the lowercase letters $a$, $b$, $c$, $d$ and $e$​​ with or without numerical subscripts:
$$
\ a, \ b, \ c, \ d, \ e, \ a_1, \ b_1, \ c_1, \ d_1, \ e_1 \ \dots
$$


Predicates

:	These are the upper case letters $P$, $Q$, $R$, $S$, and $T$​ with or without numerical subscripts:


$$
\ P, \ Q, \ R, \ S, \ T, \ P_1, \ Q_1, \ R_1, \ S_1, \ T_1 \ \dots
$$

Variables

:	These are the lowercase letters $x$, $y$, and $z$ with or without numerical subscripts:
$$
x, \ y, \ z,  x_1, \ y_1, \ z_1, \ \dots
$$

Connectives

:	These are, as usual, the symbols:
$$
\neg, \ \vee, \ \wedge, \ \to
$$

Quantifiers

:	These are two quantifier expressions:
$$
\forall, \exists
$$


Parentheses

:	There are two parentheses:
$$
),(
$$



*Nothing else* is a primitive symbol of the language.

## grammar

The grammar of quantificational logic explains how to combine these symbols into formulas of the language. 

We proceed in two stages:

Atomic Formula

:	If $P$ is a predicate with $n$ argument places and each of $\tau_1 \ \dots \ \tau_n$ is either a *constant* or a *variable*, then 
$$
P\tau_1 \dots \tau_n
$$
is an *atomic formula* or quantificational logic.

Atomic formulas are simple predications.

Example

:	The expressions below are atomic formulas of quantificational logic:
$$
Pa, Qab, Px, Qacxb, \dots
$$

Formula

:	We now define what is for a string of symbols of the language to be a *formula of quantificational logic*:

1. All atomic formulas are formulas.

1. If $\varphi$ and $\psi$ are formulas, then so are:
   $$
   \neg  \varphi, \ (\varphi \wedge \psi),  \ (\varphi \vee \psi), \ (\varphi \to \psi).
   $$


3. If $\varphi$ is a formula and $v$ is a variable, then so are:
   $$
   \forall v \varphi, \exists v \varphi
   $$
   
3. Nothing else is a formula.



Example

:	The following string of symbols is a formula of quantificational logic.
$$
(\forall x Pxy \to \exists y Qab)
$$


- By rule 2, $(\forall x Pxy \to \exists y Qab)$ is a formula if $\forall x \ Pxy$ and $\exists y \ Qab$ are each a formula.
- By rule 3, $\forall x  Pxy$ is a formula if $Pxy$ is a formula.
- By rule 3, $\exists y \ Qab$ is a formula if $Qab$ is a formula.
- By rule 1, each  $Pxy$ and $Qab$ are formulas, since they are each atomic formulas.



Example

:	The following string of symbols is a formula of quantificational logic.
$$
\forall x (Pxy \to \exists y Qab)
$$

- By rule 3, $\forall x (Pxy \to \exists y Qab)$ is a formula if $(Pxy \to \exists y \ Qab)$ is a formula.
- By rule 2, $(Pxy \to \exists y \ Qab)$ is a formula if $Pxy$ is a formula and $\exists y \ Qab$ is a formula.
- By rule 3, $\exists y \ Qab$ is a formula if $Qab$ is a formula.
- By rule 1, each  $Pxy$ and $Qab$ are formulas, since they are each atomic formulas.

### free and bound variables

We have provided a definition of *formula* for the language of quantificational logic, but we now want to make some further important distinctions between formulas.

Compare the formulas of quantificational logic:


$$
(\forall x Px \to \exists y Qxy)
$$

$$
\forall x (Px \to \exists y Qxy)
$$

Notice that the last occurrence of the variable $x$ falls outside the scope of the quantifier $\forall x$ in the first, but not in the second formula. We intend to capture the distinction by means of the definition of a *free* occurrence of a variable.

Definition

:	We define define what is for an occurrence of a variable to be *free* in a formula:

1. All occurrences of a variable in an atomic formula are *free*.

2. The *free* occurrences of a variable in formulas of the form $\varphi$ and $\psi$ remain *free* when they occur in
   $$
   \neg  \varphi, \ (\varphi \wedge \psi),  \ (\varphi \vee \psi), \ (\varphi \to \psi), \ (\varphi 
      \leftrightarrow \psi)
   $$

3. No occurrence of the variable $v$ is *free* in a formula of the form 
   $$
   \forall v \ \varphi, \ \ \exists v \ \varphi
   $$

Example

:	The first two occurrences of the variable $x$​ occur free in the following formula:
$$
(Px \to (Qxy \to \forall x Rxx))
$$

- By rule 1, $x$ occurs free in $Px$, which is an atomic formula, and, by rule 2, the occurrence remains free when it occurs in a conditional of the form $(Px \to \psi)$.
- By rule 1, $x$ occurs free in $Qxy$, which is an atomic formula, and, by rule 2, the occurrence remains free when it occurs in a formula of the form $(Qxy \to \psi)$.
- By rule 3, the last two occurrences of $x$ in $\forall x Rxx$ are not free.



An occurrence of a variable is free if it has not been captured by a quantifier. In the last example, the last two occurrences of the variable $x$ are under the scope of the universal quantifier $\forall x$, whereas the first two occurrences of the variable are not under the scope of a quantifier.



Definition

:	An occurrence of a variable in a formula is *bound* if, and only if, it is not free in that formula.



Definition

:	A variable occurs *freely* in a formula if, and only if, some of its occurrences in the formula are *free*.



Definition

:	A formula is *open* if, and only if, some variables occur freely in the formula. Otherwise, the formula is *closed*.



Definition

:	A *sentence* of quantificational logic is a closed formula of the language.

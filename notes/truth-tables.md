---
title: "truth tables"
author: Gabriel Uzquiano
description: |
  Semantics for Propositional Logic

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---

# semantics

We will use truth values to interpret the propositional variables and truth functions to interpret the connectives of the language.

## negation

The *negation* $\neg \varphi$ of a formula $\varphi$ of propositional logic is true if, and only if, $\varphi$ is false. That is because $\neg$ is a formal counterpart of 'not' and an English sentence of the form 'not $\varphi$' is true if, and only if, $\varphi$ is not true.

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
A. - p
```

$\varphi$ may itself be a complex formula:

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
B. - - q
```



## conjunction

The *conjunction* $(\varphi \ \wedge \ \psi)$ of two formulas $\varphi$ and $\psi$ is true if, and only if, $\varphi$ is true and $\psi$ is true. That is because $\wedge$ is the formal counterpart of 'and' and an English sentence of the form '$\varphi$ and $\psi$' is true if, and only if, $\varphi$ is true and $\psi$ is true.

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
C. p & q
```

$\varphi$ and $\psi$ may themselves be complex formulas:

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
D. -p & - q
```

## disjunction

The *disjunction* $(\varphi \ \vee \ \psi)$ of two formulas $\varphi$ and $\psi$ is true if, and only if, $\varphi$ is true or $\psi$ is true. That is because $\wedge$ is the formal counterpart of 'or' and an English sentence of the form '$\varphi$ or $\psi$' is true if, and only if, $\varphi$ is true or $\psi$ is true.

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
E. p \/ q
```

$\varphi$ and $\psi$ may themselves be complex formulas:

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
F. -p \/  (q & - r)
```

## conditional

The *conditional* $(\varphi \to \psi)$ with *antecedent* $\varphi$ and *consequent* $\psi$ is true if, and only if, $\varphi$ is false or $\psi$ is true. 

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
G. p > q
```

Consider the truth conditions of the sentence:

'if today is Thursday, then today is a workday'

The *antecedent* of this conditional is 'today is Thursday' and the *consequent* is 'today is a workday'. That sentence is *true* not matter when we utter it. Now:

- On Thursday, both antecedent and consequent are true. That is, it is Thursday, and it is a workday
- On Friday, the antecedent is false but the consequent is true. That is, it is *not* Thursday, but it *is* a workday.
- On Saturday, both antecedent and consequent are false. That is, it is neither Thursday nor a a workday.

To be sure, $\to$ is a formal counterpart of the English connective 'if $\dots$ , then $\dots$'. 

However, we will in what follows set aside the fact that some uses of the conditional in English appear to be non-truth-functional. Consider, for example, our attitude towards utterances of the sentence:

- 'if there is an elephant in the room, then I will win the lottery tomorrow' 

You may be tempted to regard the sentence as false, despite the falsity of the antecedent, on the grounds that there appears to be no link between antecedent and consequent. The official line, however, is to treat the sentence much how we would treat:

- 'it is not the case that there is an elephant in the room or I will win the lottery tomorrow'.

This sentence would be true in a circumstance in which I win the lottery tomorrow but it would be difficult to imagine a context in which an utterance of that sentence makes a felicitous contribution to a conversation. Many, however, are inclined to offer a pragmatic explanation of the phenomenon, one which may carry over to the original case.

The treatment of the conditional generalizes to cover more complex sentences:

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
H. (p & q) > - r
```



### truth tables

We want to calculate the truth value of a complex formula in terms of the truth values of the propositional letters that occur in the formula.

Definition

:	An *assignment* for propositional logic maps each propositional variable into a truth value.

We use a truth table in order to calculate the truth value of a complex formula *under an assignment* of truth values to the propositional variables in the formula.

If a formula includes two propositional letters, e.g., $(p \to (q \to p))$, then there are at most four assignments of truth values to the propositional letters in the formula:

```{.TruthTable .Simple system="gamutPND" options="nocounterexample" submission="none"}
A. (p > (q > p))
```

On the other hand, if a formula includes three propositional letters, e.g., $(p \to (q \to r))$, then we have eight assignments to consider:

```{.TruthTable .Simple system="gamutPND" options="nocounterexample" submission="none"}
B. (p > (q > r))
```

More generally, if a formula includes $n$ propositional letters, then we will have $2^n$ assignments to consider. 

Because truth tables can become complex and unwieldy as more propositional letters are involved in a formula, we want to devise a *systematic* method for constructing a truth table for a formula.

1. We draw a column for each propositional letter occurring in the formula, which we list in alphabetical order.

2. Given $n$ propositional letters, we draw $2^n$ rows, one for each assignment of truth values to the propositional letters.

   We populate the rows as follows:

   - Start with the $n$th innermost column for a propositional letter and alternate one occurrence of '$T$' with one of '$F$'.
   - For the column immediately on the left, we alternate $2^1$ occurrences of '$T$' with $2^1$ occurrences of '$F$'. 
   - For the column immediately on the left, we alternate $2^2$ occurrences of '$T$' with $2^2$ occurrences of '$F$'.
   - $\cdots$
   - For the first column now, we alternate  $2^{n}$ occurrences of '$T$' with $2^{n}$ occurrences of '$F$'. 

3. We populate the rest of columns in accordance with the rules governing truth under an assignment.



Here are some examples of truth tables for complex formulas of propositional logic.

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
C. p & (q \/ - r)
```

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
D. (p > q) & (q \/ r)
```

## tautologies and contradictions

Definition

:	A formula $\varphi$ is a *tautology* if, and only if, it is true under every assignment.

Example

:	The formula $(p \to \neg q) \vee (q \to p)$ is a tautology.

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
E. (p > - q) \/ (q > p)
```

If a formula is *not* a tautology, then we can provide an assignment under which the formula is false.

Example

:	The formula $(p \to - q) \to (q \to p)$ is *not* a tautology.

```{.TruthTable .Simple system="gamutPND" counterexample-to="tautology" options="autoAtoms" submission="none"}
F. (p > -q) > (q > p)
```



Definition

:	A formula $\varphi$ is a *contradiction* if, and only if, it is false under every assignment.

Example

:	The formula $(p \wedge q) \wedge \neg q$ is a contradiction.

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
G. (p & q) & - q
```

If a formula is *not* a contradiction, then we can provide an assignment under which the formula is true.

Example

:	The formula $(p \to \neg q)$ is *not* a contradiction.

```{.TruthTable .Simple system="gamutPND" counterexample-to="contradiction" options="autoAtoms" submission="none"}
H. p > - q
```

## equivalence

Definition

:	Two formulas $\varphi$ and $\psi$ are *equivalent* if, and only if, they are true under exactly the same assignments.

Example

:	The formulas $p \to q$ and $\neg (p \wedge \neg q)$ are *equivalent*.

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
I. p > q, -(p & - q)
```

On the other hand, if two formulas are *not* equivalent, then we can provide an assignment on which one is true and the other is false.

Example

:	The formulas $p \to  q$ and $q \to  p$ are *not* equivalent.

```{.TruthTable .Simple system="gamutPND" counterexample-to="equivalence" options="autoAtoms" submission="none"}
J. p > q, q > p
```



## consistency

Definition

:	A set of formulas $S$ is *consistent* if, and only if, there is at least on assignment under which they are all true.

Example

:	The set $\{p \to q, q \to r, r \to \neg p\}$ is *consistent*.

```{.TruthTable .Simple system="gamutPND" counterexample-to="inconsistency" options="autoAtoms" submission="none"}
K. p > q, q > r, r > -p
```

On the other hand, if a set of formulas is inconsistent, then there is no assignment under which they are all true.

Example

:	The set $\{p, p \to q, q \to \neg p\}$ is inconsistent.

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
L. p, p > q, q > - p
```




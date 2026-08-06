---
title: formal languages and logic
author: Gabriel Uzquiano
description: |
  formal languages and logic

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# basic language

To make progress with the question of validity, we will now introduce the language of propositional logic. This is a formal language within which we will be able to isolate and study a family of valid argument forms.

## quotation

In order to discuss different aspects of natural language, we often mention some of its expressions. One way to do this is through the use of quotation marks. By way of illustration, consider the contrast:

- 'Los Angeles' is composed of two words
- Los Angeles is composed of more than eighty cities

The use of quotation marks makes sure the first sentence predicates something of a linguistic expression rather than the city designated by that expression. The same linguistic expression is *used* in the second sentence to predicate something of the city it designates, namely, the fact that it is composed of more than eighty cities. In the first sentence, the linguistic expression is merely *mentioned* in order to predicate something of it.

In order to explore the distinction, please add quotation marks to each sentence below in order to produce a *true* statement. 

Please select any true statements below.

```{.QualitativeProblem .MultipleSelection options="check" submission="none"}
A.
| I is a Roman numeral for '1'
|+'I' is a Roman numeral for 1
| I is a Roman numeral for 1
|'I' is a Roman numeral for '1'
```



```{.QualitativeProblem .MultipleSelection options="check" submission="none"}
B. 
| England is part of 'New England'
|*'England' is part of 'New England'
| 'England' is part of New England
```



```{.QualitativeProblem .MultipleSelection options="check" submission="none"}
C.
| 'England' is not part of 'New England'
|* England is not part of 'New England'
|* England is not part of New England
```

## form and meaning

There is a link between validity and the meaning of some sentential connectives of English. 

Example

:	The validity of the following form is due to the meaning of the word 'and':

1. $p$ and $q$.
2. Therefore, $q$.

There is no way to construct an instance of the argument with true premises and a false conclusion. To explain the link between the validity of the argument form and the meaning of the word 'and', note that

- The truth value of a sentence of the form 

  <img width="40"/> $p$ and $q$ 

  is **a function of** the truth values of the simpler constituents $p$ and $q$:

  ```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
  1. p & q
  ```

- A sentence of the form 

  <img width="40"/> $p$ and $q$ 

  is true only if both $p$ is true and $q$ is true. If 

  <img width="40"/> $p$ and $q$

  is true, then $q$ *must be* true as well. 

If the premise of an argument of the form given above is true, then since both constituents are true, the latter constituent must be true. So, if the premises are true, then the conclusion must be true as well. 

## truth-functional connectives

We will now place the focus on valid argument forms, whose validity is explained in terms of the semantic behavior of sentential connectives such as

1. 'not' 

   We will use the symbol $\neg$ for the word 'not' and rewrite 'not $p$' as: $\neg p$

2. 'or' 

   We will use the symbol $\vee$ for the word 'or' and rewrite '$p$ or $q$' as: $(p \vee q)$.

3. 'and' 

   We will use the symbol $\wedge$ for the word 'and' and rewrite '$p$ and $q$' as: $(p \wedge q)$.

4. 'if ..., then ...' 

   We will use the symbol $\to$ for the word 'and' and rewrite 'if $p$, then $q$' as: $(p \to q)$.

What these connectives have in common is that the truth value of a sentence constructed in terms of them is a function of the truth values of their constituents, e.g.,

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
2. (p \/ q)
```

```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
3. - p
```

The truth tables for these connectives are responsible for the validity of the argument form:

1. $p \vee q$.
2. $\neg p$.
3. Therefore, $q$.



## basic language

To specify the language of propositional logic, we will now specify:

- a *vocabulary* or stock of primitive symbols.
- a *grammar* or set of rules for the formation of formulas out of primitive symbols.

## vocabulary of propositional logic

The vocabulary contains three types of symbols:

**Propositional Variables** 

:	Lowercase letters $p$, $q$, $r$, $s$ and $t$ with or without numerical subscripts:

<img width="40"/>
$$
p, \ q, \ r, \ s, \ t, \ p_1, \ q_1, \ r_1, \ s_1, \ t_1 \ \dots
$$

**Connectives**. 

:	These are four connectives:

<img width="40"/>
$$
\neg, \ \vee, \ \wedge, \ \to
$$

Some presentations of the language include a further symbol $\leftrightarrow$ for '... if, and only if, ...'. 

In contrast to them, we will eventually introduce the symbol as a device for abbreviation.

**Parentheses**. 

:	There are two parentheses:

<img width="40"/>
$$
),(
$$

*Nothing else* is a primitive symbol of the language.

In particular, notice that uppercase letters such as '$A$', '$B$', '$C$', etc, are not part of the vocabulary of the language. Nor are metavariables of the form '$\varphi$' or '$\psi$' part of the official vocabulary, even though we will sometimes use them to describe the language from outside. 

## grammar

We now define what is for a string of symbols of the language to be a *sentence* or *formula* of propositional logic:

1. All propositional variables are formulas.

1. If $\varphi$ and $\psi$ are formulas, then so are:
   $$
   \neg  \varphi, \ (\varphi \ \wedge \ \psi),  \ (\varphi \ \vee \ \psi), \ (\varphi \ \to \ \psi).
   $$


3. Nothing else is a formula.

Let us use the definition of formula of in order to discern whether each string of symbols below is a sentence of the language.

The crucial clause is the second one, which enables us to combine formulas into even more complex formulas. In particular:

Example

:	If  $\dots ^1\dots$ is a formula, then $\neg \dots^1 \dots$ is a formula.

- If $p$ is a formula, then $\neg p$ is a formula.
- If $\neg p$ is a formula, then $\neg \neg p$ is a formula.
- If $\neg \neg p$ is a formula, then $\neg \neg \neg p$ is a formula
- Etc.

 Example

:	If $\dots^1 \dots$ is a formula and $\dots^2 \dots$ is a formula, then $(\dots ^1 \dots\ \wedge \ \dots^2 \dots)$ is a formula.

- If $\neg p$ is a formula and $\neg \neg q$ is a formula, then $(\neg p \ \wedge \ \neg \neg q)$ is a formula.
- If $(p \ \wedge \ q)$ is a formula and $\neg \neg q$ is a formula, then $((p \ \wedge \ q) \ \wedge \ \neg \neg q)$ is a formula
- If $(p \ \wedge \ q)$ is a formula and $(r \ \wedge \ t)$ is a formula, then $((p \ \wedge \ q) \ \wedge \ (r \ \wedge \ t))$ is a formula.
- Etc

The only difference is that the official characterization of a formula uses Greek letters $\varphi$, $\psi$, etc in place of $\dots^1 \dots$, $\dots^2 \dots$, etc

A. $(p \ \wedge \ \neg q)$ 

This is a *formula* of the language.

- By rule 2, $(p \ \wedge \ \neg q)$  is a formula **if** $p$ is a formula ✅ and $\neg q$ is a formula ✅.
  - By rule 1, $p$ is a formula. 
  - By rule 2, $\neg q$  is a formula **if** $q$ is a formula ✅.
    - By rule 1, $q$ is a formula.


We will now draw a construction tree for the formula, which illustrates how it has been constructed from simpler constituents.

```{.SynChecker .Match system="gamutIPND" options="check" submission="none"}
A. (p & - q)
```



B.	$((p \to q) \ \vee \ (q \ \to \ (r \ \wedge \ s) ))$

This is a *formula* of the language.

- By rule 2, $((p \to q) \ \vee \ (q \ \to \ (r \ \wedge \ s) ))$ is a formula **if** $(p \to q)$ is a formula ✅ and $(q\to (r \ \wedge \ s))$  is a formula ✅.

  - By rule 2, $(p \to q)$ is a formula **if** $p$ is a formula ✅. and $q$ is a formula. ✅.

  - By rule 2, $(q \ \to \ (r \ \wedge \ s))$ is a formula **if** $q$ is a formula ✅ and $(r \ \wedge \ s)$ is a formula ✅.

    - By rule 2, $(r \ \wedge \ s)$ is a formula **if** $r$ is a formula ✅ and $s$ is a formula ✅.

      


Here is a construction tree for the formula:

```{.SynChecker .Match system="gamutIPND" options="check" submission="none"}
B. (p \/ (q -> (r & s)))
```



C.	$\neg A$

This is *not* a formula of the language.

- By rule 2, $\neg A$  is a formula **if** $A$ is one ❌.

  - By rule 3, $A$ is *not* a formula.

- By rule 3, $\neg A$ is not a formula. 

  The letter '$A$' is not even part of the vocabulary of propositional logic.



D.	$((p \ \wedge \ q))$

This is *not* a formula of the language.

- By rule 2, $((p \ \wedge \ q))$ is a formula **if** $(p$ is a formula ❌ and $q)$ is a formula ❌.
  - By rule 3, $(p$ is *not* a formula.

- By rule 3, $((p \ \wedge \ q))$ is not a formula.



E.	$((p \ \vee \ q) \to (q \ \wedge \ \neg r))$

This is a formula of the language.

- By rule 2, $((p \ \vee \ q) \to (q \ \wedge \ \neg r))$ is a formula **if** $(p \ \vee \ q)$ is a formula ✅, and $(q \ \wedge \ \neg r)$ is a formula ✅.
  - By rule 2, $(p \ \vee \ q)$ is a formula **if** $p$ is a formula ✅ and $q$ is a formula ✅.
  - By rule 2, $(q \ \wedge \ \neg r)$ is a formula **if** $q$ is a formula ✅ and $\neg r$ is a formula.
    - By rule 2, $\neg r$ is a formula **if** $r$ is a formula ✅.

Here is a construction tree for the formula:

```{.SynChecker .Match system="gamutIPND" options="check" submission="none"}
C. ((p \/ q) > (q & - r))
```

D.	$(\varphi \ \to \ \psi)$

This is *not* a formula of the language.

By rule 2, $(\varphi \ \to \ \psi))$ is a formula **if** $\varphi$ is a formula ❌ and $\psi$ is a formula ❌.

- By rule 3, $\varphi$ is *not* a formula. 

  Greek letters are not even part of the vocabulary of propositional logic. 

## a notational convention

For ease of expression, we will adopt a further notational conventions which will allow us to simplify notation. This is *not* meant as a revision of the official characterization of formula as it is not part of the official syntax of the language. Instead, we simply use certain expressions as abbreviations for the official formulas of the language.

Notational Convention

:	We may remove the outer parentheses of a formula that is not part of another formula.

Example

:	We will write  $p \wedge q$ as an **abbreviation for** the formula 

$(p \ \wedge \ q)$.

Example

:	We will write $q \ \to \ (r \ \wedge \ t)$ as an **abbreviation for** the formula 

$(q \ \to \ (r \ \wedge \ t))$.



On the other hand, none of the following formulas abbreviate formulas of propositional logic.

Example

:	$p \ \wedge \ q \ \vee \ r$ is **not** an abbreviation for a formula of propositional logic. This is because we do **not** obtain a formula when we add outer parenthesis to form: 

$(p \ \wedge \ q \ \vee \ r)$

Example

:	$p \ \to \ q \ \wedge \ r$ is **not** an abbreviation for a formula of propositional logic. This is because we do **not** obtain a formula when we add outer parenthesis to form: 

$(p \ \to \ q \ \wedge \ r)$






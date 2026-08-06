---
title: "validity"
author: Gabriel Uzquiano
description: |
  Syntax of Propositional Logic

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# validity

We began the study of propositional logic with a main goal in mind, namely, to provide a framework within which to assess the validity of argument forms exemplified by natural language arguments. 

Example

:	Consider the argument:

1. If mica is a metal, then it conducts electricity.
2. Mica does not conduct electricity.
3. Mica is not a metal

On a first approximation, we may regard the argument to exemplify the form:

1. $p \to q$
2. $\neg q$
3. $\neg p$

Notice that this is now an argument of propositional logic, and the question of whether the argument form is valid reduces to the question of whether the argument is valid in propositional logic.

Definition

:	An argument of propositional logic is *valid* if, and only if, there is no assignment of truth values to the propositional variables on which the premises are true while the conclusion is false.

Example

:	Below is a *valid* argument of propositional logic.

1. $p \to q$
2. $\neg q$
3. $\neg p$

The reason is that there is *no* row in the truth table for the argument on which both premises come out true and the conclusion false.

```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="turnstilemark double-turnstile nodash autoAtoms" submission="none"}
A. p > q, -q :|-: -p
```

If an argument is *invalid*, then we can provide an assignment under which the premises are true and the conclusion is false.

Example

:	Below is an *invalid* argument of propositional logic.

1. $p \to q$
2. $\neg p$
3. $\neg q$

The third row of the truth table determines an assignment on which the premises come out true and the conclusion false.

```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="turnstilemark double-turnstile nodash autoAtoms" submission="none"}
B. p > q, -p :|-: -q
```



Example

:	Below is an *invalid* argument of propositional logic.

1. $p \vee q$
2. $p \to \neg r$
3. $\neg r \vee p$

The fifth row of the truth table determines an assignment on which the premises come out true and the conclusion false.

```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="turnstilemark double-turnstile nodash autoAtoms" submission="none"}
C. p\/q, p>-r :|-: -r\/p
```



## how to search for a counterexample

In order to determine the validity of an argument, we have focused on assignments to the propositional variables on which the premises come out true in search for a counterexample. This method is particularly helpful when confronted with arguments with a large number of propositional variables making the truth table rather complex. 

Example

: 	Below is another *invalid* argument.

1. $p \to ((q \wedge \neg r) \vee (r \wedge q))$
2. $p \wedge q$
3. $r \vee \neg p$
4. $\neg q \to r$

A close look at the argument shows that there are just two candidate rows to consider, namely, the *first* and  *fifth* row of the truth table for the argument. Those correspond to the only two assignments on which the conclusion comes out false. One of those, namely, the first row is one on which the premises come out true and the conclusion false. So, we conclude that the argument is invalid.

When asked for an assignment on which the premises come true and the conclusion false, we may now input T T T, which is the assignment on which all three propositional variables are true. 

```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="autoAtoms turnstilemark double-turnstile" submission="none"}
D. p->((q&-r)\/(r&q)), p&q, r\/-p :|-: q->-r
```

We may even do this with a *partial* truth table

```{.TruthTable .Partial system="gamutPND" options="turnstilemark double-turnstile nodash" submission="none"}
D.1. p->((q&-r)\/(r&q)), p&q, r\/-p, q->-r
```

This truth table includes a column for each premise followed by a column for the conclusion, and the question is whether we *can* find a way to fill out the row to make the premises true and the conclusion false. The assignment we used above, namely, TTT, will do for that purpose.



Example

:	Below is another *invalid* argument.

1. $p \vee q$
2. $\neg r \to q$
3. $p \to r$



```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="autoAtoms turnstilemark double-turnstile" submission="none"}
E. p \/ q, -r > -q :|-: p > r
```

In this case, there is an assignment on which the premises are true and the conclusion false, namely, the assignment corresponding to the fourth row of the truth table: TFF.

We may again make do with a *partial* truth table

```{.TruthTable .Partial system="gamutPND" options="turnstilemark double-turnstile nodash" submission="none"}
E.1. p \/ q, -r > -q, p > r
```

This truth table includes a column for each premise followed by a column for the conclusion, and the question is whether we *can* find a way to fill out the row to make the premises true and the conclusion false. The assignment we used above, namely, TFF, will do for that purpose.



## propositional validity

We are now in a position to revisit the question of validity for arguments initially phrased in English.

Example

:	Consider the argument below

1. The mind nothing over and above the brain.
2. If the mind is nothing over and above the brain, then the mind is mortal.
3. The mind is mortal

This argument exemplifies the form:

1. $p$
2. $p \to q$
3. $q$

Here we let $p$ stand  for 'the mind is nothing over and above the brain' and $q$ stand for 'the mind is mortal'.

We are now in a position to justify the validity of that form by means of a truth table:

```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="autoAtoms turnstilemark double-turnstile" submission="none"}
F. p, p > q :|-: q
```

The reason being that there is no assignment, that is, no row of the truth table on which the premises are true and the conclusion is false.



Example

: 	Consider now the argument

1. You didn't turn the ignition
2. If you turned the ignition, then the car started
3. The car didn't start

This argument exemplifies the form:

1. $\neg p$
2. $p \to q$
3. $\neg q$

Here we let $p$ stand for 'you turned the ignition' and $q$ for 'the car will start'.

We are now able to justify the invalidity of that form by means of a truth table:

```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="autoAtoms turnstilemark double-turnstile" submission="none"}
G. -p, p > q :|-: -q
```

Note that there is one assignment, namely, the one corresponding to the third row of the truth table on which the premises come out true and the conclusion false. So, the argument is invalid in propositional logic, and consequently, the initial natural language argument is propositionally invalid.


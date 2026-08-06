---
title: "translation"
author: Gabriel Uzquiano
description: |
  Syntax of Propositional Logic

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# translation

We know how to use truth tables in order to assess the validity of arguments couched in the language of propositional logic. But in order to assess the validity of natural language arguments, we need to translate their premises and conclusions into the language of propositional logic. 

Example

:	Consider the argument:

> *The British are coming by sea. For if they are coming by land, then Paul Revere should light two lamps. And if the British are not coming by land, then they are coming by sea. However, Paul Revere did not light two lamps.*

In premise-conclusion form:

1. If the British are coming by land, Paul Revere should light two lamps.
2. If the British are not coming by land, then they are coming by sea.
3. Paul Revere did not light two lamps.
4. The British are coming by sea.

When translated into the language of propositional logic, the argument will eventually read:

1. $p \to q$
2. $\neg p \to r$
3. $\neg q$
4. $r$

Translation Key

$p$ :	The British are coming by land

$q$:	Paul Revere lights two lamps

$r$:	The British are coming by sea



How should we proceed? We will break down the task of translation into three main steps:

1. paraphrase the target sentence to reveal how it has been constructed from simpler sentences by means of truth-functional connectives such as 'not', 'and', 'or', and 'if ... then ...'

2. replace each truth-functional connective with the formal counterpart in propositional logic

3. replace the simplest sentences that remain with propositional variables

   

We will now apply the method to the taks at hand

## paraphrase

The first step is to rephrase the sentences in order to reveal how they have been constructed from simple sentences by means of truth-functional connectives.

We will use parentheses in order to highlight how the sentence has been constructed from simpler sentences.

Thus:

1. ([<span style="color: red;">**If**</span>]{.underline} the British are coming by land, [**<span style="color: red;">then</span>**]{.underline} Paul Revere is supposed to light two lamps).
2. ([**<span style="color: red;">If</span>**]{.underline} the British are **<span style="color: red;">not</span>** coming by land, [**<span style="color: red;">then</span>**]{.underline} they are coming by sea.)
3. Paul Revere did [**<span style="color: red;">not</span>**]{.underline} light two lamps.
4. The British are coming by sea.

## propositional connectives

We replace the occurrences of the truth-functional connectives with the symbols for their counterparts in propositional logic. That is, in general, we replace:

- occurrences of 'not' with $\neg$.

- occurrences of 'and' with $\wedge$.

- occurrences of 'or' with $\vee$.

- occurrences of 'if $\dots$, then $\dots$' with $\to$.


Thus:

1. (The British are coming by land $\to$ Paul Revere will light two lamps).

2. ($\neg$ The British are coming by land $\to$ The British are coming by sea).

3. $\neg$ Paul Revere lit two lamps.

4. The British are coming by sea.

## propositional variables

We choose a propositional variable for each simple sentence and we proceed to substitute an occurrence of the propositional variable for each occurrence of the simple sentence in the target sentence. In the case at hand, we choose the following translation key:

**translation key**:

$p$:	The British are coming by land

$q$:	Paul Revere lights two lamps

$r$:	The British are coming by sea



Given the key, the first premise translates into the following sentence of propositional logic:

```{.Translate .Prop system="gamutPND" submission="none"}
1. p > q: If the British are coming by land, then Paul Revere should light two lamps
```



The second premise now becomes:

```{.Translate .Prop system="gamutPND" submission="none"}
2. -p > r: If the British are not coming by land, then they are coming by sea
```



The last premise, on the other hand, translates into a simple sentence of propositional logic:

```{.Translate .Prop system="gamutPND" submission="none"}
3. -q: Paul Revere did not light two lamps
```



The conclusion of the argument becomes:

```{.Translate .Prop system="gamutPND" submission="none"}
4. r: The British are coming by sea
```



The outcome of translation is an argument in the language of propositional logic:

1. $p \to q$
2. $\neg p \to r$
3. $\neg q$
4. $r$



But we now know how to determine whether the argument is valid:

```{.TruthTable .Validity .Partial system="gamutPND" counterexample-to="validity" options="autoAtoms turnstilemark double-turnstile" submission="none"}
A. p > q, -p > r, -q :|-: r
```



Example

:	Consider the argument:

> *Interest rates will rise or they will stay the same. If interest rates rise, then inflation will not rise. But if they stay the same, then inflation will rise. Inflation will not rise. Therefore, interest rates will rise.*

In premise-conclusion form:

1. Interest rates will rise or they will stay the same.
2. If interest rates rise, then inflation will not.
3. If they stay the same, then inflation will rise. 
4. Inflation will not rise.
5. Interest rates will rise.

On to the task of translation, we follow the three steps mentioned above:

## paraphrase

We first reveal how each sentence has been constructed from simpler sentences by means of truth-functional connectives.

1. (Interest rates will rise [<span style="color: red;">**or**</span>]{.underline} interest rates will stay the same)
2. ([<span style="color: red;">**If**</span>]{.underline} interest rates rise, [<span style="color: red;">**then**</span>]{.underline} inflation will **<span style="color: red;">not</span>** rise)
3. ([<span style="color: red;">**If**</span>]{.underline} interest rates stay the same, [<span style="color: red;">**then**</span>]{.underline} inflation will rise)
4. Inflation will [<span style="color: red;">**not**</span>]{.underline} rise
5. Interest rates will rase

## propositional connectives

We now replace occurrences of truth-functional connectives by connectives of propositional logic.

1. (Interest rates will rise $\vee$ interest rates will stay the same)

2. (Interest rates rise $\to$ $\neg$ inflation will rise)

3. (If interest rates stay the same $\to$ inflation will rise)

4. $\neg$ Inflation will rise

5. Interest rates will rase

   

## propositional variables

We finally replace the simplest sentences with propositional variables and we specify a translation key:

**translation key**:

$p$:	Interest rates will rise

$q$:	Interest rates will stay the same

$r$:	Inflation will rise



```{.Translate .Prop system="gamutPND" submission="none"}
5. p \/ q: Interest rates will rise or they will stay the same
```



```{.Translate .Prop system="gamutPND" submission="none"}
6. p > -r: If interest rates rise, then inflation will not rise
```



```{.Translate .Prop system="gamutPND" submission="none"}
7. q > r: If interest rates stay the same, then inflation will rise
```



```{.Translate .Prop system="gamutPND" submission="none"}
8. -r: Inflation will not rise
```



```{.Translate .Prop system="gamutPND" submission="none"}
9. p: Interest rates will rise
```

Here is the argument that results:

1. $p \vee q$
2. $p \to \neg r$
3. $q \to r$
4. $\neg r$
5. $p$



We are now in a position to determine whether the argument is valid:



```{.TruthTable .Validity .Partial system="gamutPND" options="autoAtoms turnstilemark double-turnstile" submission="none"}
B. p \/ q, p > -r, q > r, -r :|-: p
```





## issues with translation

Some issues require special discussion.

### structural ambiguity

One of the reasons why we moved to a formal language is that English is fraught with ambiguity. Sometimes the ambiguity is *lexical*, e.g., 'I will wait for you near the bank'. In other cases, the ambiguity is *structural* and concerns the way in which the sentence has been constructed from simpler sentences with the help of truth-functional operators.

Example

:	Consider the English sentence:

- The British are coming and Paul Revere will light one lamp or he will light two lamps.

When we aim to paraphrase the sentence to reveal how it has been constructed from simpler sentences by means of truth-functional operators, we find that there are at least two options:

- ((The British are coming **<span style="color: red;">and</span>** Paul Revere will light one lamp) [<span style="color: red;">**or**</span>]{.underline} Paul Revere will light two lamps)

- (The British are coming [<span style="color: red;">**and**</span>]{.underline} (Paul Revere will light one lamp **<span style="color: red;">or</span>** Paul Revere will light two lamps))


The first option identifies **or** as the main connective whereas the second identifies **and** as the main connective.

Which is it?

The answer is that the original sentence is *structurally ambiguous* between those two interpretations, and when face with such ambiguities, we should highlight it and explain what the options are. For they each translate differently into the language of propositional logic.



**translation key**:

$p$:	The British are coming

$q$:	Paul Revere will light one lamp

$r$:	Paul Revere will light two lamps



There are two translations corresponding to each of the readings:

- $((p \ \wedge \ q) \ \vee \ r)$
- $(p \ \wedge \ (q \ \vee \ r))$

Notice that these sentences are *not* logically equivalent: they receive different truth values when we make $p$ and $q$ false and we make $r$ true.

```{.TruthTable .Partial system="gamutPND" options="autoAtoms" submission="none"}
C. (p & q) \/ r, p & (q \/ r)
```

So, we must disambiguate in order to indicate the availability of the two readings for the original sentence. 

### special phrases

How much force should we apply to the original sentence in order to make clear how the sentence is constructed from simpler sentences by means of the truth-functional connectives? Some phrases require special discussion.

### neither ... nor ...

Example

:	Paul Revere will light  [**<span style="color: red;">neither</span>**]{.underline} one lamp  [**<span style="color: red;">nor</span>**]{.underline} two lamps

It is not obvious how to paraphrase a sentence of that form into one built from simpler sentences by means of one of the four truth-functional connectives we singled out at the outset. The sentence in question should have exactly the same truth conditions as the target sentence.

There are at least two options:

- (Paul Revere will light  **<span style="color: red;">not</span>** light one lamp [**<span style="color: red;">and</span>**]{.underline} Paul Revere will  **<span style="color: red;">not</span>** light two lamps)
- It is [**<span style="color: red;">not</span>**]{.underline} the case that (Paul Revere will light one **<span style="color: red;">or</span>** two lamps)

Both paraphrases are acceptable as they match the truth conditions of the target sentence exactly.

That means that there are at least two acceptable translations of the original sentence:

**translation key**:

$p$:	Paul Revere will light one lamp

$q$:	Paul Revere will light two lamps

```{.Translate .Prop system="gamutPND" submission="none"}
D. -p & -q: Paul Revere will light neither one lamp nor two lamps.
```

### only if

Despite the superficial similarity between the phrases 'only if' and 'if', they achieve very different effects in English. 

Example

:	Paul Revere will light two lamps *only if* the British are coming by sea.

This sentence conveys the fact that the British *must* be coming by sea in order for Paul Revere to light two lamps, which means that coming by sea is *necessary* for lighting two lamps. 

Compare with the sentence 'I will win the lottery *only if* I buy a ticket'. The purchase of a ticket is a **necessary condition** for me to win the lottery. On the other hand, if I say 'I will win the lottery *if* I buy a ticket', then I would be conveying something false, namely, that the purchase of a ticket is **sufficient** for me to win the lottery.

Example

:	Paul Revere will light two lamps *if* the British are coming by sea.

This sentence assures us that Paul Revere will light two lamps on the assumption the British are coming by sea, which means that coming by sea is *sufficient* for lighting two lamps. (Compare with the sentence 'I will win the lottery *if* I buy a ticket'.)

The two sentences above very different truth conditions and should be given different paraphrases. Start with the first:

Example

:	Paul Revere will light two lamps *only if* the British are coming by sea.

This should be paraphrased as:

- ([**<span style="color: red;">If</span>**]{.underline} Paul Revere will light two lamps, [**<span style="color: red;">then</span>**]{.underline} the British will have come by sea)

**translation key**:

$p$:	Paul Revere will light two lamps

$q$:	The British come by sea

```{.Translate .Prop system="gamutPND" submission="none"}
E. p > q: Paul Revere will light two lamps only if the British are coming by sea.
```

On the other hand, consider the other sentence.

Example

:	Paul Revere will light two lamps *if* the British come by the sea.

This should be paraphrased as:

- ([**<span style="color: red;">If</span>**]{.underline} the British come by the sea, [**<span style="color: red;">then</span>**]{.underline} Paul Revere will light two lamps)

```{.Translate .Prop system="gamutPND" submission="none"}
F. q > p: Paul Revere will light two lamps if the British are coming by sea.
```

### if, and only if, 

Once we know how to paraphrase 'only if',  we are in a position to deal with 'if, and only if'.

Example

:	Paul Revere will light two lamps if, and only if, the British are coming by sea.

The proposal is to analyze this sentence as a conjunction of two simpler sentences:

- (Paul Revere will light two lamps **<span style="color: red;">if</span>** the British are coming by sea) [**<span style="color: red;">and</span>**]{.underline} (Paul Revere will light two lamps **<span style="color: red;">only if</span>** the British are coming by sea),
- (**<span style="color: red;">If</span>** the British are coming by sea, **<span style="color: red;">then</span>** Paul Revere will light two lamps) [**<span style="color: red;">and</span>**]{.underline} (**<span style="color: red;">if</span>** Paul Revere lights two lamps, **<span style="color: red;">then</span>** the British are coming by sea.)

**translation key**:

$p$:	Paul Revere will light two lamps

$q$:	The British are coming by sea

```{.Translate .Prop system="gamutPND" submission="none"}
G. (q > p) /\ (p > q): Paul Revere will light one lamp if, and only if, the British are coming by sea.
```

We will sometimes use the symbol $\leftrightarrow$ in order to abbeviate formulas of that form. In general:
$$
(\varphi \leftrightarrow \psi) := (\varphi \to \psi) \wedge (\psi \to \varphi).
$$
It would be acceptable to use that symbol as an abbreviation as we translate from English:

```{.Translate .Prop system="gamutPND" submission="none"}
H. (p <-> q): Paul Revere will light two lamps if, and only if, the British are coming by sea.
```



### unless

Example

:	Paul Revere will light one lamp unless the British are coming by sea.

We want to paraphrase this sentence into one built from simpler sentences by means of one of the four truth-functional connectives. There is again more than one option.

There is first the option to paraphrase 'unless' in terms of 'if not':

- Paul Revere will light one lamp [**<span style="color: red;">if</span>**]{.underline} the British are **<span style="color: red;">not</span>** coming by sea
- ([**<span style="color: red;">if</span>**]{.underline} the British are **<span style="color: red;">not</span>** coming by sea,  [**<span style="color: red;">then</span>**]{.underline} Paul Revere will light one lamp.)



**translation key**:

$p$:	The British are coming by sea

$q$:	Paul Revere will light one lamp

```{.Translate .Prop system="gamutPND" submission="none"}
D. -p > q: Paul Revere will light one lamp unless the British are coming by sea.
```

Equivalently, we may paraphrase the target sentence with the help of 'or':

- (Paul Revere will light one lamp [**<span style="color: red;">or</span>**]{.underline} the British are coming by sea.)

```{.Translate .Prop system="gamutPND" submission="none"}
D. p \/ q: Paul Revere will light one lamp unless the British are coming by sea.
```


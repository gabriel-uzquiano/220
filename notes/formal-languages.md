---
title: "formal languages and logic"
author: Gabriel Uzquiano
description: |
  formal languages and logic

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# formal languages and logic

To make progress with the question of validity, we will now introduce a formal language, whose main purpose is to help us isolate and study an important family of valid argument forms centered on the behavior of a certain set of sentential connectives.

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

We should now make explicit the link between the validity and the meaning of an important family of sentential connectives of English. 

Example

:	The validity of the following form is due to the meaning of the word 'and':

1. $p$ and $q$.
2. Therefore, $q$.

There is no way to construct an instance of the argument with true premises and a false conclusion. To explain the link between the validity of the argument form and the meaning of the word 'and', note that

- The truth value of a sentence of the form '$p$ and $q$' is a function of the truth values of the simpler constituents $p$ and $q$:

  ```{.TruthTable .Simple system="gamutPND" options="nocounterexample autoAtoms" submission="none"}
  1. p & q
  ```

- A sentence of the form '$p$ and $q$' is true only if both $p$ is true and $q$ is true. So, if '$p$ and $q$' is true, then $q$ *must be* true.

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



## how to specify a formal language

The formal language we will introduce is in some respects less complicated than natural languages such as English. You may even conceive of it as a *model* of natural language, one which will study the contribution of connectives like 'not', 'or', etc to the truth conditions of the sentences in which they occur and abstract away from other non-truth-functional features of those expressions. 

We should distinguish at least two different aspects of a language, whether natural or formal: syntax and semantics.

- *Syntax* is concerned with the formal features of the expressions of a language regardless of what they mean. 

  In a spoken natural language like English, certain sounds are combined into syllables and words, which are in turn parts of larger syntactic items such as sentences. The grammar of the language specifies what counts as word and how words may be combined into well-formed sentences of the language.

- *Semantics* is concerned with the interpretation of the language. 

  In order to be a competent user of a natural language, one must not only be able to recognize a word or a sentence of the language, one must know what they mean. Notice, however, that different words make different contributions to the meaning of the sentences in which they appear.

There is a third aspect to consider when it comes to natural language:

- *Pragmatics* studies the role of context in communication.

   In order to understand what is communicated by the use of a sentence, one must acknowledge know not only what the sentence literally means, but how that meaning interacts with the intentions of the speaker and the common ground of the context in which it is uttered.

Pragmatics will *not* be relevant for the study of the formal languages we will subsequently introduce, but it will play a role in our discussion of the  behavior of connectives such  as 'or' and 'if ..., then ...' in  natural language and the extent to which they are captured by the semantics  of the formal language.

## why a formal language?

There are at least two important reasons to move to a formal language.

First, we will be able to abstract away from certain non-truth-functional aspects of certain uses of connectives like 'not', 'or', 'and' or 'if ..., then ...'. It is not uncommon, for example, to hear an apparent difference in the truth conditions of the sentences:

- I felt ill and I took some syrup.
- I took some syrup and I felt ill.

For another example, notice that it is not uncommon to hear an exclusive reading of the sentence:

- You can have ice cream or you can have pie

when the truth conditions of a sentence of the form '$p$ or $q$' is compatible with the truth of both $p$ and $q$.

Second, we will be able to  avoid the structural ambiguity of natural language. For a classic illustration of the issue, consider the argument:

1. Everything is caused by something.
2. Only God can cause everything.
3. Therefore, everything is caused by God.

One reason the argument is difficult to assess is that the first premise is ambiguous between at least two different interpretations:

- Something causes everything.
- Everything is caused by something or another.

The argument looks more promising on the first interpretation of the first premise, which makes it doubtful. On the other hand, the argument is hopeless on the second interpretation of the premise on which the premise looks more plausible.

The issue of structural ambiguity arises for sentential connectives in English. For consider the argument:

1. The tank is empty or the car will start if, and only if, you turn the ignition.

2. The car will start.

3. You did not turn the ignition.

4. The tank is empty

   

The first premise is now ambiguous between two interpretations:

- The tank is empty *or* (the car will start if, and only if, you turn the ignition).

- (The tank is empty or the car will start) *if, and only if,* you turn the ignition.


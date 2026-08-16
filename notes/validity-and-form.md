---
title: "validity and form"
author: Gabriel Uzquiano
description: |
  Validity and Form

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---

# validity and form

Definition

:	An argument is *valid* if, and only if, it is an instance of a *valid argument form*.

It is the task of formal logic to offer a more precise characterization of a valid argument form. For the time being, we will content ourselves with the observation that valid forms exemplify the following features:


1. A valid argument form has *no* instances with *true premises* and a *false conclusion*.

2. Instances of valid argument forms are truth preserving regardless of subject matter.


For an argument to be valid is not just for the argument to be risk-free.

Example

:	The following argument is *risk-free*, yet it is not an instance of a valid argument form.

1. There is an elephant in the room.
2. There are infinitely many numbers.

The argument is risk-free because there is no risk the premise may be true and the conclusion false. Yet, it is not valid, since it fails to exemplify a valid argument form. If we let $p$ stand for 'there is an elephant in the room' and $q$ stand for 'there are infinitely many numbers', then the argument exemplifies the form:

1. $p$
2. $q$

But there are many instances of that argument form with true premises and a false conclusion, for example:

1. Los Angeles is in Southern California.
2. New York is in Northern California.

Here $p$ is replaced with 'Los Angeles is in Southern California' and $q$ is replaced with 'New York is in Northern California'.

Which argument forms are valid? And which forms are invalid? 

We are able to rule out the validity of some argument forms if we are able to find an argument instance with true premises and a false conclusion.

Example

:	The following *argument form* is *not* valid because at least some instances have true premises and a false conclusion.

1. $p$ or $q$
2. $q$ 
3. Therefore, $p$

Here is an instance of that form with *true premises* and a *false conclusion*:

1. Charles Dickens wrote *Tom Sawyer* or Mark Twain did
2. Mark Twain wrote *Tom Sawyer*
3. Therefore, Charles Dickens wrote *Tom Sawyer*



Here is another:

1. My office number is even or odd.
2. My office number is odd.
3. Therefore, my office number is even.

My office is in fact STO 221, which is odd.

Here are some paradigmatic examples of *valid argument forms*:

Example

:	This is sometimes known as *Modus Ponens*, though the label is unimportant. What matters is that no instance of the argument form has true premises and a false conclusion.

1. If $p$, then $q$

2. $p$

3. Therefore, $q$


Which arguments below are instances of Modus Ponens?

```{.QualitativeProblem .MultipleChoice options="check" submission="none" content-format="html"}
2a.
| If the car starts, then there's gas in the tank. There's gas in the tank. Therefore, the car started.
| If the car starts, then there's gas in the tank. The car starts. Therefore, you turned the ignition.
|* If the car starts, then there's gas in the tank. The car started. Therefore, there's gas in the tank.
```

```{.QualitativeProblem .MultipleChoice options="check" submission="none" content-format="html"}
2b.
| If I flip the coin, then it'll land heads. It'll land heads. Therefore, I'll flip the coin.
|* If I flip the coin, then it'll land heads. I'll flip the coin. Therefore, it'll land heads.
| If the coin lands heads, then I will flip it. I'll flip the coin. Therefore, it'll land heads.
```

One feature of valid argument forms is that **they have no instances with true premises and a false conclusion**.

Example

:	Here is another example of an *invalid* argument form:

1. If $p$, then $q$

2. $q$

3. Therefore, $p$

   

To appreciate its invalidity, we may consider some instances of that form with true premises and a false conclusion:

1. If I'm a millionaire, then I can make ends meet.
2. I can make ends meet.
3. Therefore, I'm a millionaire.

Here is another:

1. If I purchase a Tesla, then I will own at least two cars.

2. I will own at least two cars.

3. Therefore, I will purchase a Tesla.

   

Example

:	The next example of a *valid* argument form is sometimes known as *Modus Tollens*, though the label again is unimportant.



1. If $p$, then $q$

2. Not-$q$
3. Therefore, not-$p$

No instance of Modus Tollens has true premises and a false conclusion.

Which arguments below are instances of Modus Tollens?

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
3a.
|* If I'm a millionaire, then I can make ends meet. I cannot make ends meet. Therefore, I'm not a millionaire.
| If I'm a millionaire, then I can make ends meet. I'm not a millionaire. Therefore, I cannot make ends meet.
| If I'm a millionaire, then I can make ends meet. I can make ends meet. Therefore I'm a millionaire.
```

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
3b.
| If my age is divisible by 4, then it's even. My age is not divisible by 4. Therefore, my age isn't even.
|* If my age is divisible by 4, then it's even. My age isn't even. Therefore, my age is not divisible by 4.
| If my age is divisible by 4, then it's even. My age is even. Therefore, my age isn't divisible by 4.
```

There is again no way to provide an instance of the form with true premises and a false conclusion.



Example

:	Here is an *invalid* argument form:

1. If $p$, then $q$
2. Not-$p$
3. Therefore, not-$q$

One way to tell is to notice that some instances of that form may have true premises and a false conclusion. For example:

1. If whales are fish, then they live underwater.
2. Whales are not fish.
3. Therefore, whales do not live underwater.

Or, for another example, consider:

1. If there is an elephant in the room, then the room has a very large door.
2. There is no elephant in the room.
3. Therefore, the room does not have a very large door.

## Validity

We are in a position to make *partial* progress on the assessment of validity of some arguments in English.

Determine whether each argument below is valid.

Many Americans speak Tagalog. Most USC students are American. Therefore, most USC students speak Tagalog.

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
3.1. 
|Yes
|*No
Explanation: The argument has true premises and a false conclusion. So, it cannot be an instance of a valid argument form.
```


If many Americans speak Tagalog, then some USC students do. Many Americans speak Tagalog. Therefore, some USC students speak Tagalog.

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
3.2.
|*Yes
|No
Explanation: The argument is valid because it is an instance of the form 'If $p$, then $q$; $p$. Therefore, $q$.' Just let $p$ stand for 'many Americans speak Tagalog' and $q$ for 'some USC students speak Tagalog'. That argument form has no instances with true premises and a false conclusion.
```


Every Tesla is an electric car. Every electric car is fuel-efficient. So, every Tesla is fuel-efficient.

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
3.3.
|*Yes.
|No.
Explanation: The argument is valid because it is an instance of the form 'Every $A$ is $B$. Every $B$ is $C$. Therefore, every $A$ is $C$'. Just let $A$ stand for 'Tesla', $B$ for 'an electric car', and $C$ for 'fuel-efficient'. That argument form has no instances with true premises and a false conclusion.
```


Some Teslas are fuel-efficient cars. Some fuel-efficient cars are electric cars. Therefore, some Teslas are electric cars. 

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
3.4.
|Yes.
|*No.
Explanation: The argument is not an instance of a valid argument form. It is an instance of at least two forms:

1. $p$
2. $q$
3. $r$

This is not a valid argument form. The other argument form is:

1. Some $A$ is $B$
2. Some $B$ is $C$
3. Some $A$ is $C$

Here we let $A$ be 'Tesla', $B$ be 'fuel-efficient car', and $C$ be 'electric car'. This is not a valid argument form, since it has instances with true premises and a false conclusion, e.g.,

1. Some whales are mammals.
2. Some mammals live at high altitude.
3. Some whales live at high altitude.
```


## Soundness

You may find some arguments persuasive even if their conclusion is not in fact true. That may happen for example if we are given a valid argument some of whose premises are false.

1. If Bilbao is in Southern Spain, then it is closer to Sevilla than to Barcelona
2. Bilbao is in Southern Spain
3. Therefore, Bilbao is closer to Sevilla than to Barcelona

We are most interested in valid arguments with *true premises*, since we know that they *must* have a true conclusion. 

Definition

:	An argument is *sound* if, and only if, it is a valid argument with true premises.

Example

:	Consider the argument:

1. If I know that snow is white, then snow is white
2. I know that snow is white
3. Therefore, snow is white

> <span style="color: blue;">The argument is sound because ...</span>
>
> <span style="color: blue;">it is *valid*, since it is an instance of a valid argument form, and</span>
>
> <span style="color: blue;">its premises are true.</span>

Because the argument is sound, we can be confident in the truth of the conclusion.

Compare with the following *unsound* argument. 

1. If I know that the world will end tomorrow, then the world will end tomorrow.
2. I know that the world will end tomorrow.
3. Therefore, the world will end tomorrow.

> <span style="color: blue;">The argument is *unsound* because ...</span>
>
> <span style="color: blue;">at least one premise is false</span>

Recall the debate over the Monty Hall problem:

The Case against the Switch:

1. Door $\#1$ has the same chance of being the winner as door $\#2$.
2. If door $\#1$ has the same chance of being the winner as door $\#2$, then there is no reason to switch.
3. Therefore, there is no reason to switch.

The Case for the Switch:

1. Door $\#2$ has a greater chance of being the winner than door $\#1$.
2. If door $\#2$ has a greater chance of being the winner than door $\#1$, then you should switch.
3. So, you should switch.

*Both arguments* are valid, since they exemplify the same valid argument form:

1. $p$
2. If $p$, then $q$
3. Therefore, $q$

However, only one of them is *sound*, and there may be reasonable disagreement as to which one it is.

Which of the arguments given below are *sound*?

```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
4. 
| All fish live underwater. Whales are fish. Therefore, whales live underwater.
| No mammals live underwater. Whales are mammals. Therefore, whales do not live underwater.
|*All fish live underwater. No bears live underwater. Therefore, no bear is a fish.
```



```{.QualitativeProblem .MultipleChoice options="check" submission="none"}
5.
|* All Spanish cities enjoy great weather. Barcelona is a Spanish city. Therefore, Barcelona enjoys great weather.
| No Spanish cities enjoy great weather. Oslo is in Spain. Therefore, Oslo does not enjoy great weather.
| Some cities in Norway enjoy great weather. Madrid is in Norway. Therefore, Madrid enjoys great weather.
```

How exactly are validity and soundness related?

- If an argument is sound, then it is valid.

On the other hand, some valid arguments are unsound as witnessed above.

- If an argument is sound, then its conclusion is true.

If the argument is sound, then it is a valid argument with true premises. But valid arguments are instances of valid argument forms, which preserve truth. So, the conclusion must be true.

Which of the following statements are *true*?

```{.QualitativeProblem .MultipleSelection options="check" submission="none"}
6.
| If an argument is valid, then it is sound.
|* If an argument is sound, then it is valid.
|* If an argument is sound, then its conclusion is true.
| If an argument is valid, then its conclusion is true.
```

Which of the following statements are *true*?

```{.QualitativeProblem .MultipleSelection options="check" submission="none"}
7.
| If an argument has true premises and a true conclusion, then it is sound.
| If an argument has true premises and a true conclusion, then it is valid.
| If an argument has false premises and a false conclusion, then it is not valid.
|*If an argument has true premises and a false conclusion, then it is not valid.
|*If an argument has false premises, then it is not sound.
```

```{.QualitativeProblem .MultipleSelection options="check" submission="none"}
8.
| Every valid argument has true premises and a true conclusion.
|*Every sound argument has true premises and a true conclusion.
| No valid argument has false premises and a true conclusion.
|*No sound argument has true premises and a false conclusion.
```


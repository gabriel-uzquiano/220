Before we move on, it may be helpful to illustrate some of the themes we mentioned when we discussed the first steps in a proof. Consider the following task:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
0. -Ex AyRxy :|-: AxEy-Rxy
```

Even before we attempt the proof, we should convince ourselves that the conclusion follows from the premise. To gauge the cash value of the premise, consider what happens when we interpret $R$ in terms of seeing, e.g., 

**no one sees everyone.**

On the other hand, the cash value of the conclusion on that interpretation is:

**whoever one may be, there is someone they do not see**.

The conclusion appears to follow from the premise: if no one sees everyone, then for each individual, there should be someone that individual does not see. The question now is how to derive the conclusion from the premise.

Notice, first, that the conclusion is a universal generalization, which means that we will presumably arrive at it by means of an application of universal introduction $I\forall$. So, we should aim for an arbitrary instance as our intermediate target, e.g.:
$$
\exists y \neg Ray
$$
We may choose $a$ because it is a brand new constant that makes no appearance in our assumption. If we can prove $\exists y \neg Ray$, then a single use of $I\forall$ on that formula will give us what we want.

How should we proceed? Recall that we have assumed that no one sees everyone. So, we should be able to prove that $a$​, whoever that may be, does *not* see everyone.

We do this by the rule of $I\neg$ or negation introduction:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
0. -Ex AyRxy :|-: AxEy-Rxy
|-Ex AyRxy :assumption
| Ay Ray :assumption 
| ExAyRxy :IE 2
| !? :E- 1,3
|-AyRay :I- 2-4

```

We have now arrived at the formula:
$$
\neg \forall y Ray.
$$
That is not exactly what we want to prove, namely, $\exists y \neg Ray$, but it is logically equivalent to it. Our last task is to move from the former to the latter.

We may proceed *indirectly*, namely, we will first set out to prove
$$
\neg \neg \exists y \neg Ray
$$
by the rule of $I\neg$ or negation introduction. For once we do that, we should be able to arrive at our conclusion by $\neg \neg$​ or double negation elimination. 

To set up the use of  $I\neg$ or negation introduction, we start with the assumption:
$$
\neg \exists y \neg Ray
$$

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
0. -Ex AyRxy :|-: AxEy-Rxy
|-Ex AyRxy :assumption
| Ay Ray :assumption 
| ExAyRxy :IE 2
| !? :E- 1,3
|-AyRay :I- 2-4
| -Ey-Ray :assumption

```

The task now is to arrive at a contradiction from that assumption. Where is the contradiction supposed to come from? Note that line 6 says that 

**no one is not seen by $a$​**.

We should be able to exploit that in order to show that $a$ sees $b$ no matter what individual $b$ may be. If we can do that, we should be able to contradict line 5 by establishing that $\forall y Ray$. Here is how we would argue for the claim that $Rab$ now:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
0. -Ex AyRxy :|-: AxEy-Rxy
|-Ex AyRxy :assumption
| Ay Ray :assumption 
| ExAyRxy :IE 2
| !? :E- 1,3
|-AyRay :I- 2-4
| -Ey-Ray :assumption
|  -Rab :assumption
|  Ey -Ray :IE 7
|  !? :E- 6, 8
| --Rab :I- 7-9
| Rab :-- 10

```

At this point, we are close to the end, since by universal introduction, we should be able to contradict line 5 and complete the strategy we outlined at the outset to derive the conclusion from that premise.

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
0. -Ex AyRxy :|-: AxEy-Rxy
|-Ex AyRxy :assumption
| Ay Ray :assumption 
| ExAyRxy :IE 2
| !? :E- 1,3
|-AyRay :I- 2-4
| -Ey-Ray :assumption
|  -Rab :assumption
|  Ey -Ray :IE 7
|  !? :E- 6, 8
| --Rab :I- 7-9
| Rab :-- 10
| AyRay :IA 11
| !? :E- 5, 12
|--Ey -Ray :I- 6-13
|Ey -Ray :-- 14
|AxEy -Rxy :IA 15

```

# 
---
title: "natural deduction: quantification"
author: Gabriel Uzquiano
description: |
  Natural Deduction: negation

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---



# natural deduction: quantification

Here is a simple derivation in quantificational logic:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
1. -Raa -> Ex -Rxx, -Ex-Rxx :|-: Raa
|-Raa -> Ex -Rxx :assumption
|-Ex -Rxx :assumption
| -Raa :assumption
| Ex-Rxx :E-> 1, 3
| !? :E- 2, 4 
|--Raa :I- 3-5
|Raa :-- 6
```

We now extend the system of natural deduction with introduction and elimination rules for each quantifier. 

First, we explain what is for a formula to be an *instance* of a quantified formula.

Definition

:	If $a$ is a constant, we let $\varphi(a/x)$ be the formula that results from $\varphi$ when we substitute $a$ for every *free* occurrence of the variable $x$ in $\varphi$. The formula $\varphi(a/x)$ is an *instance* of each $\forall x \varphi$ and $\exists x \varphi$, respectively.

Examples

:	Let us look at some examples:

- $Px(c/x)$ is the formula $Pc$, which is an instance of each $\forall xPx$ and $\exists x Px$.
- $(Rxy→∃xQx)(b/x)$ is the formula $(Rby→∃xQx)$, which is an instance of each $\forall x(Rxy→∃xQx)$ and $∃x(Rxy→∃xQx)$.



```{.Playground .GamutNDPlus options="indent resize render popout tabindent" submission="none"}

```

### universal quantifier

We begin with a simple elimination rule for the universal quantifier:

Elimination ($E\forall$)

:	You may write an instance $\varphi(a/x)$ of a universally quantified formula $\forall x \varphi$ if the latter is available on a prior line of the derivation.

![EA](ue.png)

When we say that *every* individual satisfies a given condition $\varphi$, we are entitled to the more specific claim that a given individual $a$​ satisfies the condition.

Let us look at the rule in action.

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
2. Ax Px, Ax(Px -> Qx) :|-: Qa
|Ax Px :assumption
|Ax(Px -> Qx) :assumption
|Pa :EA 1
|Pa -> Qa :EA 2
|Qa :E-> 3, 4

```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
3. AxAyRxy, Ax(Rxb -> Px) :|-: Pa
|AxAyRxy :assumption
|Ax(Rxb -> Px) :assumption
|AyRay :EA 1
|Rab :EA 3
|Rab -> Pa :EA 2
|Pa :E-> 4, 5
```

The introduction rule requires care. We *cannot* move from *any* instance $\varphi(a/x)$ to a universal generalization $\forall x \varphi(x)$. Maybe an individual $a$ satisfies the condition $\varphi$ while others do *not*; that is, maybe $a$ satisfies the condition in virtue of specific features of $a$ that other individuals lack.

In order to make a generalization, we simply make sure *no specific assumptions about* the relevant individual are in play. We can do that by imposing the further requirement that the constant in question makes no appearance in either the condition $\varphi$​ or in any undischarged assumption. So, what applies to the individual in question applies to any other individual.

Introduction ($I\forall$)

:	You may write a universally quantified formula $\forall x \varphi$ if some instance $\varphi(a/x)$ becomes available on a prior line and $a$ occurs neither in $\varphi$ nor in an undischarged assumption.

Let us look at some applications of the rule.

![IA](ui.png)

If we are in a position to establish $\varphi(a)$ independently on any specific assumptions about $a$, then what applies to it should applies to *every* other individual and we may conclude that they *all* satisfy the condition in question.

Consider some applications of the rule.

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
4. Ax Px, Ax (Px -> Qx) :|-: Ax Qx
|AxPx :assumption
|Ax(Px -> Qx) :assumption
|Pa :EA 1
|Pa -> Qa :EA2
|Qa :E-> 3, 4
|Ax Qx :IA 5
```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
5. Ax (Px /\ Qx) :|-: AyQy
|Ax (Px /\Qx) :assumption
|Pa/\Qa :EA 1
|Qa :E/\ 2
|AyQy :IA 3
```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
6. Ax Px \/ Ax Qx :|-: Ay (Py \/ Qy)
|Ax Px \/ Ax Qx :assumption
| Ax Px :assumption
| Pa :EA 2
| Pa \/ Qa :I\/ 3
| Ay (Py \/ Qy) :IA 4
|AxPx -> Ay(Py\/Qy) :I-> 2-5
| Ax Qx :assumption
| Qa :EA 7
| Pa \/Qa :I\/ 8
| Ay(Py \/ Qy) :IA 9
|AxQx -> Ay(Py\/Qy) :I-> 7-10
|Ay(Py\/Qy) :E\/ 1, 6, 11

```

### existential quantifier

We now move to the introduction and elimination rules for the existential quantifier.

Introduction (I$\exists$)

:	You may write an existentially quantified formula $\exists x \varphi$ provided an instance $\varphi(a/v)$ is available on a prior line of the derivation

![IE](ei.png)

We are entitle to infer that *something* satisfies a given condition $\varphi$, we are given the more specific claim that an individual $a$​ satisfies the condition.

Let us consider some examples.

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
7. Ax (Px -> Qx), Pa :|-: Ex (Px /\Qx)
|Ax (Px -> Qx) :assumption
|Pa :assumption
|Pa -> Qa :EA 1
|Qa :E-> 2,3
|Pa /\ Qa :I/\ 2, 4
|Ex(Px /\Qx) :IE 5

```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
8. Ax (Px -> Ay Rxy), Pa :|-: Ex Rxx
|Ax (Px -> AyRxy) :assumption
|Pa :assumption
|Pa -> AyRay :EA 1
|AyRay :E-> 2, 3
|Raa :EA 4
|Ex Rxx :IE 5

```

The elimination rule for the existential quantifier is more delicate.

Elimination (E$\exists$)

:	You may write $\psi$  if the existentially quantified formula $\exists x \varphi$ and the conditional $\varphi(a/x) \to \psi$ are available at prior lines provided that $a$ occurs neither in $\psi$ nor in $\exists x \varphi$ nor in any undischarged assumption.

![EE](ee.png)

Suppose we are given $\exists x \varphi$​. Then we *cannot just* infer any instance $\varphi(a/x)$.  We can, however, show the conditional $\varphi(a/x) \to \psi$ making no assumptions about the specific identity of $a$. Since the identity of $a$ makes no difference to what follows from that instance, we conclude $\psi$. For if $\exists x \varphi$ is true, then *some* instance of the form $\varphi(a/x)$ may be true, though we do *not* know which, and if we have the conditional $\varphi(a/x) \to \psi$ for an arbitrary instance of the quantified formula, we can infer $\psi$.

Let us look at the rule of existential elimination in action.

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
9. Ax (Px -> Qx), Ex Px :|-: Ex Qx
|Ax(Px -> Qx) :assumption
|Ex Px :assumption
| Pa :assumption
| Pa -> Qa :EA 1
| Qa :E-> 3, 4
| ExQx :IE 5
|Pa -> Ex Qx :I-> 3-6
|ExQx :EE 2, 7

```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
10. Ex (Px/\-Rxa) :|-: Ex-(Px /\ Rxa)
|Ex (Px /\-Rxa) :assumption
| Pb /\ -Rba :assumption
|  Pb /\ Rba :assumption
|  -Rba :E/\ 2
|  Rba :E/\ 3
|  !? :E- 4, 5
| -(Pb /\ Rba) :I- 3-6
| Ex -(Px /\ Rxa) :IE 7
|(Pb /\ -Rba) -> Ex -(Px /\ Rxa) :I-> 2-8
|Ex -(Px /\ Rxa) :EE 1, 9


```

Here is a sandbox you can use to experiment with derivations in quantificational logic:

```{.Playground .GamutNDPlus options="indent resize render popout tabindent" submission="none"}

```


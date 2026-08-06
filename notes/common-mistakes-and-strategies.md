---
title: "common mistakes and strategies"
author: Gabriel Uzquiano
description: |
  How to construct proofs

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css
---

# review

We first look at some further illustrations of the rules we have introduced for the quantifiers:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
1. Ax (Px -> Ay Rxy), Ay Py :|-: Rab
|Ax (Px -> Ay Rxy) :assumption
|Ay Py :assumption
|Pa -> Ay Ray :EA 1
|Pa :EA 2
|AyRay :E-> 3, 4
|Rab :EA 5

```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
2. :|-: Ax(Rxa -> Rxa)
| Rba :assumption
| Rba :rep 1
|Rba -> Rba :I-> 1-2
|Ax(Rxa -> Rxa) :IA 3

```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
3. Ax Px -> Ay Ray, Ay Py :|-: Ez Ay Rzy
|Ax Px -> Ay Ray :assumption
|Ay Py :assumption
|Pb :EA 2
|Ax Px :IA 3
|Ay Ray :E-> 1, 4
|EzAyRzy :IE 5
```

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
4. Ey Ray, Ax(Rax -> Rbx) :|-: EzRbz
|EyRay :assumption
|Ax(Rax -> Rbx) :assumption
| Rac :assumption
| Rac -> Rbc :EA 2
| Rbc :E-> 3, 4
| EzRbz :IE 5
|Rac -> EzRbz :I-> 3-6
|EzRbz :EE 1, 7

```

Here is finally a derivation, which requires all four rules of inference.

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
5. Ax(Px -> Ey(Py /\ Rxy)), ~Ax Ey Rxy  :|-: ~Ax Px
|Ax(Px -> Ey(Py /\ Rxy)) :assumption
|~Ax Ey Rxy :assumption
| Ax Px :assumption
| Pa :EA 3
| Pa -> Ey(Py /\ Ray) :EA 1
| Ey(Py/\ Ray) :E-> 4, 5
|  Pb /\ Rab :assumption
|  Rab :E/\ 7
|  Ey Ray :IE 8
| (Pb /\ Rab) -> Ey Ray :I-> 7-9
| EyRay :EE 6, 10
| AxEyRxy :IA 11
| !? :E~ 2, 12
|~Ax Px :I~ 3-13
```

# common mistakes and strategy

Much of the advice for propositional logic carries over to quantificational logic. You should begin with a plan for the derivation, which generally works backwards from your goal to appropriate subgoals you should reach out first. 

There are, however, some potential pitfalls we should be careful to avoid in quantificational logic.

## misapplications of the rules for $\forall$ and $\exists$

Here are some common misapplications of the rules for the universal and existential quantifiers

### misapplications to formulas with other main connectives

One may be tempted to misapply $E\forall$ to a formula that is *not* a universally quantified formula

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
6. AxPx -> Ax Qx :|-: Pa -> Qa
|Ax Px -> Ax Qx :assumption
|Pa -> Qa :EA 1 ✗

```

The second line misapplies $E\forall$ to a *conditional*, not a universally quantified formula. Not only is this an incorrect proof, but notice that there is in fact *no* proof of the conclusion from the premise, since the argument is in fact *invalid*.

```{.CounterModeler .Validity system="gamutND" options="turnstilemark double-turnstile exam check"submission="none"}
7. AxPx -> Ax Qx :|-: Pa -> Qa
|Domain: 0, 1
|P(_): 0
|Q(_):
|a: 0
|b: 1
```

This model verifies the premise by making false $\forall x Px$, which is the antecedent of the conditional. The conclusion, however, is false in the model, since $Pa$ is true in the model while $Qa$ remains false in the model. That makes the conditional false.

Compare the argument above with a valid argument given below:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
8. Ax(Px -> Qx) :|-: Pa -> Qa
|Ax (Px -> Qx) :assumption
|Pa -> Qa :EA 1 
```

For another example of a similar pitfall, consider the attempted proof below:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
9. ExPx /\ Ex Qx :|-: Ex (Px /\ Qx)
|ExPx /\ Ex Qx  :assumption
| Pa /\ Qa :assumption
| Ex(Px /\ Qx) :IE 2
|(Pa /\ Qa) -> Ex (Px /\ Qx) :I-> 2-3
|Ex(Px/\Qx) :EE 1, 5 ✗

```

The last step is incorrect simply because the first premise is a *conjunction* and not an existentially quantified formula. So, we cannot apply $EE$ to it.

There is no proof of the conclusion from the premises, since the argument is in fact invalid as shown by the following countermodel.

```{.CounterModeler .Validity system="gamutND" options="turnstilemark double-turnstile exam check"submission="none"}
10. ExPx /\ Ex Qx :|-: Ex (Px /\ Qx)
|Domain: 0, 1
|P(_): 0
|Q(_): 1
```

The model verifies the conjunction $\exists x Px \wedge \exists x Qx$ because something is $P$ in the model and something is $Q$ in the model. The conclusion, however, is false in the model because nothing is both $P$ and $Q$ in the model.

Compare the argument above with a valid argument given below:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
11. Ex(Px /\ Qx) :|-: Ex Px /\ Ex Qx
|Ex(Px /\ Qx)  :assumption
| Pa /\ Qa :assumption
| Pa :E/\ 2
| Ex Px :IE 3
| Qa :E/\ 2
| Ex Qx :IE 5
| ExPx /\ Ex Qx :I/\ 4, 6
|(Pa /\ Qa) -> (Ex Px /\ Ex Qx) :I-> 2-7
|Ex Px/\ Ex Qx :EE 1, 8
```

### failures to apply the rules once at a time

One common temptation is to apply the rules twice at a time as in the attempted proof given below:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
12. AxAy Rxy :|-: Rab
|AxAy Rxy :assumption
|Rab :EA 1 ✗
```

A correct proof would split the transition from premise to conclusion into two different steps each of which is an application of $E\forall$:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
13. AxAy Rxy :|-: Rab
|AxAy Rxy :assumption
|Ay Ray :EA 1 
|Rab :EA 2
```

### misapplications of I$\forall$ and E$\exists$

Both I$\forall$ and E$\exists$ come with special qualifications, which may present its own difficulties. Consider for example, a potential misapplication of I$\forall$:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
14. Ax Rxa :|-: Ax Rxx
|Ax Rxa :assumption
|Raa :EA 1
|AxRxx :IA 2 ✗
```

The problem with the last step is that I$\forall$ does *not* license the step from line 3 to line 4 because the constant $a$ appears in an undischarged assumption, namely, line 1. Therefore, the last step is incorrect.

That is for the best, since the argument above is in fact invalid as shown by the following countermodel:

```{.CounterModeler .Validity system="gamutND" options="turnstilemark double-turnstile exam check"submission="none"}
15. Ax Rxa :|-: Ax Rxx
|Domain: 0, 1
|R(_,_): [0, 0], [1,0]
|a: 0
```

The model verifies the premise by making sure that everything in the domain is related to 0, which is the denotation of the constant $a$. The conclusion, however, is false, since it is not the case that everything in the domain is related to itself, e.g., 1 is not related to itself in the model.

For a correct application of the rule, consider the proof:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
16. Ax Rxa, Ax (Rxa -> Rax), AxAy Az ((Rxy /\ Ryz)-> Rxz) :|-: Ax Rxx
|Ax Rxa :assumption
|Ax (Rxa-> Rax) :assumption
|Ax Ay Az((Rxy/\Ryz)->Rxz) :assumption
|Rba :EA 1
|Rba->Rab :EA 2
|Rab :E-> 4, 5
|Ay Az((Rby /\ Ryz)->Rbz) :EA 3
|Az ((Rba/\Raz)->Rbz) :EA 7
|(Rba/\Rab)-> Rbb :EA 8
|Rba/\Rab :I/\ 4, 6
|Rbb :E-> 9, 10
|Ax Rxx :IA 11

```

We face a similar risk with the rule of existential elimination. Consider for example, a potential misapplication of I$\exists$:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
17. Ex Rxa :|-: Ex Rxx
|Ex Rxa :assumption
| Raa :assumption
| Ex Rxx :IE 2
|Raa -> Ex Rxx :I-> 2-3
|ExRxx :IE 1, 4 ✗

```

The problem with the last step is again that I$\exists$ does *not* license the step from lines 1 and 4 to line 5 because the constant $a$ appears in an undischarged assumption, namely, line 1. Therefore, the last step is incorrect.

That is for the best, since the argument above is in fact invalid as shown by the following countermodel:

```{.CounterModeler .Validity system="gamutND" options="turnstilemark double-turnstile exam check"submission="none"}
18. Ex Rxa :|-: Ex Rxx
|Domain: 0, 1
|R(_,_): [1,0]
|a: 0
```

The model verifies the premise by making sure that something in the domain, namely, 1, is related to 0, which is the denotation of the constant $a$. The conclusion, however, is false, since nothing in the domain is related to itself.

Compare again with the following proof:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
19. Ex Rxa, Ax (Rxa -> Rax), Ax Ay Az((Rxy/\Ryz)->Rxz) :|-: Ex Rxx
|Ex Rxa :assumption
|Ax (Rxa-> Rax) :assumption
|Ax Ay Az((Rxy/\Ryz)->Rxz) :assumption
| Rba :assumption
| Rba->Rab :EA 2
| Rab :E-> 4, 5
| Ay Az((Rby /\ Ryz)->Rbz) :EA 3
| Az ((Rba/\Raz)->Rbz) :EA 7
| (Rba/\Rab)-> Rbb :EA 8
| Rba/\Rab :I/\ 4, 6
| Rbb :E-> 9, 10
| Ex Rxx :IE 11
|Rba-> ExRxx :I-> 4-12
|ExRxx :EE 1, 13

```

## strategy

You may often find yourself in a position to exploit a universally quantified formula and an existentially quantified one in order to reach your conclusion. In such situations, it is generally better to exploit the existentially quantifier formula *first*, since otherwise, you may be forced to introduce yet another constant. Consider, for example, the order in which the rules of E$\exists$ and E$A$ have been used in the derivation below:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
20. Ex Rax, Ay(Ray ->Ryy) :|-: Ex Rxx 
|Ex Rax :assumption
|Ay(Ray ->Ryy) :assumption
| Rab :assumption
| Rab -> Rbb :EA 2
| Rbb :E-> 3, 4
| Ex Rxx :IE 5
|Rab -> Ex Rxx :I-> 3-6
|Ex Rxx :EE 1, 7

```

For another example, consider the proof:

```{.ProofChecker .GamutNDPlus options="indent resize fonts popout render tabindent" submission="none"}
21. ExPx/\ExQx, -Ex(Px/\Qx), Ax(Rx -> Px) :|-: Ex -Rx
|ExPx/\ExQx :assumption
|-Ex(Px/\Qx) :assumption
|Ax(Rx -> Px) :assumption
|Ex Qx :E/\ 1
| Qa :assumption
|  Pa :assumption
|  Pa /\ Qa :I/\ 5, 6
|  Ex(Px/\Qx) :IE 7
|  !? :E- 2, 8
| -Pa :I- 6-9
| Ra-> Pa :EA 3
|  Ra :assumption
|  Pa :E-> 11, 12
|  !? :E- 10, 13
| -Ra :I- 12-14
| Ex -Rx :IE 15
|Qa -> Ex -Rx :I-> 5-16
|Ex -Rx :EE 4, 17
```

Here is a sandbox you can use to experiment further with derivations in quantificational logic:

```{.Playground .GamutNDPlus options="indent resize render popout tabindent" submission="none"}

```


---
title: natural deduction continued
author: Gabriel Uzquiano
description: |
  quantificational validity

base-css:
- https://static.carnap.io/css/tufte.css
- https://static.carnap.io/css/tufte-extra.css

---

# how to test for validity

We now combine all the skills we have learned in order to assess some natural language arguments for quantificational validity. We will translate the arguments into the language of quantificational logic, and we will proceed to use models to check whether they are valid or not.

Example

:	Consider the argument below:

> Someone is a Greek or a Trojan. No Greek is Trojan. So, someone is a Greek but not a Trojan.

In premise conclusion form:

1. Someone is a Greek or a Trojan.
2. No Greek is Trojan.
3. Someone is a Greek but not a Trojan.

We now translate into the language of quantificational logic.

**Translation Key**

Domain:	People

$P\ \_$:	__ is Greek

$Q \ \_$:	__ is Trojan



```{.Translate .FOL system="gamutND" submission="none"}
1.  Ex(Px \/ Qx): Someone is a Greek or a Trojan.
|Ex (Px \/ Qx)
```

```{.Translate .FOL system="gamutND" submission="none"}
2. Ax(Px -> ~Qx) : No Greek is a Trojan.
|Ax(Px -> ~Qx)
```

```{.Translate .FOL system="gamutND" submission="none"}
3. Ex(Px /\ ~Qx) : Someone is a Greek but not a Trojan.
|Ex (Px /\ ~Qx)
```

We now check whether the argument in valid. This is a two-step process. We first check whether we can provide a model in which the premises are true and the conclusion is false.

```{.CounterModeler .Validity system="gamutNDPlus" options="turnstilemark double-turnstile" options="check" submission="none"}
4.  Ex(Px \/ Qx), Ax(Px -> ~Qx) :|-: Ex(Px /\ ~Qx)
|Domain : 0,1
|P(_) : 
|Q(_) : 0

```

Example

:	Consider the argument below:

> Every Greek admires a Greek and a Trojan. Some Trojans are friends of Hector. So, every Greek admires a friend of Hector

In premise conclusion form:

1. Every Greek admires a Greek and a Trojan. 
2. Some Trojans are friends of Hector.
3. Every Greek admires a friend of Hector

We now translate into the language of quantificational logic.

**Translation Key**

Domain:	People

$P\ \_$:	__ is Greek

$Q \ \_$:	__ is Trojan

$R \ \_, \_$:	__ admires  __

$S \ \_, \_$:	__ is a friend of  __

$a$:	Hector



```{.Translate .FOL system="gamutND" submission="none"}
1.  Ax(Px -> (Ey(Py /\ Rxy) /\ Ez(Qz /\ Rxz))): Every Greek admires a Greek and a Trojan.
|Ax(Px -> (Ey(Py /\ Rxy) /\ Ez(Qz /\ Rxz)))
```

```{.Translate .FOL system="gamutND" submission="none"}
2. Ex(Qx /\ Sxa) : Some Trojans are friends of Hector.
|Ex(Qx /\ Sxa)
```

```{.Translate .FOL system="gamutND" submission="none"}
3. Ax(Px -> Ey (Sya /\ Rxy)) : Every Greek admires a friend of Hector
|Ax(Px -> Ey (Sya /\ Rxy))
```

We now check whether the argument in valid. This is a two-step process. We first check whether we can provide a model in which the premises are true and the conclusion is false.

```{.CounterModeler .Validity system="gamutNDPlus" options="turnstilemark double-turnstile" options="check" submission="none"}
4.  Ax(Px -> (Ey(Py /\ Rxy) /\ Ez(Qz /\ Rxz))), Ex(Qx /\ Sxa) :|-: Ax(Px -> Ey (Sya /\ Rxy))
|Domain : 0,1, 2
|P(_) : 0
|Q(_) : 1, 2
|R(_,_): [0, 0], [0,2]
|S(_,_): [1, 1]
|a: 1

```

Example

:	Consider the arguments given below:

> Only a Greek can defeat Hector. Achilles is Greek. Therefore, some Greeks can defeat Hector.

In premise conclusion form:

1. Only a Greek can defeat Hector. 
2. Achilles is Greek. 
3. Some Greeks can defeat Hector.

We now translate into the language of quantificational logic.

**Translation Key**

Domain:	People

$P\ \_$:	__ is Greek

$R \ \_, \_$:	__ can defeat  __

​	$a$:	Achilles

​	$b$:	Hector



```{.Translate .FOL system="gamutND" submission="none"}
1.  Ax(Rxb -> Px): Only a Greek can defeat Hector. 
|Ax(Rxb -> Px)
```

```{.Translate .FOL system="gamutND" submission="none"}
2. Pa : Achilles is Greek.
|Pa
```

```{.Translate .FOL system="gamutND" submission="none"}
3. Ax (Px -> Rxb) : Every Greek can defeat Hector.
|Ax (Px -> Rxb)
```

We now check whether the argument in valid. This is a two-step process. We first check whether we can provide a model in which the premises are true and the conclusion is false.

```{.CounterModeler .Validity system="gamutNDPlus" options="turnstilemark double-turnstile" options="check" submission="none"}
4. Ax(Rxb -> Px), Pa :|-: Ax (Px -> Rxb)
|Domain : 0,1,2
|P(_) : 0, 2
|R(_,_): [2, 1]
|a: 0
|b: 1
```



> Hector fought every Greek, but Paris did not. Paris fought some Greeks, but he did not fight Achilles. So, Hector fought Achilles.

In premise conclusion form:

1. Hector fought every Greek, but Paris did not.
2. Paris fought some Greeks, but he did not fight Achilles.
3. Hector fought Achilles.

We now translate into the language of quantificational logic.

**Translation Key**

Domain:	People

$P\ \_$:	__ is Greek

$R \ \_, \_$:	__ fought  __

​	$a$:	Achilles

​	$b$:	Hector

​	$c$:	Paris



```{.Translate .FOL system="gamutND" submission="none"}
1.  Ax(Px -> Rbx) /\ ~Ay(Py -> Rcy): Hector fought every Greek, but Paris did not. 
|Ax(Px -> Rbx) /\ ~Ay(Py -> Rcy)
```

```{.Translate .FOL system="gamutND" submission="none"}
2. Ex(Rcx /\ Px) /\ ~Rca : Paris fought some Greeks, but he did not fight Achilles.
|Ex(Rcx /\ Px) /\ ~Rca
```

```{.Translate .FOL system="gamutND" submission="none"}
3. Rba : Hector fought Achilles.
|Rba
```

We now check whether the argument in valid. This is a two-step process. We first check whether we can provide a model in which the premises are true and the conclusion is false.

```{.CounterModeler .Validity system="gamutNDPlus" options="turnstilemark double-turnstile" options="check" submission="none"}
4. Ax(Px -> Rbx) /\ ~Ay(Py -> Rcy), Ex(Rcx /\ Px) /\ ~Rca  :|-: Rba 
|Domain : 0,1,2,3,4
|P(_) :  3, 4
|R(_,_): [1, 3], [1,4], [2, 1], [2, 3]
|a : 0
|b : 1
|c : 2
```



Example

:	Consider the argument below:

> Only Trojans are friends of Paris. Trojans are courageous. So, all friends of Paris are courageous.

In premise conclusion form:

1. Only Trojans are friends of Paris.
2. Trojans are courageous.
3. All friends of Paris are courageous.

We now translate into the language of quantificational logic.

**Translation Key**

Domain:	People

$P\ \_$:	__ is Trojan

$Q \ \_$:	__ is courageous

$R \ \_, \_$:	__ is a friend of  __

​	$a$:	Paris

```{.Translate .FOL system="gamutND" submission="none"}
1.  Ax(Rxa -> Px): Only Trojans are friends of Paris.
|Ax(Rxa -> Px)
```

```{.Translate .FOL system="gamutND" submission="none"}
2. Ax(Px -> Qx) : Trojans are courageous.
|Ax(Px -> Qx)
```

```{.Translate .FOL system="gamutND" submission="none"}
3. Ax (Rxa -> Qx) : All friends of Paris are courageous.
|Ax (Rxa -> Qx)
```

We now check whether the argument in valid. This is a two-step process. We first check whether we can provide a model in which the premises are true and the conclusion is false.

```{.CounterModeler .Validity system="gamutNDPlus" options="turnstilemark double-turnstile" options="check" submission="none"}
4.  Ax(Rxa -> Px), Ax(Px -> Qx) :|-: Ax (Rxa -> Qx)

```

Since we **cannot produce such a model**, we will eventually look for a derivation of the conclusion from the premises.

Example

:	Consider the argument below:

> Ajax or Paris have some Greek foes. No Greek has any Greek foes. So, some Trojan had some Greek foes.

In premise conclusion form:

1. Ajax or Paris have some Greek foes.
2. No Greek has any Greek foes.
3. Some Trojan has some Greek foes.

We now translate into the language of quantificational logic.

**Translation Key**

Domain:	People

$P \ \_$:	__ is Greek

$Q \ \_$:	__ is Trojan

$R \ \_,\_$:	__ is a foe of  __

​	$a$:	Ajax

​	$b$:	Paris



```{.Translate .FOL system="gamutND" submission="none"}
1.  Ex(Px /\ Rxa) \/ Ex(Px/\Rxb): Ajax or Paris have some Greek foes.
|Ex(Px /\ Rxa) \/ Ex(Px/\Rxb)
```

```{.Translate .FOL system="gamutND" submission="none"}
2. Ax(Px -> Ay(Py -> -Ryx)), Ax (Px -> -Ey (Py /\ Ryx)) : No Greek has any Greek foes.
|Ax(Px -> Ay(Py -> -Ryx))
```

```{.Translate .FOL system="gamutND" submission="none"}
3. Ex (Qx /\ Ey (Py /\ Ryx)) : Some Trojan has some Greek foes.
|Ex (Qx /\ Ey (Py /\ Ryx))
```

We now check whether the argument in valid. We now attempt to provide a model in which the premises are true and the conclusion is false.

```{.CounterModeler .Validity system="gamutNDPlus" options="turnstilemark double-turnstile" options="check" submission="none"}
4. Ex(Px /\ Rxa) \/ Ex(Px/\Rxb), Ax(Px -> Ay(Py -> -Ryx)) :|-: Ex (Qx /\ Ey (Py /\ Ryx))
|Domain : 0,1,2
|P(_) : 2
|Q(_) : 
|R(_,_): [2, 0]
|a:0
|b:1

```

Once we succeed, we conclude that the argument is quantificationally invalid.

Matters are different for the next argument below.

Example

:	Consider the argument below:

> Paris has some Greek foes. Unless Paris is Greek, he is Trojan. No Greek has any Greek foes. So, some Trojan has some Greek foes.

In premise conclusion form:

1. Paris has some Greek foes.
2. Unless Paris is Greek, he is Trojan.
3. No Greek has any Greek foes.
4. Some Trojan had some Greek foes.

We now translate into the language of quantificational logic.

**Translation Key**

Domain:	People

$P \ \_$:	__ is Greek

$Q \ \_$:	__ is Trojan

$R \ \_,\_$:	__ is a foe of  __

​	$b$:	Paris



```{.Translate .FOL system="gamutND" submission="none"}
1.  Ex(Px/\Rxb): Paris has some Greek foes.
|Ex(Px/\Rxb)
```

```{.Translate .FOL system="gamutND" submission="none"}
2. -Pb -> Qb : Unless Paris is Greek, he is Trojan.
|-Pb -> Qb
```

```{.Translate .FOL system="gamutND" submission="none"}
2. Ax(Px -> Ay(Py -> -Ryx)), Ax (Px -> -Ey (Py /\ Ryx)) : No Greek has any Greek foes.
|Ax(Px -> Ay(Py -> -Ryx))
```

```{.Translate .FOL system="gamutND" submission="none"}
3. Ex (Qx /\ Ey (Py /\ Ryx)) : Some Trojan has some Greek foes.
|Ex (Qx /\ Ey (Py /\ Ryx))
```

We will now fail when we attempt to provide a model in which the premises are true and the conclusion is false.

```{.CounterModeler .Validity system="gamutNDPlus" options="turnstilemark double-turnstile" options="check" submission="none"}
4.a.  Ex(Px/\Rxb), -Pb -> Qb, Ax(Px -> Ay(Py -> -Ryx)) :|-: Ex (Qx /\ Ey (Py /\ Ryx))

```

Since we **cannot provide such a model**, we now look for a derivation of the conclusion from the premises.




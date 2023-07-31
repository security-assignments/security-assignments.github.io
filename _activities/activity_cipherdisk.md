---
title: "Activity: Cipher Disk"
description: Hands-on practice with monoalphabetic and polyalphabetic substitution ciphers.
include_toc: true
slug: cipherdisk
---

Use the cipher disk at the following site to answer the questions below:

<http://inventwithpython.com/cipherwheel/>

**Note:** To begin, make sure that the letter `A` on the inner disk is aligned
with the letter `A` on the outer disk.


# Part 1: Monoalphabetic Cipher


## Encrypt the plaintext `secret`

In cryptography, the unencrypted text you can read is called the “plaintext.”
The encrypted text is called “ciphertext.”

Using the wheel, encrypt the word `secret` by rotating the outer wheel three
positions counter clockwise so that the letter `A` on the inner wheel aligns
with the letter `D` on the outer wheel. The inner wheel shows the plaintext, and
the outer wheel shows the ciphertext.

{% include lab_question.html question="What is the resulting word?" %}

## Encrypt a word of your choice

Encrypt a short word using the above method, but choose a different key, a
number between 1–25 (we can’t use `0`, because that will just give us the
plaintext). Write the ciphertext on a piece of paper and ask your partner to
decrypt it.

{% include lab_question.html question="What is the maximum number of guesses that your partner has to make to find the plaintext??" %}

{% include lab_question.html question="Assuming each key is equally likely, on average, how many guesses does your partner have to make to find the plaintext?" %}

{% include lab_question.html question="Was your partner able to make fewer guesses than your answers to Questions 1 and 2? If so, how was your partner able to do it faster?" %}


# Part 2: Polyalphabetic Cipher

You can make this cipher stronger by using more than one key to encrypt the
message. For example, encrypt the message:

*Secret message:* 	`launchattackcharly`

*Keyword repeated:* 	`securitysecurityse`

Use the word `security` as the key, repeating it so that the key is as long as the message (e.g., `securitysecu`).

Encrypt by rotating the outer wheel so that `s` in the word `security` aligns
with `a` on the inner wheel. Now `l` in the word `launch` on the inner wheel
maps to the letter `d` on the outer wheel, so `d` is the ciphertext.

Next, rotate the outer wheel so that `e` in the word `security` aligns with `a` on the inner wheel. Now `a` in the word `launch` on the inner wheel maps to `e` on the outer wheel.

{% include lab_question.html question='What is the rest of the ciphertext for “LaunchAttack” using the polyalphabetic key “security”? Compare your answer to your partner’s.' %}

{% include lab_question.html question='Imagine that you encrypted an entire page of text with the keyword “security”. What patterns do you think would help an attacker guess the key?' %}


## One-time pad: A key equal in length to the message

What if you used a random polyalphabetic key that is as long as the message.

For example, let’s say our plaintext is:

`WeIntendToBeginOnTheFirstOfFebruaryUnrestrictedSubmarineWarfare`

And the polyalphabetic key is a string of random characters as long as the message:

`ackwulsjwkblogbzcuknkqubpnnefjvcebuymaclzvzmzwfbxpmmzqwmmtejzfu`

{% include lab_question.html question='Discuss with your partner whether an attack in this case is possible. Are there any repeating patterns?' %}

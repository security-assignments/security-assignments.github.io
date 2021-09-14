---

title: "Lab: Asymmetric Encryption"
number: 3
description: Understanding asymmetric encryption and RSA practice
published: true
---

# Part 1. Understanding Asymmetric Keys

1.  **Key Exchange Problem.**

    Imagine 200 people wish to communicate securely using symmetric keys, one symmetric key for each pair of people. (See [Metcalf's Law](http://en.wikipedia.org/wiki/Metcalf%27s_law)).

    {% include lab_question.html question='How many symmetric keys would this system use in total?' %}

2.  **RSA keys vs AES keys.**

    Review [keylength.com](https://www.keylength.com), which gives estimates for good key lengths.

    The below screenshot from the site shows example output comparing different organization recommendations specifying the date "2030".

    {% include lab-image.html image='keylengths-comparison-table.png' %}

    Here are some tips for interpreting what is shown:
    - "Method": The site lists key length recommendations from multiple organizations, including from NIST.
    - "Date" means how long you’ll be secure until, using the given algorithm-keylengths.
    - Key lengths for multiple cryptography algorithmic approaches and applications are shown.
      - "Symmetric" algorithms include AES.
      - "Factoring Modulus" applies to asymmetric algorithms such as RSA.
      - "Discrete Logarithm" refers to asymmetric algorithms such as Diffie Hellman (DH).
      - "Elliptic Curve" (EC) is a variant of Discrete Logarithm algorithms, and is therefore also an asymmetric algorithm. EC variants of DH exist.
      - "Hash" refers to algorithms such as the SHA family.

    {% include lab_question.html question='Does a 256-bit RSA key (a key with a 256-bit modulus) provide strength similar to that of a 256-bit AES key? Explain.' %}


# Part 2. Calculating RSA keys

To help you answer the following questions, view [this “RSA Algorithm” video](https://youtu.be/Z8M2BTscoD4). Also, you can review [the RSA wikipedia page example](http://en.wikipedia.org/wiki/RSA_(cryptosystem)#Example).

You can use a calculator [such as WolframAlpha](https://www.wolframalpha.com/input/?i=14%5E27+mod+55) to help with this modular arithmetic. But you should understand the principles
well enough to perform them by hand with simple problems.

3.  Use RSA to encrypt `M=9` to cipertext and back again to plaintext using `p=5, q=11, e=3`. Show your work.

    {% include lab_question.html question='What is the ciphertext `C` when using RSA to encrypt `M=9` with `p=5, q=11, e=3`?' %}

    {% include lab_question.html question='Show your work both for encrypting the message (`M=>C`), and also for decrypting the message back (`C=>M`)' %}

4. You are Eve. In a public-key system using RSA, you intercept the ciphertext `C=10` sent to a user whose public key is `e=5, n=35`. Decrypt the cipertext.

	{% include lab_question.html question='What is the plaintext `M` given `C=10, e=5, n=35`?' %}


# Deliverable

Submit your answers for this lab by completing the associated lab quiz on your course's learning management system.

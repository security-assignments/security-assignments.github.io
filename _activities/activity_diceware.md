---
title: "Activity: Diceware Passphrases"
description: An exercise creating passphrases using the EFF's long improved-usability list.
slug: diceware
---

For this activity, you will calculate the strength of a five-word Diceware passphrase in terms of the time and money required to crack it.  

The [Diceware system](http://world.std.com/~reinhold/diceware.html) uses five six-sided dice to randomly select words from a *wordlist* of 7,776 words. 7,776 equals the number of sides on one dice, raised to the number of dice rolled together (6<sup>5</sup> = 7,776). This way, every roll of the five dice randomly selects a word from the list. Read more about Diceware [here](https://theintercept.com/2015/03/26/passphrases-can-memorize-attackers-cant-guess/).


The EFF has [created a set of Diceware lists](https://www.eff.org/deeplinks/2016/07/new-wordlists-random-passphrases) that are easier to use. For this activity, use the [EFF's "long" improved-usability list](https://www.eff.org/files/2016/07/18/eff_large_wordlist.txt), which also has 7,776 words, but which are easier to type and remember.

## Questions

1. Using five dice (either physcial dice or [virtual dice at random.org](https://www.random.org/dice/?num=5)) and the [EFF's instructions for generating passwords using dice](https://www.eff.org/dice), create two five-word Diceware passphrases. What passphrases did you create?

1. What is the amount of entropy in bits for your five-word Diceware passphrases? How many possible passwords does that represent? Show your work.

    **Note:** Each Diceware word is worth an additional `12.9` bits of entropy. This is because 2<sup>`12.9`</sup> ≈ 7776, the length of the Diceware word list.

1. **On average**, how long in **hours** would it take to guess a five-word Diceware passphrase if you could try 1 billion passwords a second? How many **years**? Show your work.

    **Note:** The average of a uniform distribution is half the numbers in a set.

1. An [Amazon EC2 *p3.16xlarge*](https://aws.amazon.com/ec2/instance-types/p3/) high-performance computer can try 76,920 master passwords a second for the [1Password password manager](https://1password.com).[^1] About how many of these computers would you need to rent in order to try 1 billion 1Password master passwords a second?

1. One Amazon EC2 *p3.16xlarge* computer costs [$24.48 an hour](https://aws.amazon.com/ec2/instance-types/p3/) to rent as of February 2023. Guessing at the rate of 1 billion passwords a second, **on average** how much would it cost you to rent enough of these computers to crack a 1Password master password that uses a five-word Diceware passphrase?[^2]

    **In other words:**  

    (# of hours from answer to Question 2) * (# computers from answer to Question 4) * $24.48 an hour = Total cost in $

1. What does Diceware have to do with [Kerckhoff’s principle and Shannon’s maxim](https://en.wikipedia.org/wiki/Kerckhoffs%27s_principle)?

1. How usable/memorable do you think Diceware passphrases are?

### Footnotes

[^1]: Iraklis Mathiopoulos' *p3.16xlarge* [Hashcat benchmarks](https://medium.com/@iraklis/running-hashcat-v4-0-0-in-amazons-aws-new-p3-16xlarge-instance-e8fab4541e9b) showed that it can guess 192.3 thousand 1Password master passwords a second at 40,000 iterations (hash mode 8200). However, 1Password now uses a slow hashing algorithm (PBKDF2-HMAC-SHA256) to hash the master password with [100,000 iterations](https://1password.com/files/1Password%20for%20Teams%20White%20Paper.pdf), or about 2.5 slower than the Hashcat benchmark. 192,300 / 2.5 = 76,920.
[^2]: This question is inspired by Micah Flee's calculations [here](https://github.com/micahflee/passphraseme/blob/master/README.md#strength-of-passphrases).

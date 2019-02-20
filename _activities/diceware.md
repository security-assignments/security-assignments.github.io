---
title: Diceware Activity
description: An exercise creating passphrases using the EFF's long improved-usability list.
---

For this activity, you will create passwords using wordlists. Passwords made of words are called passphrases. This approach was introduced in 1995 as the [Diceware system](http://world.std.com/~reinhold/diceware.html). The original wordlist had 7,776 words total. A single word is chosen from the list by rolling five 6-sided dice (6<sup>5</sup> = 7,776).

The EFF has [created a set of Diceware lists](https://www.eff.org/deeplinks/2016/07/new-wordlists-random-passphrases) that are easier to use. For this activity, use the [EFF's "long" improved-usability list](https://www.eff.org/files/2016/07/18/eff_large_wordlist.txt), which also has 7,776 words, but that are easier to remember. If you want to learn more about Diceware, Read [this article](https://theintercept.com/2015/03/26/passphrases-can-memorize-attackers-cant-guess/).

## Questions

1. Create two five-word Diceware passphrases. What are they?

1. What is the amount of entropy in bits for your five-word Diceware passphrases? How many possible passwords does that represent? Show your work.  
**Note:** Each Diceware word is worth an additional 12.9 bits of entropy. This is because 2<sup>12.9</sup> ≈ 7776, the length of the Diceware word list.

1. **On average**, how long in **hours** would it take to guess a five-word Diceware passphrase if you could try 1 billion passwords a second? How many **years**? Show your work.  
**Note:** The average of a uniform distribution is half the numbers in a set.
  
1. An [Amazon EC2 *p3.16xlarge*](https://aws.amazon.com/ec2/instance-types/p3/) high-performance computer can try 76,920 1Password master passwords a second.[^1] About how many of these computers would you need to rent in order to try 1 billion 1Password master passwords a second?

1. One Amazon EC2 *p3.16xlarge* computer costs [$24.48 an hour](https://aws.amazon.com/ec2/instance-types/p3/) to rent as of February 2019. Guessing at the rate of 1 billion passwords a second, **on average** how much would it cost you to rent enough of these computers to crack a 1Password master password that uses a five-word Diceware passphrase?[^2]  
**In other words:**  
(# of hours from answer to Question 2) * (# computers from answer to Question 4) * $24.48 an hour = Total cost in $


1. What does Diceware have to do with [Kerckhoff’s principle and Shannon’s maxim](https://en.wikipedia.org/wiki/Kerckhoffs%27s_principle)?

1. How usable/memorable do you think Diceware passphrases are?

### Footnotes

[^1]: Read about Iraklis Mathiopoulos' *p3.16xlarge* tests using Hashcat [here](https://medium.com/@iraklis/running-hashcat-v4-0-0-in-amazons-aws-new-p3-16xlarge-instance-e8fab4541e9b). 
[^2]: This question is inspired by Micah Flee's calculations [here](https://github.com/micahflee/passphraseme/blob/master/README.md#strength-of-passphrases). 
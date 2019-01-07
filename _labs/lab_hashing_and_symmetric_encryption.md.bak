---

title: Lab &ndash; Symmetric Encryption and Hashing 
number: 2
description: Fundamentals of symmetric encryption, cryptanalysis, and of hashing
vms:
    - Windows 10
---

# Part 1

## Polyalphabetic substitution and Transposition Ciphers 

1.  Using polyalphabetic substitution, with alphabet a–z (no caps) and a space (as the last character of the alphabet), use the private key `security` to encrypt the plaintext message:
     
         send money
	
    To help you, use the following formula:
	
        Encryption: ciphertext = (plaintext + key) mod 27

        Decryption: plaintext = (ciphertext - key) mod 27
	
    Important: Number your alphabet so that it starts with zero, e.g., `A = 0, Z=25, [space] = 26`.
    
    As a general rule for shift ciphers, *the modulus is always the size of the alphabet, but you must start your alphabet at 0*.
    
    {% include lab_question.html question='What is the ciphertext when encrypting "send money" with the key "security"?' %}
    
2.	Consider the transposition method discussed in class.  Assume the plaintext is
		
        attack postponed until two am
		
    and the key is `{3421567}`
        
    Create the ciphertext as was demonstrated in class. Pad the message so that there is an even block of characters, meaning that each column will have the same number of characters. One way to do this is to pad the block by repeating the message a character at a time until the block is complete. Or, you can fill out the block with random letters from the alphabet. Show your result.
    
    {% include lab_question.html question='What is the ciphertext when encrypting "attack postponed until two am" with the key {4312567}? (Enter without spaces)' %}

    
## Frequency analysis

[Download](https://www.cryptool.org/modules/mod_ctdownloads/assets/curversion.php) and install CrypTool 2 (Windows only).

Open CrypTool 2.0. Under Templates, select Cryptanalysis, then Classical, and double-click on Frequency Analysis. Paste the cipher text below into the Text Input box and hit the Play button. This will use CrypTool’s cryptanalysis function, “Frequency Test,” to analyze the following message. The results of the analysis will show up in the box on the right.

    Hvs Qosgof qwdvsf wg boasr othsf Xizwig Qosgof, kvc, oqqcfrwbu hc Gishcbwig, igsr wh kwhv o gvwth ct hvfss hc dfchsqh asggousg ct awzwhofm gwubwtwqobqs. Kvwzs Qosgof'g kog hvs twfgh fsqcfrsr igs ct hvwg gqvsas, chvsf gipghwhihwcb qwdvsfg ofs ybckb hc vojs pssb igsr sofzwsf.

    Wt vs vor obmhvwbu qcbtwrsbhwoz hc gom, vs kfchs wh wb qwdvsf, hvoh wg, pm gc qvobuwbu hvs cfrsf ct hvs zshhsfg ct hvs ozdvopsh, hvoh bch o kcfr qcizr ps aors cih. Wt obmcbs kwgvsg hc rsqwdvsf hvsgs, obr ush oh hvswf asobwbu, vs aigh gipghwhihs hvs tcifhv zshhsf ct hvs ozdvopsh, boaszm R, tcf O, obr gc kwhv hvs chvsfg.
    —Gishcbwig, Zwts ct Xizwig Qosgof 56

    Vwg bsdvsk, Oiuighig, ozgc igsr hvs qwdvsf, pih kwhv o fwuvh gvwth ct cbs, obr wh rwr bch kfod ofcibr hc hvs psuwbbwbu ct hvs ozdvopsh:
    Kvsbsjsf vs kfchs wb qwdvsf, vs kfchs P tcf O, Q tcf P, obr hvs fsgh ct hvs zshhsfg cb hvs goas dfwbqwdzs, igwbu OO tcf L.
    —Gishcbwig, Zwts ct Oiuighig 88

    Hvsfs wg sjwrsbqs hvoh Xizwig Qosgof igsr acfs qcadzwqohsr gmghsag og kszz, obr cbs kfwhsf, Oizig Uszzwig, fstsfg hc o (bck zcgh) hfsohwgs cb vwg qwdvsfg:
    Hvsfs wg sjsb o fohvsf wbusbwcigzm kfwhhsb hfsohwgs pm hvs ufoaaofwob Dfcpig qcbqsfbwbu hvs gsqfsh asobwbu ct zshhsfg wb hvs qcadcgwhwcb ct Qosgof'g sdwghzsg.
    —Oizig Uszzwig, Ohhwq Bwuvhg

    Wh wg ibybckb vck sttsqhwjs hvs Qosgof qwdvsf kog oh hvs hwas, pih wh wg zwyszm hc vojs pssb fsogcbopzm gsqifs, bch zsogh psqoigs acgh ct Qosgof'g sbsawsg kcizr vojs pssb wzzwhsfohs obr chvsfg kcizr vojs oggiasr hvoh hvs asggousg ksfs kfwhhsb wb ob ibybckb tcfswub zobuious. Hvsfs wg bc fsqcfr oh hvoh hwas ct obm hsqvbweisg tcf hvs gczihwcb ct gwadzs gipghwhihwcb qwdvsfg. Hvs sofzwsgh gifjwjwbu fsqcfrg rohs hc hvs 9hv qsbhifm kcfyg ct Oz-Ywbrw wb hvs Ofop kcfzr kwhv hvs rwgqcjsfm ct tfseisbqm obozmgwg.

    Qosgsf_qwdvsf, Kwywdsrwo

**Questions:**

1. Examine the frequency table in the Frequency Test component. What are the four most frequent characters, in descending order? Examine the frequency table chart at [http://en.wikipedia.org/wiki/Frequency_analysis](http://en.wikipedia.org/wiki/Frequency_analysis). What does this suggest the four letters identified correspond to?

    {% include lab_question.html question='According to CrypTool, what are the four most frequent characters?' %}

2. Do the same analysis, but for character pairs (bigrams) or trigrams. You can either open up a new Frequency Test or hit the Stop button and modify the test you’re currently running.  Under the settings tab of the Frequency Test box, you can change the length of n-grams.  Hit Play and then view the Presentation tab for a graphical view of your results.  What are the three most frequent N-grams of length 2 in your analysis? Examine the frequency table chart at [http://en.wikipedia.org/wiki/Bigram](http://en.wikipedia.org/wiki/Bigram). What does this suggest the three 2-length N-grams identified correspond to? Also examine N-grams of length 3, and report the likely plaintext identities of the four 3-length N-grams reported (use [http://en.wikipedia.org/wiki/Trigram](http://en.wikipedia.org/wiki/Trigram)).

    ![image_1]( {{ '/assets/images/lab_2/lab_2_1.png' | relative_url }})
    
    {% include lab_question.html question='According to CrypTool, what are the three most frequent trigrams?' %}
    
3. Assume that a simple cipher that shifts all characters by a fixed number was used to create the cipertext. Given the above information, what is the key (the shift to go from plaintext to ciphertext)?  Don’t be proud; you can use your fingers to count.   

    {% include lab_question.html question='What is the key of the ciphertext, counting forwards?' %}

4. What is the plaintext?  (Hint: Which cipher shifts all the characters by a fixed number?  It’s listed as one of the Classic Ciphers in this tool, so you can use this tool to perform the decryption.)

    {% include lab_question.html question='What author is quoted in the plaintext?' %}
    
## One-time Pad

Using Cryptool2, decrypt the following ciphertext using the following one-time pads. 
**Note:** Click "New" > "Workspace" to get started. You’ll need to use the XOR function under “Classic Ciphers” to do the encryption. You’ll also need to use the “String Decoder” to decode the string as hexadecimal before passing the stream to the XOR function (see screenshot below).
I like to use the Tools tab on the bottom-left and its search bar to drag components such as XOR and "String Decoder" into my project.

Use the screenshot below to see how to connect the components. Put the ciphertext into one text input box and the one-time pads in the other text input box, one at a time. 
Click-and-drag the component arrow connectors over to an appropriate connector arrow on the next component 
(it may not be the same one as shown in the screenshot -- the CrypTool tooltip guides will help you).

![image_1]({{ "/assets/images/lab_2/lab_2_2.png" | relative_url }})

Ciphertext (hexadecimal): `E0 C5 B5 B0 82 9A 8A DA B8 FD 8A 9E 67 5A 57`

1. One-time pad 1: `A1 B1 C1 D1 E1 F1 AA BB CC DD EE FF 10 34 76`
    
    {% include lab_question.html question='What is the plaintext using the one-time pad 1?' %}

2. One-time pad 2: `B2 A0 C1 C2 E7 FB FE FA D9 89 AA AF 56 6A 67`
    
    {% include lab_question.html question='What is the plaintext using the one-time pad 2?' %}

3. One-time pad 3: `B3 B0 C7 C2 E7 F4 EE BF CA DD EC F1 15 2E 76`
    
    {% include lab_question.html question='What is the plaintext using the one-time pad 3?' %}

4. One-time pad 4: `B4 AD D0 90 E1 FB FE FA D1 8E AA FA 02 3B 33`
    
    {% include lab_question.html question='What is the plaintext using the one-time pad 4?' %}

{% include lab_question.html question='How many possible plaintexts exist for this one-time-pad ciphertext?' %}



# Part 2

## Hashing

Find a file and hash it with multiple hashing algorithms (e.g., using md5deep.exe, sha1deep.exe, and sha256deep.exe, command-line tools installed on the windows vm).

* You can use "hash-me.txt" on the Windows vm desktop
* `Shift+Right-click` on the desktop _without having any file selected_ and choose "Open PowerShell window here"
* The command-line tools are available from this prompt, which means you can type their name followed by the filename to get a hash. E.g., "md5deep hash-me.txt"

<div class='alert alert-info'>
<p>If you're not using the lab VM, you can download the command-line tools yourself from <a href='https://github.com/jessek/hashdeep/releases/download/v4.4/md5deep-4.4.zip'>here</a>.
You'll unzip them and then open an command prompt (sorry, I have no idea how to open a command prompt from parallels, let me know if you know how.). Then you can either call the full path to the tools (e.g., c:\path\to\md5deep.exe), or you can
Windows key > "Edit the System environment variables" > "Environment Variables" > select "Path" > "Edit" > "New" > "Browse" > (Browse to the path where you unzipped your md5deep stuff, the folder where the .exe's are). Hit Ok > Ok > Ok (you have to do all three before it applies)
then open a new command prompt / PowerShell window. Voila, you should have the tools avaialble on your path now.</p></div>

**Questions:**

1.	What is the length of each algorithm hash in characters (MD5 sha1, sha256)? How many bits does each hash represent? 

    (hint: how many bits are in one hex digit -- also called a 'nibble'? How many nibbles in the key? Or, How many bits in a byte, and how many bytes in a two-digit hex number like 'FA'? Review [this](https://simple.wikipedia.org/wiki/Hexadecimal_numeral_system) if you're still stuck)

    {% include lab_question.html question='How many bits are in an MD5 hash?' %}

Make a copy of your file and open the copy in HxD. (HxD is available on the desktop.) Use the hexeditor to change just a single bit (e.g, change an “A” — 1010 to a B — 1011. Use Windows Calculator in the “Programmer” mode to be sure that your hexcode change represents a change of only one bit.) 
Save the modified file and hash it again. Since you only changed a single bit in a file of billions of bits, you might reason that the hashes would be nearly the same. Are they?

{% include lab_question.html question='If only one bit is changed on a 10 GB file how different will the hash be?' %}
{% include lab_question.html question='Which property of cryptographic hash functions is most related to the previous question?' %}



**Optional:** Use the MD5 function in CrypTool to hash a file. Look at the graphical depiction for how it works.

![image_4]({{ "/assets/images/lab_2/lab_2_4.png" | relative_url }}){: width="300px" }


## Symmetric encryption with AES

Decrypt the message below using AES and the following parameters:
Message (base64): 

    K2NsjCqFlnNVFK1dTTm/opzc0Fq+qNj8UVg+nvIzeEgv5Y3GHATcnyROU6eg+6BAesm5qrtZe5vdjP+ffI/vYIEqIxZh9CSCbxBCo2HEYjbOFCIkx3OuoaomxGChwwbRS2lX37prQMR3VYKVXvQoLUPocPXn+oxnqqHXS/2JbLkTlOje6mrLhnjlI6VDkGDMZI3WqWRe5aHNyzQTEdhXbizHGcKrk/JpX7L1ODY0gdw6InhXew5c4EEcqQInONbYel8W5xwPYFojsKTbKRAOrNqIfI46vD9ziAFCbkG10aIRzLJmxQrkiX+DPwjuxC/p97C9Rm9DS2zn4Yy1mZCFalVDk2MLfgRtW2MBpHDHV1FGdhusnH1E0WNaOfTKlU5tyh3ImBEHS0VBlv3wEEm9f2MVyxK/0T6JdfHD/Szf1yj0GNNMGeKTpmPjP0lmwVdo5GkJJsVBPAWzGqeI+q9phUGw6YC7f4NvlT/RiyOoM8aFAwJxA7MsKTFxyv9ib47pYC8YfOJPpnuGiHw2GutS17KxiROs6fZX0xEx0Iw0fEKYVYNQwAAzskej6pMeUcnBMRBXKPZkHPFOvR4UXQymkf8NtToQrIM4ZYFBX6+TGoA=

- Algorithm: AES
- Chaining mode: CBC
- Padding mode: Zeros
- IV (hexadecimal): `15 7F 14 FF DF D1 D4 25 D9 CB BD 12 ED 98 49 2F`
- Key (hexadecimal): `FA 71 7D 51 3F D7 32 7D D9 C7 13 84 43 47 C2 5B 2F 9C 1E 48 67 C6 81 32 85 5A 13 92 60 A8 79 44`
- Keysize (in bits): `?` (You have to count; see the hint in the hashing section above.)
- Blocksize (in bits; IV block length): `?` (hint: count the IV above, just like you did the key)

![image_1]({{ "/assets/images/lab_2/lab_2_3.png" | relative_url }})

What is the plaintext of the message?

{% include lab_question.html question='What is the URL included in the plaintext you decrypted with AES?' %}


## Message Sharing

Use AES or another symmetric block cipher to encrypt/decrypt messages exchanged between you and another class member. (You could email encrypted messages to one another, and decrypt using CryptTool. You can copy-paste from the host into your VM if you enable the bidirectional clipboard)

![image_1]({{ "/assets/images/lab_2/lab_2_5.png" | relative_url }}){: style="border: 1px solid black;" }


Questions:

1. {% include lab_question.html question='How did you ensure that the key exchange was safe? How would you exchange keys if you were not in the same location?' %}

1. {% include lab_question.html question='Which of the parameters of a block cipher (e.g., algorithm name, mode of operation, IV (if any), key length) are <strong>essential</strong> to keep secret? Security through obscurity does not count as "essential".' %}


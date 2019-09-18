---

title: "Lab: Asymmetric Encryption"
number: 3
description: PGP setup and RSA practice
published: true
---

{% assign user_email_domain = site.instructorcollab_domain %}

{% if user_email_domain == 'colorado.edu' %}
    {% assign user_id_label = 'identikey' %}
{% elsif user_email_domain == 'temple.edu' %}
    {% assign user_id_label = 'TUid' %}
{% endif %}

# Part 1. Understanding Asymmetric Keys

1. **Key Exchange Problem.** Imagine 200 people wish to communicate securely using symmetric keys, one symmetric key for each pair of people. (See [Metcalf's Law](http://en.wikipedia.org/wiki/Metcalf%27s_law)). 

    {% include lab_question.html question='How many symmetric keys would this system use in total?' %}

2. **RSA keys vs AES keys**

    {% include lab_question.html question='Does a 256-bit RSA key (a key with a 256-bit modulus) provide strength similar to that of a 256-bit AES key? Explain.' %}

    Note: [www.keylength.com](http://www.keylength.com) gives estimates for good key lengths. Here's a tip for interpreting that site: If you were to select "Compare all methods", and then enter the year "2030", the “Method” column means “group that makes recommendations using their method” (recall that NIST held the competition that resulted in the AES winner being selected). “Date” means how long you’ll be secure until. “Symmetric” means the minimum keysize you would need to be secure for that long using a symmetric method such as AES. “Factoring Modulus” means the minimum keysize you would need to be secure for that long using an asymmetric method such as RSA.
    
# Part 2. Calculating RSA keys

    
<div class='alert alert-info'>Note: To help you answer the following questions, view <a href='https://youtu.be/Z8M2BTscoD4'>this “RSA Algorithm” video</a>. Also, you can review <a href='http://en.wikipedia.org/wiki/RSA_(cryptosystem)#Example'>the RSA wikipedia page example.</a></div>


3. Complete encryption and decryption using the RSA algorithm, for the following data (show all work): `p = 5, q = 11, e = 3, M = 9`. Also:
	
    {% include lab_question.html question='What is the ciphertext when performing RSA encryption with p=5, q=11, e=3, M=9?' %}
    
    {% include lab_question.html question='Show all work for encryption <b>and</b> decryption' %}

4. You are Eve. In a public-key system using RSA, you intercept the ciphertext, `C=10`, sent to a user whose public key is `e=5, n=35`. {% if site.instructorcollab_username == 'deargle' %}You grin -- an evil, knowing grin.{% endif %}

	{% include lab_question.html question='What is the plaintext `M`?' %}
    
    

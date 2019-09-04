---

title: "Lab: Asymmetric Encryption"
number: 3
description: PGP setup and RSA practice
published: false
---

{% assign user_email_domain = site.instructorcollab_domain %}

{% if user_email_domain == 'colorado.edu' %}
    {% assign user_id_label = 'identikey' %}
{% elsif user_email_domain == 'temple.edu' %}
    {% assign user_id_label = 'TUid' %}
{% endif %}

<div class='alert alert-danger'><strong>Important:</strong> To receive full credit, you must complete Part 1 of the lab by the day marked in the calendar, which entails generating a PGP keypair, uploading your public key to a keyserver, and submitting your key's fingerprint on Canvas. This is required for the PGP key signing class activity.</div>

<div class='alert alert-info'>I recommend using the Windows 10 vm for this lab. Alternatively, you can install <a href="https://www.gpg4win.org/">GPG4Win</a> for Windows or the excellent <a href="https://gpgtools.org/">GPG Suite</a> for Mac. However, you're responsible to figure out the below steps if you do.</div>

# Part 1. Install PGP and Create a Public-Private Key Pair

On the Windows 10 VM, open the app `Kleopatra`. This is an app that interfaces with GPG, allowing you to create and manage GPG public/private keypairs.

Do the following:

* Open Kleopatra > navigate to `Settings` > `Configure Kleopatra` > `GnuPG System` > then click `edit` next to "use keyserver at", then change the server name to `pgp.circl.lu`, then "OK", and "OK".
* Then, in Kleopatra still, `File` > `New Certificate`
* Create a personal OpenPGP key pair
* Enter your first and last name and your **{{user_id_label}}@{{user_email_domain}}** email. Do <span class='label label-danger'>not</span> click "OK" yet.
* `Advanced Settings` > change the keylength to `4096 bits` for both fields.
* Create the key. If you enter a passphrase (you should, although you don't have to), *do not forget your passphrase*. Click "Finish".
* Double-click on your newly-created key to open it. Open the "User-IDs & Certifications" tab. Highlight your key, and click "Add". Add your **first.last@{{user_email_domain}}** email variant.
* Take note of your key `Key-ID` displayed in the Kleopatra interface. *This is your short-form key fingerprint.* If you double-click the key, the dialog will display your full-length key fingerprint.
* Right-click your key and "Export Certificates to Server..." This will send your key to `pgp.circl.lu`, from where it will replicate to other keyservers around the world—eventually. Sometimes the replication is very quick (minutes), while in other cases [it can reportedly take hours](https://security.stackexchange.com/questions/96949/how-long-before-a-key-is-visible-on-a-key-server).
    *   Alternatively, you can: 
        * right-click and "export certificate", choose "then save the `.asc` file, open this file in notepad which will begin with a line like 
                
                -----BEGIN PGP PUBLIC KEY BLOCK-----
        * visit `https://pgp.circl.lu`, click, "submit key", and paste in the _entire contents_ of your `.asc` file. No extra lines, spaces, or anything. Nothing more, nothing less. These servers are finnicky.
        
        It's the same thing as submitting via Kleopatra. In fact, if you wanted to send someone your public key without relying on a keyserver, you could sent them the `.asc` file as an email attachment.
* Use a web browser to browse `https://pgp.circl.lu` and verify that when you search by your name or email address, your key is displayed, with the correct keyID, that it is 4096 bits, and that both of your `@{{site.instructorcollab_domain}}` email addresses are associated with your key.
    * To search by your key-id or fingerprint, prefix the value with `0x`, which is the prefix for [hex values](https://en.wikipedia.org/wiki/Hexadecimal). For example, to search for my key-id, `8DC01F3A`, I would enter the following search query into `https://pgp.circl.lu`: `0x8DC01F3A`. For searching fingerprints, make sure there are no spaces in between characters.
* Once you have verified the above, submit your fingerprint on Canvas.



<div class='alert alert-info'>It is important that <strong>both</strong> your <code>{{user_id_label}}</code> and <code>first.last</code> email variants are tied to your key, so that you can get credit for this part of the lab. If you forget, you can add and then re-export, and your key will be updated on the keyserver—eventually.</div>


## Part 1 deliverable

In summary, using Kleopatra:

* Upload your key to a keyserver
* Make a key with key length of 4096 bits
* Ensure that both **first.last@{{user_email_domain}}** and **{{user_id_label}}@{{user_email_domain}}** addresses are associated with your key
* Verify that your key is discoverable on `https://pgp.circl.lu`
* Submit your key key-id or fingerprint on Canvas

**Q:** Why do we need a 4096-bit key? Isn't that overkill?

**A:** [To better future-proof your key](https://www.yubico.com/2015/02/big-debate-2048-4096-yubicos-stand/), Generate a 4096-bit key, not the default 2048-bit one. 

**History Lesson:** Edward Snowden originally reached out directly to Glenn Greenwald, seeking to leak the NSA documents. However, Greenwald didn't have a secure communication method such as PGP. So, Snowden made him a voice-obfuscated how-to video, for doing the same things that you are doing. Greenwald blew it off, because seriously who has time for the usability mess that is PGP. Eventually, Greenwald's friend and journalist, Laura Poitras, arranged for Greenwald to meet Snowden anyway. [Watch Snowden's tutorial video to Greenwald here.](https://vimeo.com/56881481)



# Part 2. Understanding Asymmetric Cryptography 



1. **Key Exchange Problem.** Imagine 200 people wish to communicate securely using symmetric keys, one symmetric key for each pair of people. (See [Metcalf's Law](http://en.wikipedia.org/wiki/Metcalf%27s_law)). 

    {% include lab_question.html question='How many symmetric keys would this system use in total?' %}

2. **RSA keys vs AES keys**

    {% include lab_question.html question='Does a 256-bit RSA key (a key with a 256-bit modulus) provide strength similar to that of a 256-bit AES key? Explain.' %}

    Note: [www.keylength.com](http://www.keylength.com) gives estimates for good key lengths. Here's a tip for interpreting that site: If you were to select "Compare all methods", and then enter the year "2030", the “Method” column means “group that makes recommendations using their method” (recall that NIST held the competition that resulted in the AES winner being selected). “Date” means how long you’ll be secure until. “Symmetric” means the minimum keysize you would need to be secure for that long using a symmetric method such as AES. “Factoring Modulus” means the minimum keysize you would need to be secure for that long using an asymmetric method such as RSA. 

<div class='alert alert-info'>Note: To help you answer the following questions, view <a href='https://youtu.be/Z8M2BTscoD4'>this “RSA Algorithm” video</a>. Also, you can review <a href='http://en.wikipedia.org/wiki/RSA_(cryptosystem)#Example'>the RSA wikipedia page example</a></div>
    
3. Complete encryption and decryption using the RSA algorithm, for the following data (show all work): `p = 5, q = 11, e = 3, M = 9`. Also:
	
    {% include lab_question.html question='What is the ciphertext when performing RSA encryption with p=5, q=11, e=3, M=9?' %}
    
    {% include lab_question.html question='Show all work for encryption <b>and</b> decryption' %}

4. You are Eve. In a public-key system using RSA, you intercept the ciphertext, `C=10`, sent to a user whose public key is `e=5, n=35`. {% if site.instructorcollab_username == 'deargle' %}You grin -- an evil, knowing grin.{% endif %}

	{% include lab_question.html question='What is the plaintext `M`?' %}
    
    

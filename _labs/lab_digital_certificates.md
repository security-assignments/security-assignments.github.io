---

title: "Lab: Digital Certificates"
number: 4
description: PGP key party, contrasted with Signal
---

<div class='alert alert-info'>I recommend using the Windows 10 VM for this lab. Alternatively, you can install <a href="https://www.gpg4win.org/">GPG4Win</a> for Windows or the excellent <a href="https://gpgtools.org/">GPG Suite</a> for Mac. However, you're responsible to figure out the below steps if you do.</div>

# Part 1

## Part 1a. Sign some public keys from the key signing party

First, make sure that Kleopatra is set to point to `pgp.circl.lu` -- <span class='label label-danger'>not <code>pgp.mit.edu</code> or <code>keys.gnupg.net</code></span>.

1. `Kleopatra` > `Settings` > `Configure Kleopatra` > `Directory Services`. You should have only one entry here: `pgp.circl.lu` -- and it should be set for `OpenPGP` (the default). If this is not the case, delete all entries, then press `new`. You should get the correct default.

Then, repeat the steps below for at least three classmates, not including your professor.

1. Verify their keys (i.e., witness the person show his/her government ID and attest that his/her key-id or fingerprint is correct).
2. Sign the public key that you have verified.
    1. Get their public key into your keyring.
        1. I bundled the keys for the class into a keyring—find it on `Slack` under `#labs` or in `Canvas` > `Files` > `Download` folder and import the `.asc`. file there.
        2. If their key is not in the keyring: 
            * You can use the `Lookup Certificates on Server` button within Kleopatra, 
            * Or, you can manually navigate to `pgp.circl.lu` from a web browser, find their key, 
                * select-all and copy to your clipboard, then `Kleopatra` > `Clipboard` > `Certificate Import`
                * select-all and paste into a blank `notepad` document, save with a `.asc` extension, then `Kleopatra` > `Import Certificates`
                * sometimes, the server is responsive via the protocol that Kleopatra uses, but not the web browser protocol. Try one if the other isn't working.
                * While testing, I experienced the frustrating situation where `https://pgp.circl.lu` search-by-key-id-or-fingerprint did not work unless I opened "advanced options' and deselcted all options on the left. Don't forget to append `0x` to your query.
            * You can make them do all this for you on your machine if you want, since they didn't get their key in to me in time ;-)
    1. In `Kleopatra`, right-click the key > `Certify Certificate`.
    2. Check each of the key IDs that you have verified.
    3. Check "I have verified the fingerprint" (assuming that you have!)
    4. Choose which of your private keys you will use to sign/certify their key. Change the radio to "Certify for everyone to see". Leave the "Send certified certificate to server afterwards" checked.
    5. Send the key to the keyserver.
    
    <div class='alert alert-info'><strong>Factoid: </strong>In PGP culture, it can be considered rude to upload someone else's key to a public server. They might not want your signature on their key, or they may not want their key on a keyserver. In practice, you could alternatively export their key after you have certified it, and send it back to them. But for this assignment, we simply upload the certified keys to a keyserver.</div>
    
 
3. At this point, the signed-key owner should be able to redownload their own public key from the server, and see the new signature.

    1. `Kleopatra` > `Lookup Certificates on Server` > search for their key... reimport
    2. Double-click the key > `User-IDs & Certifications` > `Load Certifications (may take a while)` > Look for new signatures.
    
### Part 1a deliverable

{% include lab_question.html question='What are the names, email address(es), and fingerprints or key-ids of the three people whose keys you signed?' %}


## Part 1b. Have at least three people sign and upload your key.

Follow the steps above, and make sure that your key is discoverable on `pgp.circl.lu`.

1.	Ensure that your public key is uploaded to a PGP key server like [https://pgp.circl.lu](https://pgp.circl.lu). In Kleopatra, you can upload a key to OpenPGP by highlighting your key, right-clicking it, and selecting "export certificates to server". Other key-management software should have similar easy-to-use functionality.)
2.	Ensure that your public key available on public key servers has been signed by members of the class. To do this, you can re-download or refresh your public key from the key server, then view your key details.

{% include lab_question.html question='What is your key-id or fingerprint? (Tell me again even if you submitted this before. It\'s possible that some of you lost your key and had to create a new one.)' %}

{% include lab_question.html question='What are the names, email address(es), and fingerprints or key-ids of the three people who signed <i>your</i> key?' %}



## Part 1c. Send and receive an encrypted email via PGP
	
For this, use `GPA` (gnu-privacy-assistant), which is installed on the Windows 10 VM. `GPA` has access to the same keyring on your machine as does `Kleopatra`.
    
You will send an <span class='label label-info'>encrypted <strong>and</strong> signed</span>email to <a href='mailto:ryan.mccreesh@gmail.com'>ITA Ryan McCreesh (ryan.mccreesh@gmail.com)</a> (Key-id: `C3F4E242`). 

<div class='alert alert-danger'>
    <p><strong>Q:</strong> But how can we trust this key?</p>
    <p><strong>A:</strong> Download it and look at the signatures (refresh from the keyserver to see it). It was signed with my key `F3E02337`, which I verified in the key signing party. If you trust me, and you trust me to only sign keys that I have verified, then can you trust this key?</p>
</div>

You will receive a response encrypted with your key which contants a secret code. This secret code will be the deliverable for this question. You will not receive the code if:
* Your public key cannot be found.
* You did not sign your message with your key.
* You did not encrypt your message with the public key of `ryan.mccreesh@gmail.com`.

1. Launch `GPA` on the Windows 10 vm. It opens with the `Clipboard` view.
1. In this view, type a message for Ryan McCreesh.
1. Click "Encrypt". Choose _at least_ the public key for `ryan.mccreesh@gmail.com`.
    * If you also want to be able to decrypt what you encrypt, then also select your public key.
1. Check the box for `Sign`. Select with which key you will sign the message.
   <div class='alert alert-info'>If you are curious what a signed-but-not-encrypted message looks like, write a message, then press the `Sign` button within GPA. Observe the result—the original message in plaintext, and a block with a signed hash. If you applied your public key to this signed hash, you would obtain a hash against which you could compare your own hash of the plaintext. Cool, isn't it? (The correct answer is "yes".)</div>
1. Copy-paste the output of the previous step into an email you compose on `gmail.com` or whatever email service or client you use. Just send it from an email address associated with your public key.
1. Make sure that the recipient has access to your public key. You can provide a link to your key on the keyserver, or attach your public key.
1. If you <span class='label label-info'>encrypted <strong>and</strong> signed</span> your message, then you will receive an encrypted response back, encrypted with your public key. Decrypt this response. This response is the answer to the next question in this lab.
    1. If you missed a step, you will receive back a plaintext message saying as much.
    
{% include lab_question.html question='What is the plaintext of what you received back?' %}


# Part 2. Overall Questions

Read [the following article](https://en.wikipedia.org/wiki/Web_of_trust).

{% include lab_question.html question='Compare and contrast the trust models used by PGP public key versus X.509 certs used by websites.' %}

# Part 3. Communicate Securely with Signal

1.	Watch this [video](https://video.vice.com/en_us/video/motherboard-hacking-week-how-to-use-signal-encryption/5a0f6547177dd45aee30e663) and Read about WhisperSystem’s Signal app [here](https://signal.org/) and [here](https://theintercept.com/2017/05/01/cybersecurity-for-the-people-how-to-keep-your-chats-truly-private-with-signal/).

2.  Also read about the cryptographic primities that the Signal protocol uses, [here](https://medium.com/@justinomora/demystifying-the-signal-protocol-for-end-to-end-encryption-e2ee-ad6a567e6cb4).

{% include lab_question.html question='What attacks does Signal protect you against? Which does it not protect you against?' %}
{% include lab_question.html question='On a high level, how does the Signal protocol work?' %}

2.	Install the app “Signal” on an iOS or Android device (if you don’t have an iOS or Android device, borrow one from a friend). Ask a partner (friend or classmate) to do the same.

3.	Using Signal, call or send a text message to your partner.

4.	Reflect: How does your experience using Signal compare to using encrypted email with PGP?

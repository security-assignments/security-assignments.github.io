---
title: "Lab: Digital Certificates and Trust"
number: 4
description: Understanding digital certificates and their drawbacks
published: true
---

# Part 1: Understanding Digital Certificates

A digital certificate “is essentially a public key accompanied by a signature of that key and associated information” [(Aumasson 2018, _Serious Cryptography_)](https://nostarch.com/seriouscrypto).
For TLS [(X.509)](https://en.wikipedia.org/wiki/X.509) certificates, this information includes the domain name, optionally alternative domain names that a cert is valid for,
issue and expiration dates, and other details.

## Examining details of IBM.com's Certificate

Browse to [ibm.com](https://ibm.com) and inspect the certificate details. For example, in Firefox:

*   Click on the padlock icon in the URL bar.
*   Click on the arrow to the right of the domain name.

    {% include lab-image.html image='firefox-ssl-ibm.png' with="300px" %}

*   Click on "More Information"
*   Click "View Certificate"

    {% include lab-image.html image='firefox-ssl-ibm-view-certificate.png' with="300px" %}

*   Click on the "Details" tab.

{% include lab_question.html question='What is the root certificate authority for ibm.com?' %}

{% include lab_question.html question='What is the intermediate certificate authority?' %}

The purpose of an intermediate authority is the following:

"Every publicly-trusted Certificate Authority (such as Let’s Encrypt) has at least one root certificate which is                 incorporated into various browser and OS vendors’ (e.g. Mozilla, Google) trusted root stores. This is what allows users who receive a certificate from a website to confirm that the certificate was issued by an organization that their browser trusts. But root certificates, by virtue of their widespread trust and long lives, must have their corresponding private key carefully protected and stored offline, and therefore can’t be used to sign things all the time. So every Certificate Authority (CA) also has some number of “intermediates”, certificates which are able to issue additional certificates but are not roots, which they use for day-to-day issuance" [(Let's Encrypt 2020)](https://letsencrypt.org/2020/09/17/new-root-and-intermediates.html).

    What are some of the other domains for which this certificate is valid?' In Firefox, these are listed under "Certificate Subject Alt Name."

{% include lab_question.html question='What are some of the other domains for which the ibm.com certificate is valid?' %}

For TLS X.509 certificates, the signature in the certificate is signed by the public key included in an intermediate or root certificate authority certificate (see figure below).
An intermediate certificate, if any, is signed by the public key included in a root certificate. The root certificate is signed using the public key in its own certificate (a self-signed certificate).
Linking certificates in this way forms a certificate chain.

{% include lab-image.html image='ssl-cert-chain.png' %}

_Certificate chain image from [Wikipedia](https://en.wikipedia.org/wiki/Public_key_certificate)_

{% include lab_question.html question="For IBM's certificate, what algorithm do they use for their public key?" %}
{% include lab_question.html question="What is the keysize of their public key?" %}



## Root Certificate Authorities

1.  In your Kali VM, open Firefox. Click on the "hamburger" icon in the top-right, and select "Preferences."

    {% include lab-image.html image='firefox-hamburger.png' width="150px" %}

2.  Select "Privacy & Security" on the left-hand side of the preferences window, and scroll down to the bottom to see the "Certificates" section. Click the "View Certificates" button.
3.  Under the 'Authorities' tab, find the "DigiCert Global Root CA" certificate that was ultimately used to verify the authenticity of IBM's certificate. Click "Edit Trust."

    {% include lab_question.html question="What can this DigiCert root certificate be used for?" %}

4.  Now find any of the root certificates for Symantec Corporation. Select one and click "Edit Trust."
    What can this Symantec root certificate be used for? What can it _not_ be used for? Examine other certs in the list to see what a "normal" cert in Firefox's store can do.

    {% include lab_question.html question="What can this Symantec root certificate be used for?" %}

    Why is the trust for Symantec's cert anomalous? To help you answer this question, look at one or more of the following resources:

    * [https://security.googleblog.com/2017/09/chromes-plan-to-distrust-symantec.html](https://security.googleblog.com/2017/09/chromes-plan-to-distrust-symantec.html)
    * [https://arstechnica.com/information-technology/2017/03/google-takes-symantec-to-the-woodshed-for-mis-issuing-30000-https-certs/](https://arstechnica.com/information-technology/2017/03/google-takes-symantec-to-the-woodshed-for-mis-issuing-30000-https-certs/)
    * [https://blog.mozilla.org/security/2018/03/12/distrust-symantec-tls-certificates/](https://blog.mozilla.org/security/2018/03/12/distrust-symantec-tls-certificates/)

    {% include lab_question.html question="Why does Firefox trust Symantec's Certificates in this way?" %}




## Untrusted Root CA

1.  Under the “Servers” tab of the View Certificates” dialog, certificates for what organization are listed? Click on one of the certificates and click the "View" button.
3.  There is a message at the top of the View window's General tab.
    What does Firefox say about the trust of this Root Certificate authority? Why does Firefox say this?

    To help you answer this question, look at one or more of the following resources:
    * [Darknet Diaries Podcast, episode 3: “DigiNotar, You are the Weakest Link, Good Bye!](https://darknetdiaries.com/episode/3/)
    * [https://slate.com/technology/2016/12/how-the-2011-hack-of-diginotar-changed-the-internets-infrastructure.html](https://slate.com/technology/2016/12/how-the-2011-hack-of-diginotar-changed-the-internets-infrastructure.html)
    * [https://security.googleblog.com/2011/08/update-on-attempted-man-in-middle.html](https://security.googleblog.com/2011/08/update-on-attempted-man-in-middle.html)

    {% include lab_question.html question="What does Firefox say about the trust of this Root Certificate authority? Why does Firefox say this?" %}


## Perfect Forward Secrecy

1.  On any computer with Google Chrome installed (your Kali VM does not have Chrome), browse to [https://static-rsa.badssl.com](https://static-rsa.badssl.com)
2.  From the hamburger icon in the top right-hand corner, select "More Tools" > "Developer Tools."

    {% include lab-image.html image='pfs-badssl-rsa-keyexchange.png' %}

3.  Select the "Security" tab from the Developer Tools. This tab displays details about the connection. What does Chrome say about the connection settings for RSA key exchange, and why?

    To help you answer this question, look at one or more of the following resources:
    * [https://www.wired.com/2016/11/what-is-perfect-forward-secrecy/](https://www.wired.com/2016/11/what-is-perfect-forward-secrecy/)
    * [https://scotthelme.co.uk/perfect-forward-secrecy/](https://scotthelme.co.uk/perfect-forward-secrecy/)
    * [https://en.wikipedia.org/wiki/Forward_secrecy](https://en.wikipedia.org/wiki/Forward_secrecy)
    * [https://www.zdnet.com/article/google-moves-forward-towards-a-more-perfect-ssl/](https://www.zdnet.com/article/google-moves-forward-towards-a-more-perfect-ssl/)

    {% include lab_question.html question="What does Chrome say about the connection settings for RSA key exchange, and why?" %}




# Part 2: MITM with Burp Suite

In this section, you will use a tool called Burp Suite in your Kali VM,
and you will configure Kali's Firefox to route all traffic through Burp Suite.
You will feign a MITM attack and intercept a username\|password that you submit to bankofamerica.com. This lab uses the free Burp Suite Community Edition.

Burp Suite is a network traffic proxy application created by PortSwigger. The tool can be used by developers and researchers to inspect and manipulate any network traffic to which Burp Suite has access. It is commonly used in the cybersecurity community for inspection and
manipulation of web requests. See articles such as [this one](https://research.digitalinterruption.com/2020/09/10/giggle-laughable-security/)
which rely on Burp Suite for analysis of a smartphone
app's web requests. Alternatives to Burp include mitmproxy, Fiddler, ZAP, and Charles.

## Configure Burp Suite as a proxy

1.  Launch Burp Suite. Follow the steps displayed below to get through the launch process.

    * search for Burp Suite using the kali launcher, and click it.

      {% include lab-image.html image='burpsuite-launch-search.png' %}

    * ignore the warning about the jre version

      {% include lab-image.html image='burpsuite-launch-ignore-jre.png' %}

    * skip the Burp Suite update

      {% include lab-image.html image='burpsuite-launch-skip-update.png' %}

    * choose to launch a temporary project

      {% include lab-image.html image='burpsuite-launch-temporary-project.png' %}

    * launch with the default settings

      {% include lab-image.html image='burpsuite-launch-default-launch-burp.png' %}


    When Burp Suite is started, it by default "listens" for incoming traffic on `localhost:8080`, as shown below.

    {% include lab-image.html image='burpsuite-launch-default-listen.png' %}

    Turn **off** interception from the "Proxy" > "Intercept" tab. Interception is
    used when the goal is to modify requests
    before they are sent on their way. The goal of this section of the lab,
    however, is to show that https traffic can be readily decrypted if a MITM attack
    is successful.

    {% include lab-image.html image='burpsuite-turn-off-interception.png' %}

4.  Configure Firefox to route all internet traffic through Burp Suite.

    * Firefox >
      {% include lab-image.html image='firefox-launch.png' %}
    * "Hamburger" icon on upper-right > Preferences
      {% include lab-image.html image='firefox-open-hamburger-preferences.png' %}
    * (scroll to the bottom or search) Network Proxy - Settings >
      {% include lab-image.html image='firefox-search-network-settings.png' %}
    * Manual proxy configuration, HTTP Proxy `localhost` (or equivalently `127.0.0.1`), Port
      8080, check box for "use this proxy server for all protocols"
      {% include lab-image.html image='firefox-set-proxy-localhost-8080.png' %}

    Firefox is now proxying all web requests through Burp Suite.


    Note: the above instructions are also described when the following link is clicked:

    {% include lab-image.html image='burpsuite-open-proxy-documentation.png' %}

## Attempt to visit a secure website

6.  Now that Firefox is passing all traffic to Burp Suite, try to visit an https-site. The following will work against _any_ https site,
    but we will visit [https://bankofamerica.com](https://bankofamerica.com)

    You receive an SSL connection error!

    {% include lab-image.html image='burpsuite-boa-ssl-error.png' %}

    1.  Inspect the cert. You can do this by clicking the "View Certificate" button.

        {% include lab-image.html image='firefox-burpsuite-certificate.png' %}

    2.  Alternatively, you can copy the base64-encoded version and use a web cert decoder.
        To do this, on the SSL error page, click “Advanced”, then click the link to the error code. Copy the ---BEGIN CERTIFICATE-- block to your clipboard.

        {% include lab-image.html image='burpsuite-cert-details-base64.png' %}

        Search the internet for an "ssl cert decoder", such as [https://certlogik.com/decoder/](https://certlogik.com/decoder/) or [https://www.sslshopper.com/certificate-decoder.html](https://www.sslshopper.com/certificate-decoder.html),
        to decode the base64-encoded cert that you copied in the previous step.

8.  Configure Firefox to trust Burp Suite's self-signed certificate.

    Burp Suite generates a unique ssl keypair for each installation. We need to
    instruct Firefox to trust Burp Suite's public key for authenticating websites.
    As seen earlier in this lab, Firefox maintains its own certificate authority list.

    Follow the instructions on the following website to install Burp Suite's CA
    certificate in Firefox: [link](https://portswigger.net/burp/documentation/desktop/getting-started/proxy-setup/certificate/firefox)

     <div class='alert alert-info'><strong>Note:</strong> The linked-to instructions above show Burp Suite Professional, but the instructions also work for Burp Suite Community Edition. You don't need to install another version of Burp Suite than the one that is already installed on your Kali VM.</div>
    
    <div class='alert alert-info'><strong>Note:</strong> When the instructions say, "In the top-right corner of the page, click "CA Certificate" to download your unique Burp CA certificate. Take note of where you save this.", you should choose "Save File", and your file will be downloaded with filename "cacert.der".</div>

    {% include lab-image.html image='burpsuite-cacert-der.png' %}

9.  Use Firefox again. Close the Bank Of America error page, and use a new tab to attempt again to navigate to [https://bankofamerica.com](https://bankofamerica.com)

    It loads!

    Examine the HTTPS SSL connection:

    * In the Firefox address bar, click the lock next to url
    * click the `>` button on the resultant popup dialog
    * click `More Information`

    {% include lab-image.html image='burpsuite-secure-connection-boa.png' %}
    {% include lab-image.html image='burpsuite-secure-connection-boa-2.png' %}
    {% include lab-image.html image='burpsuite-secure-connection-boa-3.png' %}
    {% include lab-image.html image='burpsuite-secure-connection-boa-4.png' %}

## Capture Login

10. Pretend that you are logging in to Bankofamerica.com. <strong>Enter as your username
    your {% if site.instructorcollab_username == 'deargle' %}identikey{% endif %} {% if
    site.instructorcollab_username == 'aov' %}TUid{% endif %}</strong>. Choose any **fake
    password**. Submit your login request. It will fail.

11. Burp Suite should have logged the login attempt -- Let's find it. Go back to Burp Suite.

    1.  Within Burp Suite, navigate to the "Proxy" > "HTTP history" tab. Click the "Filter"
        bar to open the filter dialog, and change the settings as follows to make the
        visual search easier.

        * Login requests submit fields such as usernames and passwords using "parameters",  
          so select "Filter by request type" > "Show only parameterized results."
        * Login requests -- at least for this site -- use MIME type "html", so
          in "Filter by MIME type," uncheck all except for HTML.

        That should be sufficient to easily find the HTTP POST request which was
        the attempted login.

        <div class='alert alert-info'>A POST request allows parameters such as the username and password to be sent in the body of the
        web request.</div>

        {% include lab-image.html image='burpsuite-filter.png' %}

    3.  Look for and select (click) the entry with:
        * a POST method
        * a URL similar to `/login/sign-in/entry/`:

        Select it, and then in the populated view beneath the list entries, select
        "Request" tab and then "Params" tab. Scroll down until you can see the
        "passcode" and "onlineid" named entries. These should be the values you
        submitted on your login attempt.

        You should see your {% if site.instructorcollab_username == 'deargle' %}identikey{% endif %} {% if site.instructorcollab_username == 'aov' %}TUid{% endif %} and fake password.

        {% include lab_question.html question="Submit a screenshot showing your username and fake password within the Burp Suite window for the Bank of America login attempt. Show your entire Kali view in your screenshot. Example screenshot below." %}

        {% include lab-image.html image='burpsuite-show-login-entry.png' %}

12. But wait, this was an HTTPS connection, so the web transaction such as the submitted username\|password) should have been encrypted. How could Burp Suite have decrypted it?

    This is the essence of a man-in-the-middle attack -- a secure connection to an evil server which talks to your intended server on your behalf.

    {% include lab-image.html image='500px-Man_in_the_middle_attack.svg.png' %}

    In our pretend case, Burp Suite is the evil server, and Bank Of America's server
    is the intended server. All secure content is visible as plaintext to the attacker,
    because the attacker’s SSL cert was used to establish the secure HTTPS connection.

13. Finally, clean up by reconfiguring Firefox to no longer use a network proxy. To do this,
    revisit Firefox's "Network Settings" page under the Preferences view, and select
    "No Proxy".
    
{% if site.instructorcollab_username == 'deargle' %}

# Part 3. Appreciate secure messaging with the bygone PGP

For a long time, PGP was the best technology available for messaging (email) privacy.
To gain an appreciation of the pain involved in using PGP, watch the following
video tutorial created by Edward Snowden for how to use gpg,
the open source version of pgp: [https://vimeo.com/56881481](https://vimeo.com/56881481)

You do not need to follow along, but you may if you want to, for your health.
The above video tutorial is for Windows users. For Mac,
the [GPG Suite](https://gpgtools.org/) can be used.

<div class='alert alert-info'><strong>Extra challenge:</strong> Follow along
with the tutorial and send Dr. Eargle a signed, encrypted message, along with
your public key, using Dr. Eargle's public key available
<a class='alert-link' href='http://daveeargle.com/key.asc'>here</a>.</div>

# Part 4. Understand Secure Communication via Signal

The Signal app and Signal protocol intend to make pgp-like levels of message
confidentiality invisible to the end-user. This section intends to orient you
to the Signal app and protocol.

1.  Watch the following clips from an Al Jazeera Fault Lines documentary about the
crypto wars:
    * Interview with Moxie Marlinspike starting at 9:00, but start at [8:23](https://youtu.be/j7VA4H8m4uk?t=502) for context
    * Many attacks that do not depend on cracking E2E, Interviews with [Morgan Marquis-Boire at 16:18](https://youtu.be/j7VA4H8m4uk?t=978) and [Bill Marczak of The Citizen Lab at 18:37](https://youtu.be/j7VA4H8m4uk?t=1097)
1.	Watch this [video](https://video.vice.com/en_us/video/motherboard-hacking-week-how-to-use-signal-encryption/5a0f6547177dd45aee30e663) and read about the Signal app [here](https://signal.org/) and [here](https://theintercept.com/2017/05/01/cybersecurity-for-the-people-how-to-keep-your-chats-truly-private-with-signal/).
1.  Also read about the cryptographic primitives that the Signal protocol uses, [here](https://medium.com/@justinomora/demystifying-the-signal-protocol-for-end-to-end-encryption-e2ee-ad6a567e6cb4).

Use what you read and watched above to answer the following questions:

{% include lab_question.html question='What attacks does Signal protect you against? Which does it not protect you against?' %}

{% include lab_question.html question='On a high level, how does the Signal protocol work?' %}

{% endif %} {% if site.instructorcollab_username == 'aov' %}{% endif %}

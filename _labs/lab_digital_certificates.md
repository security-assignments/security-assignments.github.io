---
title: "Lab: Digital Certificates"
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

{% include lab_question.html question='What is the intermediary certificate authority?' %}

What are some of the other domains for which this certificate is valid?' In Firefox, these are listed under "Certificate Subject Alt Name."

{% include lab_question.html question='What are some of the other domains for which the ibm.com certificate is valid?' %}

For TLS X.509 certificates, the signature in the certificate is signed by the public key included in an intermediate or root certificate authority certificate (see figure below).
An intermediary certificate, if any, is signed by the public key included in a root certificate. The root certificate is signed using the public key in its own certificate (a self-signed certificate).
Linking certificates in this way forms a certificate chain.

{% include lab-image.html image='ssl-digicert-chain.png' %}

_Certificate chain image from [DigiCert](https://knowledge.digicert.com/solution/SO16297.html)_

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
3.  What does Firefox say about the trust of this Root Certificate authority? Why does Firefox say this?

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




# Part 2: MITM with Fiddler

In this section, you will download and run a network proxy called Fiddler to your Kali VM, and you will configure Kali's Firefox to route all traffic through Fiddler. You will intercept a username|password
submitted to bankofamerica.com.

1.  First, change your desktop background to a “light” theme -- the Fiddler application is hard to read if it is launched with Kali using a “Dark” theme.

    Upper-left Kali desktop “Applications” > “Settings” > “Appearance” > select something light, such as “Arc.”

    {% include lab-image.html image='kali-light-theme.png' %}

2.  Now, download and install `mono`, which can run `.net` applications from Linux. From a Terminal, run the following command:

        sudo apt install mono-complete

3.  Next, download and run Fiddler, which is a network traffic proxy application. The tool can be used by developers and researchers to inspect and manipulate any network traffic to which Fiddler has access.
    We will use it to pretend that we are executing a “Man in the middle” attack on ourselves. From a terminal:

    Use `wget` to download “Fiddler” from www.teletrik.com:

        wget -O fiddler-linux.zip http://www.telerik.com/docs/default-source/fiddler/fiddler-linux.zip?sfvrsn=2

    Unzip the download into a new directory called “fiddler-linux”, and change into that directory

        unzip fiddler-linux.zip -d fiddler-linux
        cd fiddler-linux

    Use `mono` to run Fiddler.exe

        mono Fiddler.exe

    When Fiddler is run, by default it is to “listens”, ready to accept connections, on localhost, port 8888

4.  Configure Firefox to route all internet traffic through Fiddler.

    * Firefox >
    * "Hamburger" icon on upper-right >
    * Preferences >
    * (scroll to the bottom) Network Proxy - Settings >
    * Manual proxy configuration, HTTP Proxy localhost Port 8888, check box for "use this proxy server for all protocols"

    Firefox is now proxying all web requests through Fiddler.

    {% include lab-image.html image='firefox-network-settings-1.png' %}
    {% include lab-image.html image='firefox-network-settings-2.png' %}


5.  Go back to Fiddler (Progress Telerik Fiddler in taskbar).

        Tools >
        Options >
        HTTPS >
        Check the box for "Decrypt HTTPS traffic".
        Click “OK” to close the dialog.

    {% include lab-image.html image='fiddler-decrypt-https-traffic.png' %}

6.  Now that Firefox is passing all traffic to Fiddler, and now that Fiddler is configured to attempt to decrypt all HTTPS traffic, Try to visit an https-site. The following will work against _any_ site,
    but we will visit [https://bankofamerica.com](https://bankofamerica.com)

    You receive an SSL connection error!

    {% include lab-image.html image='firefox-ssl-error.png' %}

7.  Inspect the cert. Normally, it is possible to inspect certificates from within Firefox, but for some reason, that is not working for this invalid SSL certificate.
    So use another tool to parse the certificate to examine it.

    1.  On the SSL error page, click “Advanced”, then click the link to the error code, "SEC_ERROR_UNKNOWN_ISSUER". Copy the ---BEGIN CERTIFICATE-- block to your clipboard.

        {% include lab-image.html image='firefox-ssl-error-2.png' %}
        {% include lab-image.html image='firefox-ssl-error-3-copy-cert.png' %}

    2.  Google-search for “ssl cert decoder” and use a site such as [https://certlogik.com/decoder/](https://certlogik.com/decoder/) or [https://www.sslshopper.com/certificate-decoder.html](https://www.sslshopper.com/certificate-decoder.html)
        to decode the base64-encoded cert that you copied in the previous step.

8.  Configure Firefox to trust Fiddler's self-signed certificate.

    1.  Go back to Fiddler (Progress Telerik Fiddler in taskbar).

            Tools > Options > HTTPS > Actions > Export Root Certificate to Desktop

        {% include lab-image.html image='fiddler-export-cert.PNG' %}

    2.  Import the cert into Firefox's cert store.

        * Firefox >
        * Preferences >
        * "Privacy & Security" >
        * Certificates >
        * "View Certificates" >
        * Click "Authorities" tab >
        * "Import..." >
        * desktop, select "FiddlerRoot.cer",
        * check "Trust this CA to identify websites."

        {% include lab-image.html image='firefox-view-certificates.png' %}
        {% include lab-image.html image='fiddler-firefox-import-certificate.png' %}
        {% include lab-image.html image='fiddler-firefox-trust-identify-websites.PNG' %}

9.  Use Firefox again. Close the Bank Of America error page, and use a new tab to attempt again to navigate to [https://bankofamerica.com](https://bankofamerica.com)

    It loads!

    Examine the HTTPS SSL connection:

    * Firefox >
    * click lock next to url in addressbar >
    * click `>` button >
    * click `More Information`

    {% include lab-image.html image='firefox-boa-secure-connection1.PNG' %}
    {% include lab-image.html image='firefox-boa-secure-connection-2.PNG' %}
    {% include lab-image.html image='firefox-boa-secure-connection-3-view-cert.PNG' %}
    {% include lab-image.html image='firefox-boa-secure-connection-4-view-cert-details.PNG' %}

10. Pretend that you are logging in to Bankofamerica.com. Enter as your username your {% if site.instructorcollab_username == 'deargle' %}identikey{% endif %} {% if site.instructorcollab_username == 'aov' %}TUid{% endif %}.

11. Now, go back to Fiddler. The sign-in attempt should have been intercepted -- let's find it.

    1.  Tell Fiddler to stop capturing traffic:      
            Fiddler > File > uncheck “Capture Traffic”.
    2.  On the “View” tab of Fiddler, uncheck “Autoscroll Sessions List.” This will keep the scroll list from jumping around.
    3.  Look for and select (click) the entry with:
        *   a green right-arrow in the first column -- this indicates a form submission (e.g., the username-password signin form)
        *   A HTTP result-code `302`. This indicates that bankofamerica.com redirected the web browser in response to the form submission
        *   Protocol `HTTPS`
        *   Host `secure.bankofam...`
        *   URL `/login/sign-in/signOnV...`


    4.  On the right side of the Fiddler window, the top half shows the details for browser’s web “request” for the select network transmission. The bottom half shows the web server’s “response.”

        In the Request area, select “WebForms.” This will show a user-friendly view of the data that was submitted in the form. Scroll in this form until you find the “onlineId” and “passcode” fields. You should see your {% if site.instructorcollab_username == 'deargle' %}identikey{% endif %} {% if site.instructorcollab_username == 'aov' %}TUid{% endif %} and fake password.

        {% include lab_question.html question="Submit a screenshot showing your username and fake password within the Fiddler window for the Bank of America login attempt. Show your entire Kali view in your screenshot. Example screenshot below." %}

        {% include lab-image.html image='Fiddler-bankofamerica-post-username-password.PNG' %}

12. But wait, this was an HTTPS connection, so the web transaction such as the submitted username\|password) should have been encrypted. How could Fiddler have decrypted it?

    This is the essence of a man-in-the-middle attack -- a secure connection to an evil server which talks to your intended server on your behalf.

    {% include lab-image.html image='500px-Man_in_the_middle_attack.svg.png' %}

    In our pretend case, Fiddler is the evil server, and Bankofamerica is the intended server. All secure content is visible as plaintext to the attacker,
    because the attacker’s SSL cert was used to establish the secure HTTPS connection.

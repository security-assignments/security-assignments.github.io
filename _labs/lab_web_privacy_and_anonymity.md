---
title: "Lab: Web Privacy and Anonymity"
number: 13
description: Overview of trackers, third party cookies, and Tor
published: true
---

This lab will help you learn more about how to protect your privacy on the Web.
Perform the steps below on your personal computer, not your Kali VM on Google
Cloud.

# Part 1: Check Out Your Data

Several major companies allow you to check out and examine the data they have on
file for you. This can be very revealing.

[Use this link](https://www.makeuseof.com/tag/make-backups-online-social-media-accounts-windows/) to learn how to download your data from one or more of the following services:

* Facebook (highly recommended)
* Instagram
* Google (If you use Gmail or Google Drive, note that downloads can be large)
* Instagram
* LinkedIn
* Pinterest
* Twitter

Alternatively, see the links below to download your data from these companies:

* [Amazon](https://www.usatoday.com/story/tech/columnist/saltzman/2018/04/04/amazon-and-alexa-know-whole-lot-you-heres-how-download-and-delete-info/482286002/)
* [Apple](https://support.apple.com/en-us/HT208502)
* [Snapchat](https://support.snapchat.com/en-US/a/download-my-data)

If you aren’t a customer for any of the above companies, try to check out your data for another company you use.


{% include lab_question.html question='What types of information had this online service collected about you?' %}
{% include lab_question.html question='Did anything you found in the data about yourself surprise you?' %}

{% include lab_question.html question='Submit to Canvas as screenshot of the files you obtained from the online service. Don\'t submit a screenshot of the contents of these files.' %}



# Part 2: Blocking Web Trackers

Although ad trackers are seemingly everywhere on the Web, the good news is that
the newest versions of several major web browsers--such as
[Firefox](https://www.mozilla.org/en-US/firefox/new/),
[Brave](https://brave.com), and [Safari](https://www.apple.com/safari/) for
Apple devices--have built-in privacy protections.

## Setup Firefox

For this section of the lab, you'll configure Firefox on your laptop to block
and examine web trackers of various kinds.

1.  Watch this [one-minute video](https://www.youtube.com/watch?v=dKmoubR-nVg)
    about the new privacy protections in Firefox 70.
2.  Make sure you have at least Firefox 70
    *   If you don't already have Firefox, download the [latest version of
        Firefox](https://www.mozilla.org/en-US/firefox/new/).
    *   If you already have Firefox installed on your laptop, check to see that
        you have Firefox 70 or later installed.

        To do this, visit the "About" page. Visiting this page downloads any available
        updates.
        *   On a Mac, go to the Firefox menu and select "About Firefox."
        *   On Windows, go to the "Help" menu and select "About Firefox."

        If an update was downloaded, after it finishes, click the "Restart to
        update Firefox" button.
3.  Turn on fingerprint blocking.
    *   Open Firefox preferences by clicking the icon with three horizontal
        lines (the so-called "hamburger" icon) in the top-right-hand corner of
        Firefox.
    *   Select "Privacy & Security"
    *   Under "Enhanced Tracking Protection," select "Custom," and make sure
        that all four boxes are checked ("cookies," "Tracking content,"
        "Cryptominers," and "Fingerprinters".

## Use Ghostery to Learn about Web Trackers

Firefox now blocks third-party cookies and fingerprinting techniques. However, to get more information about web trackers, you'll next install Ghostery, a browser extension that blocks ads and trackers.

1.  Visit
    [https://www.ghostery.com/products/](https://www.ghostery.com/products/) and
    install the Ghostery extension in Firefox.
2.  Choose the free basic plan.
3.  In "Customize Setup," select "Block Everything" and click the "Next" button.
    Uncheck the box for sending anonymous analytics to Ghostery.
4.  Browse to your favorite sites and click the Ghostery icon after each page
    load. Which of your favorite sites uses the most web trackers?
5.  Click on the Ghostery icon and select the "Detailed View" tab. Click on the
    struck-through name of an add tracker and click the “Continue to full
    tracker profile” to learn more about the ad tracker (see figure below).

    {% include lab-image.html image='lab_13_1.png' width="70%" %}
5.	While viewing one of the "full tracker profiles", click on the down arrow
    next to “Privacy Information” to learn about the tracker’s privacy policy.

    {% include lab_question.html question='What is the name of the third-party tracker you read about, and what kinds of information is its company collecting about you?' %}


# Part 3: Browser Fingerprinting

1.	Visit [https://panopticlick.eff.org](https://panopticlick.eff.org) and test your browser.

    {% include lab_question.html question='Is your browser blocking tracking ads?' %}
    {% include lab_question.html question='Is your browser blocking invisible trackers?' %}
    {% include lab_question.html question='Does your browser unblock 3rd parties that promise to honor Do Not Track?' %}
    {% include lab_question.html question='Does your browser protect against fingerprinting?' %}


2.	Click on the link, “Show full results for fingerprinting.” Look over the
    browser characteristics and how many bits of identifying information each
    one provides.

    Note: The bits of identifying information means that your browser can be
    uniquely identified out of a set of 2^bits of identifying information. A
    lower score is better, because it means that you can be less precisely
    identified. For example:

    > “We observe that the distribution of our finger- print contains at least
    18.1 bits of entropy, meaning that if we pick a browser at random, at best
    we expect that only one in 286,777 other browsers will share its
    fingerprint. Among browsers that support Flash or Java, the situation is
    worse, with the average browser carrying at least 18.8 bits of identifying
    information. 94.2% of browsers with Flash or Java were unique in our
    sample.”

    [https://panopticlick.eff.org/static/browser-uniqueness.pdf](https://panopticlick.eff.org/static/browser-uniqueness.pdf)

    {% include lab_question.html question='How many bits of information does Panopticlick report for your browser?' %}



# Part 4: Anonymous Web Browsing

<div class='alert alert-danger'><strong>Heads up!</strong> This lab does <em>not</em> condone any illegal activity.</div>

There are occasionally times when _anonymnity_ on the internet is desirable.
This is different from _confidentiality_ on the internet. With confidentiality,
it is not possible for eavesdroppers to read the web traffic. With anonymnity,
web traffic cannot be linked back to its origin.

HTTPS provides web traffic _confidentiality_ -- but only of the request
_content_. Web traffic elements such as the source and destination IP, and DNS
requests, are public.  This means that if a political activist uses a computer
with IP address `192.0.2.1` and logs in to
`https://securedrop-for-journalists.example.com/submit/something/condemning` and
submits leaked documents, the following information should be encrypted
(confidential):
* the login information
* the submitted documents
* that the requested path was `/submit/something/condemning`

However, https _cannot_ protect the following information:
* the source ip address of `192.0.2.1`
* the request to `securedrop-for-journalists.example.com`

The latter is considered "metadata," and it must be readable for the internet to
work. However, it alone may be enough to identify and implicate the activist. Internet
service provider records can associate an IP address with a specific street
address, which can be used to point to a human.

But if the source IP address could be obfuscated, then while an eavesdropper
would still see a connection to `securedrop-for-journalist.example.com`, the
activist would remain anonymous.

Some might use VPNs to try to anonymize their IP addresses. While this hides web
requests from immediate surveillance at the request origin network level
(e.g., hides the traffic from an ISP), it is still possible to get the true source IP via VPN server
logs. One might attempt to mitigate this attack by using *several* VPN servers
in a chain, but the attack still exists.

## Testing whether private browsing anonymizes source IPs

1.	Go to <http://whatismyip.com/> and note your IP address.
2.	Turn on your browser’s privacy mode (e.g., “Incognito Mode” in Chrome,
    “Private Browsing” in Firefox and Safari).
3.	Go to <http://whatismyip.com/> again and note your IP address.

Note that your IP address didn’t change. Why not?

{% include lab_question.html question="If your true IP address can still be seen by web servers, what does your browser's privacy mode do? (Ask the internet if you're not sure.)" %}

## What is Tor?

One of the main goals of Tor is to anonymize source IP addresses.

The Tor browser uses encryption techniques to tunnel your traffic through
several Tor "nodes" (usually 3). Each node only knows the one that comes before
it and after it in the chain. Traffic originating from a Tor client connecting
to `securedrop-for-journalist.example.com` would do something like the
following:

1.  The client chooses its Tor node chain.
1.  The client wraps its web request, including the chain information, in a
    series of "onion" layers of encryption.
1.  The client passes its request to the first node in the chain, termed the
    _entry_ node. The entry node removes the first layer of encryption, and
    passes the encrypted traffic on to the next Tor node.
1.  The nodes repeats the steps of removing an encryption layer and pass-along,
    until ultimately the traffic leaves the Tor network via the last node in the
    chain, termed the _exit_ node.
1.  The exit node makes the direct web request to the
    `securedrop-for-journalist.example.com` server, on behalf of the originating
    Tor client. Any response from `securedrop-for-journalist.example.com` would
    pass in reverse through the Tor network, back to the Tor client via the
    entry node.

Optionally, if the request is to a special `.onion` domain, the traffic is
actually intended for a server _within the Tor network_, which is _only
accessible via the Tor network_. In this case, the traffic never exits, and
therefore never travels over public internet protected potentially only by HTTPS
encryption. When the traffic stays in the Tor network, the final step is still
wrapped in an "onion" layer of encryption.


## Testing whether Tor anonymizes the source IPs

In this section, you will use the **Tor Browser**.

The **Tor Browser** can be used from your own computer, or it can be used from
the Kali-on-GCP instance.

1.  Install Tor if necessary: available for Linux, Mac, and Windows [here](https://www.torproject.org/download/download-easy.html).

    <div class='alert alert-info'><strong>Note:</strong> You might not be able
    to download or use Tor Browser on your university's campus network unless
    you use a VPN service. If this is your case, then you can use the Tor
    browser from an off-campus network.  </div>

    <div class='alert alert-info'>
    <strong>Note:</strong> If you’re using a Mac and MacOS refuses to open the Tor Browser app because it is from an unknown developer, hold the control key and right-click the Tor Browser app and then select “open.” This will create an exception for the Tor Browser app and open it.
    </div>

4.	Run the **Tor Browser**.
5.	Visit <http://whatismyip.com/> inside of the Tor Browser and verify that
    your IP address has changed.
6.	Determine your IP address using three different websites (e.g.,
    <https://www.whatismyip.com/>, <http://www.whatsmyip.org>, and
    <https://whatismyipaddress.com/>). Note what IP addresses each site reports
    for your browser.
7.	Look up the location of each IP address you noted in step 6 using a service
    like <https://www.wolframalpha.com/>.

    {% include lab_question.html question='To which parts of the world do the IPs you noted in step 6 belong?' %}

Read the about how to use Tor effectively: <https://www.torproject.org/download/download-easy.html#warning>

## Visit an `.onion` server

As noted earlier, Tor also provides the ability to access servers that are only
accessible via the Tor network. This is what is known colloquially as “the dark
web.” While it’s true that there are many sites providing illegal services on
the dark web, there are also legitimate uses for the dark web as well.

Read this short article about the dark web: <https://www.wired.com/2014/11/hacker-lexicon-whats-dark-web/>


## Access legitimate Tor services

Access some legitimate Tor services using the Tor browser:

### **SecureDrop**

Many news organizations use [SecureDrop](https://securedrop.org/) to
"securely accept documents from anonymous sources," such as from whistleblowers.

Visit the [SecureDrop FAQ](https://securedrop.org/faq)
to read about how SecureDrop works.

Then, use the [SecureDrop directory](https://securedrop.org/directory) to find and
visit the drop sites for each of the following news organizations:

* The New York Times
* The Washington Post
* ProPublica


### **Facebook**

If you have a Facebook account, you can access Facebook using their TOR service.
[Facebook says](https://m.facebook.com/nt/screen/?params=%7B%22note_id%22%3A2655797467977351%7D&path=%2Fnotes%2Fnote%2F&refsrc=deprecated) the following about why it provides an onion address:

> Consider Tor: Tor challenges some assumptions of Facebook's security mechanisms - for example its design means that from the perspective of our systems a person who appears to be connecting from Australia at one moment may the next appear to be in Sweden or Canada. In other contexts such behaviour might suggest that a hacked account is being accessed through a “botnet”, but for Tor this is normal.




Note: Facebook says that as of April 2016, [more than 1 million people access Facebook via Tor](https://www.facebook.com/notes/facebook-over-tor/1-million-people-use-facebook-over-tor/865624066877648/)

**Exercise:** Search the internet to find the new Facebook onion address (note: as of May 2021, https://facebookcorewwwi.onion no longer works).

## `.onion` without a Tor client

Try to load a `.onion` URL in a browser other than the Tor Browser.

{% include lab_question.html question='What error message do you receive?' %}

## Overall

{% include lab_question.html question='What do you think about the experience of accessing TOR services?' %}

<div class='alert alert-danger'><strong>Take heed!</strong> There are a number of ways to defeat Tor anonymnity. For instance, see <a href='https://www.theguardian.com/world/interactive/2013/oct/04/tor-stinks-nsa-presentation-document'>This Top-Secret presentation from the Snowden leaks about attacking Tor</a>, which says the following:

<blockquote>We will never be able to de-anonymize all Tor users all the time... [but] with manual analysis we can de-anonymize a <em>very small fraction</em> of Tor users, however, [never in response to a post-hoc request].</blockquote></div>

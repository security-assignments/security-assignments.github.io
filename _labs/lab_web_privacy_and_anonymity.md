---

title: "Lab: Web Privacy and Anonymity"
number: 13
description: Overview of trackers, third party cookies, and Tor
published: true
---

This lab will help you learn more about how to protect your privacy on the Web. Perform the steps below on your personal computer, not your Kali VM on Google Cloud.

# Part 1: Check Out Your Data

Several major companies allow you to check out and examine the data they have on file for you. This can be very revealing.

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

Although ad trackers are seemingly everywhere on the Web, the good news is that the newest versions of several major web browsers--such as [Firefox](https://www.mozilla.org/en-US/firefox/new/), [Brave](https://brave.com), and [Safari](https://www.apple.com/safari/) for Apple devices--have built-in privacy protections.

## Setup Firefox

For this section of the lab, you'll configure Firefox on your laptop to block and examine web trackers of various kinds.

1. Watch this [one-minute video](https://www.youtube.com/watch?v=dKmoubR-nVg) about the new privacy protections in Firefox 70.
2. Download the [latest version of Firefox](https://www.mozilla.org/en-US/firefox/new/). If you already have Firefox installed on your laptop, check to see that you have Firefox 70 or later installed.
* On a Mac, go to the Firefox menu and select "About Firefox."
* On Windows, go to the "Help" menu and select "About Firefox."

    After the update downloads, click the "Restart to update Firefox" button.

3. Turn on fingerprint blocking.
* Open Firefox preferences by clicking the icon with three horizontal lines (the so-called "hamburger" icon) in the top-right-hand corner of Firefox.
* Select "Privacy & Security"
* Under "Enhanced Tracking Protection," select "Custom," and make sure that all four boxes are checked ("cookies," "Tracking content," "Cryptominers," and "Fingerprinters".

## Use Ghostery to Learn about Web Trackers

Firefox now blocks third-party cookies and fingerprinting techniques. However, to get more information about web trackers, you'll next install Ghostery, a browser extension that blocks ads and trackers.

1. Visit [https://www.ghostery.com/products/](https://www.ghostery.com/products/) and install the Ghostery extension in Firefox.
2. Choose the free basic plan.
3. In "Customize Setup," select "Block Everything" and click the "Next" button. Uncheck the box for sending anonymous analytics to Ghostery.
4.	Browse to your favorite sites and click the Ghostery icon after each page load. Which of your favorite sites uses the most web trackers?
5. Click on the Ghostery icon and select the "Detailed View" tab. Click on the struck-through name of an add tracker and click the “Continue to full tracker profile” to learn more about the ad tracker (see figure below).

    {% include lab-image.html image='lab_13_1.png' width="70%" %}

5.	While viewing one of the "full tracker profiles", click on the down arrow next to “Privacy Information” to learn about the tracker’s privacy policy.

    {% include lab_question.html question='What is the name of the third-party tracker you read about, and what kinds of information is its company collecting about you?' %}


# Part 3: Browser Fingerprinting

1.	Visit [https://panopticlick.eff.org](https://panopticlick.eff.org) and test your browser.

    {% include lab_question.html question='Is your browser blocking tracking ads?' %}
    {% include lab_question.html question='Is your browser blocking invisible trackers?' %}
    {% include lab_question.html question='Does your browser unblock 3rd parties that promise to honor Do Not Track?' %}
    {% include lab_question.html question='Does your browser protect against fingerprinting?' %}


2.	Click on the link, “Show full results for fingerprinting.” Look over the browser characteristics and how many bits of identifying information each one provides.

    Note: The bits of identifying information means that your browser can be uniquely identified out of a set of 2^bits of identifying information. A lower score is better, because it means that you can be less precisely identified. For example:

    “We observe that the distribution of our finger- print contains at least 18.1 bits of entropy, meaning that if we pick a browser at random, at best we expect that only one in 286,777 other browsers will share its fingerprint. Among browsers that support Flash or Java, the situation is worse, with the average browser carrying at least 18.8 bits of identifying information. 94.2% of browsers with Flash or Java were unique in our sample.”

    [https://panopticlick.eff.org/static/browser-uniqueness.pdf](https://panopticlick.eff.org/static/browser-uniqueness.pdf)

    {% include lab_question.html question='How many bits of information does Panopticlick report for your browser?' %}



# Part 4: Anonymous Web Browsing

1.	Go to [http://whatismyip.com/](http://whatismyip.com/) and note your IP address.
2.	Turn on your browser’s privacy mode (e.g., “Incognito Mode” in Chrome, “Private Browsing” in Firefox and Safari).
3.	Go to [http://whatismyip.com/](http://whatismyip.com/) again and note your IP address.

    Note that your IP address didn’t change. Why not?

    {% include lab_question.html question='If your true IP address can still be seen by web servers, what does your browser\’s privacy mode do? (Ask the internet if you\'re not sure.)' %}

4.	Run the **Tor Browser** (install if necessary) available for Linux, Mac, and Windows [here](https://www.torproject.org/download/download-easy.html).


        Note: You might not be able to download or use Tor Browser on your university's
        campus network unless you use a VPN service. If this is your case, then you can
        use the Tor browser from an off-campus network.


    Note: If you’re using a Mac and MacOS refuses to open the Tor Browser app because it is from an unknown developer, hold the control key and right-click the Tor Browser app and then select “open.” This will create an exception for the Tor Browser app and open it.

5.	Reload [http://whatismyip.com/](http://whatismyip.com/) inside of the Tor Browser and verify that your IP address has changed.

6.	Determine your IP address using three different websites (e.g., [https://www.whatismyip.com/](https://www.whatismyip.com/), [http://www.whatsmyip.org](http://www.whatsmyip.org), and [https://whatismyipaddress.com/](https://whatismyipaddress.com/)). Note what IP addresses each site reports for your browser.

7.	Look up the location of each IP address you noted in step 6 using a service like [https://www.wolframalpha.com/](https://www.wolframalpha.com/).

    {% include lab_question.html question='To which parts of the world do the IPs you noted in step 6 belong?' %}

8.	Read the about how to use Tor effectively: [https://www.torproject.org/download/download-easy.html#warning](https://www.torproject.org/download/download-easy.html#warning)

9.	Tor also provides the functionality of a server only being accessible via the Tor network. This is what is known colloquially as “the dark web.” While it’s true that there are many sites providing illegal services on the dark web, there are also legitimate uses for the dark web as well.

10.	Read this short article about the dark web:

    [https://www.wired.com/2014/11/hacker-lexicon-whats-dark-web/](https://www.wired.com/2014/11/hacker-lexicon-whats-dark-web/)

11.	Access the legitimate TOR services using the Tor browser:

    The New York Times:
    : [https://www.nytimes3xbfgragh.onion](https://www.nytimes3xbfgragh.onion/)

    ProPublica (non-profit news site):
    : [https://www.propub3r6espa33w.onion](https://www.propub3r6espa33w.onion)

    The Federalist Papers (originally published pseudonymously in 1787–1788):
    : [http://duskgytldkxiuqc6.onion/fedpapers/federa00.htm](http://duskgytldkxiuqc6.onion/fedpapers/federa00.htm)

    The Washington Post's SecureDrop site for whistleblowers:
    : [https://jcw5q6uyjioupxcc.onion](https://jcw5q6uyjioupxcc.onion)

    SecureDrop uses the Tor network to allow whistleblowers to securely share information with the news media:

    {% include lab-image.html image='lab_13_2.png' width="60%" %}

    **Note:** If you’re interested in how SecureDrop works, see here: [https://securedrop.org/faq](https://securedrop.org/faq)

    Visit the Duck Duck Go TOR service search engine, and search for something:
    : [http://3g2upl4pq6kufc4m.onion](http://3g2upl4pq6kufc4m.onion)

    If you have a Facebook account, access Facebook using their TOR service:
    : [https://facebookcorewwwi.onion](https://facebookcorewwwi.onion)

    Note: Facebook says that as of April 2016, [more than 1 million people access Facebook via Tor](https://www.facebook.com/notes/facebook-over-tor/1-million-people-use-facebook-over-tor/865624066877648/)

12.	Try to load the same URL in a browser other than the Tor Browser.

    {% include lab_question.html question='What error message do you receive?' %}

{% include lab_question.html question='What do you think about the experience of accessing TOR services?' %}

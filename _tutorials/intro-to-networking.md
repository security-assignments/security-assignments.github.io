---
layout: assignment
title: Introduction to Networking
number: 4
published: true
---

**Attribution:** This page is based on an activity developed by Jennifer Urban and Chris Hoofnagle at UC Berkley.

Do the following activities to help you learn about networking.

# Traceroute

The [Traceroute](https://en.wikipedia.org/wiki/Traceroute) command shows the network route or path between your computer and another device on the internet or network.

1. From your computer or Kali Linux VM, open a terminal.

On a Mac, you can do this by clicking command & the space bar and typing `terminal`. In Linux and Mac, the command is `traceroute`.

On Windows, search for `cmd` and press enter. A terminal window should open. On Windows, the command is `tracert`.

1. Type: 

    `traceroute yahoo.com`
    
    Look at all the "hops" of your request to "trace the route," or in other words, follow the path of your request between your computer and one of Yahoo's servers.

    ![img]( {{ "/assets/images/traceroute.png" | relative_url }}){: width="550px" }

    **Questions:** 
    
    What does all this hopping mean for cybersecurity?
        
    What does it mean that Yahoo has "multiple addresses?"
       
    Can you ascertain anything about the location of each of the "hops" mapped on your traceroute? Look, for example, for airport codes or other geographic identifiers (e.g., "oak" in the above example, or "lhr" for London Heathrow, "jfk" for John F. Kennedy airport in New York, "iad" for Dulles airport in DC, etc).
        
    You can also use tools to help decipher this. The website [traceroute-online.com](https://traceroute-online.com/) has visual trace route tools that links location to each of those IP addresses. Try a few traces using websites you routinely visit. Do the hops on the route ever leave the United States?
    
# Email Headers

Another way of illustrating the "hops" that data make online is to look at email headers. You can do this in TUmail or Gmail by clicking on the little menu in a message and selecting `Show Original`.

![img]( {{ "/assets/images/email-show-original.png" | relative_url }}){: width="200px" }

Focus on the "Received: from" lines. Your email makes hops on the internet, probably in plain text format.

![img]( {{ "/assets/images/received-by.png" | relative_url }}){: width="500px" }

Compare several different messages. Are there more or less "Received" lines on your email sent by other people who use Gmail than competing services? What does it mean for cybersecurity that most email now goes from one Google user to another Google user?

As a comparison, here are two old email headers. Notice how more servers are listed in the "Received from" lines? This means that more parties unrelated to the communication had the opportunity to "read" or otherwise infer knowledge from the email.

![img]( {{ "/assets/images/oldmail.png" | relative_url }}){: width="400px" }

![img]( {{ "/assets/images/oldmail2.png" | relative_url }}){: width="500px" }

# Physical location on the internet

Try this exercise at school and at home. Visit [https://www.yougetsignal.com/tools/network-location/](https://www.yougetsignal.com/tools/network-location/). The "Remote Address" field is your public, the IP address that servers on the internet can see. Click the `Locate` button.

![img]( {{ "/assets/images/yougetsignal.png" | relative_url }}){: width="600px" }

And if one uses a [Virtual Private Network (VPN)](https://en.wikipedia.org/wiki/Virtual_private_network), one can encrypt their internet traffic and cause it to "tunnel" to another place in the world. Application-layer services then interpret this traffic to come from another country entirely.

![img]( {{ "/assets/images/Denmark.png" | relative_url }}){: width="600px" }

Now, consider what it means that one could use multiple VPNs, or a browsing system that automatically routes service traffic in circuitous ways, such as [Tor](https://www.torproject.org/) (this site is not accessible on Temple's network).

# Shodan

As we connect more and more devices to the Internet, we create an "Internet of Things" (IoT). These things include webcams, doorbells, thermostats, and anything else that can connect over IP.

The economics of IoT run against secure practices. Security adds cost, slows development, and degrades critical functions such as energy preservation. Thus, many IoT devices are woefully insecure and remotely exploitable.

To get an idea of the scope of the problem, we have a simple exercise for you—explore the website [Shodan](https://www.shodan.io/explore).

Shodan is a service that scans the open Web, looking for services. It provides a search engine for finding services, including insecure ones. For instance, this search reveals all IP-connected devices/services that signal the presence of a [default password](https://www.shodan.io/search?query=default+password).

From an attacker's perspective, one could use Shodan to locate vulnerable devices and exploit them. For instance, one could search for common vulnerabilities, on sites such as [MITRE's](https://www.cvedetails.com/), and then look for susceptible devices on Shodan.

You can also do a simple check of your home's internet security. Start by determing your IP address. You can do this now with a simple Google search: [What is my IP address?](https://www.google.com/search?q=what's+my+ip+address) (it should be something like 68.86.10.67--if it looks very different, such as "2600:1600:be50:a530:11ab:5224:c0ff:e33c", you have an IPv6 address). You can also find your IPv4 address at services such as [https://whatismyipaddress.com/](https://whatismyipaddress.com/).

Paste your IPv4 address into Shodan. Are any services showing up as available?



---
title: "Case—Twitter 2020 Incident"
description:
include_toc: true
---

# Instructions

1.	Take 5-minutes or so read the case highlights below. You don’t need to read the associated reference links.
2.	Discuss with your group the following questions:
    1.	How did the Twitter breach actually occur?
    1.	Which social engineering techniques were used?
    1.	How can Twitter avoid such attacks in the future?
3.	If you have more time, look at the links below for more detail about the case.

# Case

## Basic facts

*	On July 15, 2020, hackers took control of 130 Twitter accounts and sent tweets from 45
  accounts belonging to politicians, celebrities, and major corporations and used them to send a bitcoin scam. Compromised accounts included: Joe Biden, Barack Obama, former New York Mayor Michael Bloomberg, Amazon CEO Jeff Bezos, Bill Gates, Tesla CEO Elon Musk, investment mogul Warren Buffett, Apple, Uber, Wendy’s, and many others.
*	The scan promised to return double the amount of bitcoin sent to various bitcoin
  addresses:
  ![case-twitter.jpg]({{ '/assets/images/case-twitter.jpg' | relative_url }})
*	In three hours, the hackers received more than $118,000 in bitcoin.
*	It look Twitter several hours to stop the scams and they eventually resorted to
  locking out all users with verified (“blue checkmark”) accounts until the method of attack was identified.

## How this happened

> “On July 15, 2020, a 17-year old hacker and his accomplices breached Twitter’s network and seized control of dozens of Twitter accounts assigned to high-profile users. For several hours, the world watched while the Hackers carried out a public cyberattack, by seizing one high-profile account after another and tweeting out a “double your bitcoin” scam. The Hackers took over the Twitter accounts of politicians, celebrities, and entrepreneurs, including Barack Obama, Kim Kardashian West, Jeff Bezos, and Elon Musk, as well as Twitter accounts of several cryptocurrency companies regulated by the New York State Department of Financial Services. And for several hours Twitter seemed unable to stop the hack.
>
> In monetary value, the Hackers stole over $118,000 worth of bitcoin. But more significantly, this incident exposed the vulnerability of a global social media platform with over 330 million total monthly active users and over 186 million daily active users, including over 36 million (20%) in the United States. In short, Twitter plays a central role in how we communicate and how news is spread. More than half of U.S. adults get their news from social media “often” or “sometimes.”
[<sup>1</sup>][1]

## Social engineering attack

> “Allison Nixon, chief research officer at security firm Unit 221B, said evidence collected to date shows that Clark and hackers he worked with started by scraping LinkedIn in search of Twitter employees who were likely to have access to the account tools. Using features that LinkedIn makes available to job recruiters, the attackers then obtained those employees' cell phone numbers and other private contact information.
>
>The attackers then called the employees and used the information obtained from LinkedIn and other public sources to convince them they were authorized Twitter personnel. Work-at-home arrangements caused by the COVID-19 pandemic also prevented the employees from using normal procedures such as face-to-face contact to verify the identities of the callers.”
[<sup>2</sup>][2]

>“The Twitter Hack started on the afternoon of July 14, 2020, when one or more Hackers called several Twitter employees and claimed to be calling from the Help Desk in Twitter’s IT department. The Hackers claimed they were responding to a reported problem the employee was having with Twitter’s Virtual Private Network (“VPN”). Since switching to remote working, VPN problems were common at Twitter. The Hackers then tried to direct the employee to a phishing website that looked identical to the legitimate Twitter VPN website and was hosted by a similarly named domain. As the employee entered their credentials into the phishing website, the Hackers would simultaneously enter the information into the real Twitter website. This false log-in generated an MFA [multi-factor authentication] notification requesting that the employees authenticate themselves, which some of the employees did.
>
>The [New York Department of Financial Services] found no evidence the Twitter employees knowingly aided the Hackers. Rather, the Hackers used personal information about the employees to convince them that the Hackers were legitimate and could, therefore, be trusted. While some employees reported the calls to Twitter’s internal fraud monitoring team, at least one employee believed the Hackers’ lies.”
[<sup>1</sup>][1]

>“The Hackers also relied on basic information about Twitter and its employees to make their deception more credible. The Hackers appear to have conducted research to identify basic functions and titles of Twitter employees, so that they could better impersonate Twitter’s IT department. And conversations during the vishing calls themselves could have provided more information about Twitter’s internal operations. Armed with these personal details, the Hackers successfully convinced several Twitter employees that they were from Twitter’s IT department and stole their credentials.”
[<sup>1</sup>][1]

>“The first Twitter employee whose account the Hackers compromised did not have access to the internal tools that would allow them to takeover Twitter user accounts. Instead, the Hackers used this initial compromise to navigate Twitter’s internal websites and learn more about Twitter’s information systems. The Hackers reviewed Twitter’s intranet websites containing information about how to access other internal applications.
>
>On July 15, the Hackers targeted Twitter employees who had access to the internal tools. Some of them were part of the department responsible, in part, for responding to sensitive global legal requests, such as court orders or content removal requests, as well as for developing and enforcing policies to prohibit abusive online behavior.”
[<sup>1</sup>][1]

## Other possible contributing factors

>The problems started at the top: Twitter had not had a chief information security officer (“CISO”) since December 2019, seven months before the Twitter Hack. A lack of strong leadership and senior-level engagement is a common source of cybersecurity weaknesses. Strong leadership is especially needed in 2020, when the COVID-19 pandemic has created a host of new challenges for IT and cybersecurity. Like many organizations, in March Twitter transitioned to remote working due to the pandemic. This transition made Twitter more vulnerable to a cyberattack and compounded existing weaknesses.
[<sup>1</sup>][1]

## Steps Twitter is taking to prevent similar attacks in the future[<sup>3</sup>][3]

*	Hardware keys: “Internally, we’re rolling out phishing-resistant security keys and requiring our team to use them when authenticating to systems around the world. This is work we had already begun but have accelerated in recent weeks. This will help reduce the risk of an unauthorized third-party gaining access to our internal systems using compromised employee credentials.”
*	Lock-down admin tools: “To further secure our internal tools from potential misuse, we have been strengthening the rigorous checks that team members with access must undergo. This also helps reduce the potential for an unauthorized person to get access to our systems. We have strict principles around who is allowed access to which tools and at what time, and require specific justifications for customer data to be accessed.”
*	Training of employees: “In addition to requiring Security and Privacy & Data Protection training for all newly hired Twitter employees, we introduced new courses and increased the frequency and availability of existing courses for all employees. For example, we introduced two new mandatory training sessions for people who have access to non-public information. These trainings make clear the dos and don'ts when accessing this information and ensure employees understand how to protect
  themselves when they are online so they can better avoid becoming phishing targets for attackers.”
*	Penetration tests: “Our teams have also been investing in additional penetration testing and scenario planning to help secure Twitter from a range of possible threats”

## Epilogue

* On March 16, 2021, one of the hackers, then 17-year-old teenager Graham Ivan Clark, was [sentenced to three years in prison and three years parole](https://www.tampabay.com/news/crime/2021/03/16/tampa-twitter-hacker-agrees-to-three-years-in-prison-in-plea-deal/), lower sentencing limits for a “youthful defender”.
* On July 21, 2021, 22-year-old Joseph O’Connor (aka PlugWalkJoe) [was arrested in Spain in connection with the attack](https://www.nytimes.com/2021/07/21/technology/twitter-tiktok-snapchat-hacks.html).
* [Two other individuals were charged on July 31, 2020](https://www.wired.com/story/how-alleged-twitter-hackers-got-caught-bitcoin/): Mason Sheppard (aka “Chaewon”, age 19), of Bognor Regis, United Kingdom; and Nima Fazeli (aka “Rolex”, age 22), of Orlando, Florida.
* A fifth suspect, a Massachusetts 16-year-old “appears to have played an equal, if not more significant, role” in the attack: <https://www.nytimes.com/2020/09/01/technology/twitter-hack.html>

## Learn more

* New York Times documentary about how the Twitter hack occurred (highly recommended):
	- [NYTimes.com](https://www.nytimes.com/video/NYT-Presents/100000007692848/the-teenager-who-hacked-twitter.html)
	- [Hulu](<https://www.hulu.com/series/the-new-york-times-presents-f22278d1-ef56-40e8-9227-af3a029ca6f4>)
* ["Twitter Investigation Report," NY DFS](https://www.dfs.ny.gov/Twitter_Report)
*	[Early news story of the incident](https://www.nytimes.com/2020/07/15/technology/twitter-hack-bill-gates-elon-musk.html)
*	Total amount of bitcoin transferred to this address: <https://www.blockchain.com/btc/address/bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh>

[1]: https://www.dfs.ny.gov/Twitter_Report "Twitter Report, accessed 10/27/2020"
[2]: https://arstechnica.com/tech-policy/2020/07/florida-teen-arrested-charged-with-being-mastermind-of-twitter-hack/
[3]: https://blog.twitter.com/en_us/topics/company/2020/our-continued-work-to-keep-twitter-secure.html

---
title: "Case—Uber 2018 Breach"
description:
include_toc: true
---

# Instructions

1.	Take 5-minutes or so read the case highlights below. You don’t need to read the
    associated reference links.
2.	Discuss with your group the following questions:
    a.	Did a breach actually occur?
    b.	Should Uber have disclosed the breach?
    c.	Who was responsible for the decision whether or not to disclose the breach?
    d.	What do you think the effect of these charges will be on CEOs? On CISOs? On boards?
3.	If you have more time, look at the links below for more detail about the case.

# Case

## Basic facts:

*	In November 2016, hackers stole the personal data of over 57 million Uber passengers and drivers, including: names, email addresses, and mobile phone numbers. It also included 600,000 driver’s license numbers of U.S. Uber drivers.
*	Rather than disclose the breach per various state laws, Uber determined that disclosure was not necessary because they had negotiated a $100,000 payment with the hackers as a bug bounty in exchange for their deleting all stolen data and signing confidentiality agreements.
*	On November 21 2017, after Dara Khosrowshahi replaced had replaced Travis Kalanick as CEO, Dara announced the breach, saying that it was a “failture” to not report the breach earlier. CISO Joe Sullivan and Uber’s lawyer who oversaw the incident were fired at the same time.
*	Uber has since paid $148 million to settle lawsuits with state attorneys general, among other fines.
*	On August 20, 2020, Uber’s former CISO Joe Sullivan was charged with attempting to conceal the breach from federal investigators. He faces up to eight years in prison if convicted.

## What happened [<sup>[1]</sup>](https://www.nytimes.com/2020/08/20/technology/joe-sullivan-uber-charged-hack.html):

> “In 2016, hackers discovered a way to access Uber’s user data and quickly stole a copy of it. Uber found out when the hackers emailed the company and said they had acquired users’ personal information. They demanded money. Mr. Sullivan and other Uber employees negotiated a $100,000 payment and convinced the hackers to sign nondisclosure agreements.
>
> Mr. Sullivan was “visibly shaken” when he learned of the hack and told others that he “could not believe they had let another breach happen and that the team had to make sure word of the breach did not get out,” according to court documents.
>
> At the time, the Federal Trade Commission was investigating Uber in connection with a similar data breach that had occurred two years earlier. But even though he was aware of the F.T.C. inquiry and spoke under oath with investigators, Mr. Sullivan did not inform F.T.C. officials about the 2016 hack, prosecutors said. He also kept information about the incident from Uber employees who were responsible for communicating with the F.T.C. about the earlier incident, according to court documents.
>
> Uber attempted to handle the incident quietly through its so-called bug bounty program. Technology companies often pay bounties to security researchers who discover and report flaws in their software. But bug bounty experts questioned whether the payment Uber gave to the hackers fell within the ethical boundaries of such programs, which are designed to induce people to report security flaws so they can be fixed.
>
> In October, Brandon Glover, a Florida resident, and Vasile Mereacre, a Canadian national, pleaded guilty to the hack. They could each face a maximum of five years in federal prison and are expected to be sentenced next year.”

## Uber working with the hacker [<sup>[2]</sup>](https://www.nytimes.com/2018/01/12/technology/uber-hacker-payment-100000.html)

> “… Mr. Fletcher [Uber’s product security engineering manager] treated the incident as a bounty and encouraged [the hacker] Preacher to provide proof of the vulnerability, including sending a few lines of data from the database he had breached.
>
> … Uber soon discovered that some of its employees had left certain computer code known as keys on a programming site called Github. Those keys had allowed Preacher to gain access to Uber’s Amazon web servers, where it stored source code as well as 57 million customer and driver accounts, including driver’s license numbers for some 600,000 Uber drivers. It was a major oversight.
>
> Emails between the hacker and Mr. Fletcher continued. In some, Mr. Fletcher thanked the hacker for helping the company fix the oversight. In two emails, Preacher’s motivations appeared to veer closer toward blackmail. In one, he demanded “high compensation” for his findings. After Mr. Fletcher said the company’s maximum bounty was $10,000, Preacher said he and his team would only accept “six digits.”
>
> Mr. Fletcher said he would need to seek authorization for a $100,000 payment, and would need Preacher’s reassurances that he would delete the data he had downloaded. Mr. Fletcher also pushed the hacker to take payment through HackerOne, which requires bounty recipients to disclose their real identities for tax requirements.”

## Was it a data breach? [<sup>[3]</sup>](https://www.nytimes.com/2018/01/12/technology/uber-hacker-payment-100000.html)

> “Mr. Kalanick signed off on the $100,000 payment, so long as the hacker signed an agreement to destroy any data exposed in his discovery, according to the emails.
>
> [The hacker’s] trail of digital bread crumbs eventually led to a 20-year-old whose first name was Brandon and who was living in a Florida trailer park with his family, according to the emails. In one email, Uber offered to send someone to meet Brandon at a local coffee shop. Brandon declined to leave his home and suggested that the employee meet him there. It was there that Brandon signed agreements assuring Uber that he had deleted the data he had downloaded. …
>
> Uber’s security team was soon celebrating its response to what could have been a major security breach. Mr. Sullivan and his colleagues were praised in year-end performance reviews, including by Mr. Kalanick, according to current and former employees.”

## Charges for failing to disclose [<sup>[4]</sup>](https://www.nytimes.com/2020/08/20/technology/joe-sullivan-uber-charged-hack.html)

> “But the charges drew an important distinction between failing to protect Uber’s computer network and failing to tell the authorities about it. Prosecutors said that Mr. Sullivan committed two felonies when he didn’t disclose the 2016 incident to federal investigators who were already investigating a similar data breach that had occurred two years earlier.
>
> “When a company like Uber gets hacked, we expect good corporate citizenship, we expect prompt disclosure to the employee and consumer victims in that hack. In this case, what we saw was the exact opposite of good corporate behavior,” said David Anderson, the U.S. attorney in San Francisco, in an interview.

## New precedent [<sup>[5]</sup>](https://www.nytimes.com/2020/08/20/technology/joe-sullivan-uber-charged-hack.html)

> “The criminal charges filed in U.S. District Court in San Francisco against Joe Sullivan, 52, are believed to be the first against an executive stemming from a company’s response to a security incident.”

## 2018 Statement by Joe Sullivan [<sup>[6]</sup>](https://www.nytimes.com/2018/01/12/technology/uber-hacker-payment-100000.html)

> “‘I was surprised and disappointed when those who wanted to portray Uber in a negative light quickly suggested this was a cover-up,’ he said, adding that he was proud its engineers had been able to fix the issue before it could be abused.”

## The responsibility of the CSO compared to other executives [<sup>[7]</sup>](https://www.wired.com/story/uber-exec-joe-sullivan-data-breach-indictment/)

> “The fact that Sullivan is the only executive being indicted for something others participated in also sends a flawed message, says Katie Moussouris, a longtime bug bounty program advocate who runs the consultancy Luta Security. She points out that while CSOs should be held accountable for their actions, they shouldn't be put forth as a convenient "Chief Sacrificial Officer."
>
> "I think that singling out Joe for this is ridiculous," Moussouris says. "No company places security and transparency decisions on one executive alone. Not only is there a shared culpability among all the executives involved in the decision, but any bug bounty companies involved in these types of situations must not ignore data breach laws or agree to facilitate clandestine payoffs."

## Statement by Joe Sullivan’s attorney [<sup>[8]</sup>](https://twitter.com/KimZetter/status/1296550033030971392?s=20)

> “This case centers on a data security investigation at Uber by a large, cross- functional team made up of some of the world's foremost security experts, Mr. Sullivan included. If not for Mr. Sullivan's and his team's efforts, it's likely that the individuals responsible for this incident never would have been identified at all. From the outset, Mr. Sullivan and his team collaborated closely with legal, communications and other relevant teams at Uber, accordance with the company's written policies. Those policies made clear that Uber's legal department and not Mr. Sullivan or his group was responsible for deciding whether, and to whom, the matter should be disclosed.”

# Learn more

*	Uber’s official news release: <https://www.uber.com/newsroom/2016-data-incident/>
*	Behind the scenes of the Uber breach: <https://www.nytimes.com/2018/01/12/technology/uber-hacker-payment-100000.html>
*	Former Uber Security Chief Charged With Concealing Hack: <https://www.nytimes.com/2020/08/20/technology/joe-sullivan-uber-charged-hack.html>
*	In October 2019, the two hackers behind the Uber breach were charged with hacking and extortion: <https://www.justice.gov/usao-ndca/pr/florida-man-and-canadian-national-plead-guilty-hackingextortion-conspiracy>
*	Emails between the hacker and Uber about a bug bounty: <https://www.documentcloud.org/documents/4349230-Uber-Bug-Bounty-Emails.html>
*	DOJ announcement behind the breach: <https://www.justice.gov/usao-ndca/pr/former-chief-security-officer-uber-charged-obstruction-justice>
*	DoJ complaint: <https://www.justice.gov/usao-ndca/press-release/file/1306781/download>

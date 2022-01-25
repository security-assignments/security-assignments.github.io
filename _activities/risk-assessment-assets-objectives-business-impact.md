---
title: Risk Assessment – Business Impact Activity
description: Drawing from FIPS-199, practice identifying organizational assets via examining media breach reports.
  Business impact assessment of the loss of a given security objective (i.e., confidentiality, integrity,
  and availability).
include_toc: true
---

# Instructions

1. Examine the table of security objectives and potential impacts in the [Informative References](#informative-references) section.

2. For the Marriott breach, do the following from the _perspective of the business_ affected by the incident:

	1.  Identify and prioritize the key _information assets_ involved in the security incident
	2.  Explain which security objective(s) failed for those assets (confidentiality, integrity, and availability)
	3.  Determine the business impact to each of the assets identified in terms of “high,” “medium,” or “low” per
[FIPS-199: “Standards for Security Categorization of Federal Information and Information Systems](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.199.pdf).

3. Do the same thing for the Muskingum Valley Health Centers incident.


# Informative References

The below table from [FIPS-199][1] describes how to categorize the business impact of a
failure to meet a given information system security objective.

<table class='table'>
  <caption>Table 1. Potential Impact Definitions for Security Objectives</caption>
  <thead class='text-center text-uppercase'>
      <tr>
        <th></th>
        <th colspan='3' class='text-center'>Potential Impact</th>
      </tr>
      <tr>
        <th>Security Objectives</th>
        <th>Low</th>
        <th>Moderate</th>
        <th>High</th>
      </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <div><em><strong>Confidentiality</strong></em></div>
        <p>Preserving authorized
          restrictions on information
          access and disclosure,
          including means for
          protecting personal
          privacy and proprietary
          information.
          </p>
          <p>[44 U.S.C., SEC. 3542]</p>
      </td>
      <td>
        <p>The unauthorized
        disclosure of information
        could be expected to have
        a <strong>limited</strong> adverse effect on
        organizational operations,
        organizational assets, or
        individuals.</p>
      </td>
      <td>
        <p>The unauthorized
        disclosure of information
        could be expected to have
        a <strong>serious</strong> adverse effect on
        organizational operations,
        organizational assets, or
        individuals.</p>
      </td>
      <td>
        <p>The unauthorized
        disclosure of information
        could be expected to have
        a <strong>severe or catastrophic</strong> adverse effect on
        organizational operations,
        organizational assets, or
        individuals.</p>
      </td>
    </tr>
    <tr>
      <td>
        <div><em><strong>Integrity</strong></em></div>
        <p>Guarding against improper
          information modification
          or destruction, and
          includes ensuring
          information nonrepudiation and
          authenticity.</p>
          <p>[44 U.S.C., SEC. 3542] </p>
      </td>
      <td>The unauthorized
        modification or
        destruction of information
        could be expected to have
        a <strong>limited</strong> adverse effect on
        organizational operations,
        organizational assets, or
        individuals. </td>
      <td>The unauthorized
        modification or
        destruction of information
        could be expected to have
        a <strong>serious</strong> adverse effect on
        organizational operations,
        organizational assets, or
        individuals. </td>
      <td>The unauthorized
        modification or
        destruction of information
        could be expected to have
        a <strong>severe or catastrophic</strong> adverse effect on
        organizational operations,
        organizational assets, or
        individuals. </td>
    </tr>
    <tr>
      <td>
        <div><em><strong>Availability</strong></em></div>
        <p>Ensuring timely and
          reliable access to and use
          of information.</p>
        <p>[44 U.S.C., SEC. 3542] </p>
      </td>
      <td>The disruption of access to
        or use of information or an
        information system could
        be expected to have a
        <strong>limited</strong> adverse effect on
        organizational operations,
        organizational assets, or
        individuals. </td>
      <td>The disruption of access to
        or use of information or an
        information system could
        be expected to have a
        <strong>serious</strong> adverse effect on
        organizational operations,
        organizational assets, or
        individuals. </td>
      <td>The disruption of access to
        or use of information or an
        information system could
        be expected to have a
        <strong>severe or catastrophic</strong> adverse effect on
        organizational operations,
        organizational assets, or
        individuals. </td>
    </tr>
  </tbody>
</table>

Per [FIPS-199][1], pp. 2–3:

>**“The potential impact is LOW if—**
>
>− The loss of confidentiality, integrity, or availability could be expected to have a **limited** adverse effect on
organizational operations, organizational assets, or individuals.[^1]
>
>AMPLIFICATION: A limited adverse effect means that, for example, the loss of confidentiality, integrity, or availability
might: (i) cause a degradation in mission capability to an extent and duration that the organization is able to perform
its primary functions, but the effectiveness of the functions is noticeably reduced; (ii) result in minor damage to
organizational assets; (iii) result in minor financial loss; or (iv) result in minor harm to individuals.
>
>**The potential impact is MODERATE if—**
>
>− The loss of confidentiality, integrity, or availability could be expected to have a **serious** adverse effect on
organizational operations, organizational assets, or individuals.
>
>AMPLIFICATION: A serious adverse effect means that, for example, the loss of confidentiality, integrity, or availability
might: (i) cause a significant degradation in mission capability to an extent and duration that the organization is able
to perform its primary functions, but the effectiveness of the functions is significantly reduced; (ii) result in
significant damage to organizational assets; (iii) result in significant financial loss; or (iv) result in significant
harm to individuals that does not involve loss of life or serious life threatening injuries.
>
>**The potential impact is HIGH if—**
>
>− The loss of confidentiality, integrity, or availability could be expected to have a **severe or catastrophic** adverse
effect on organizational operations, organizational assets, or individuals.
>
>AMPLIFICATION: A severe or catastrophic adverse effect means that, for example, the loss of confidentiality, integrity,
or availability might: (i) cause a severe degradation in or loss of mission capability to an extent and duration that the
organization is not able to perform one or more of its primary functions; (ii) result in major damage to organizational
assets; (iii) result in major financial loss; or (iv) result in severe or catastrophic harm to individuals involving loss
of life or serious life threatening injuries.
>


# Case 1: Marriott Breach (Starwood Hotels)

## Basic facts

*	After purchasing Starwood Hotels and Resorts Worldwide in [2016 for $13 billion](https://www.wsj.com/articles/marriott-completes-acquisition-of-starwood-hotels-resorts-1474605000), Marriott International became “the largest hotel chain in the world by number of available rooms,” with [30 brands and over 7,000 properties around the world](https://en.wikipedia.org/wiki/Marriott_International). Its revenue for 2019 was $5.37 billion with net income of $1.27 billion.
* By 2018, "the former Starwood hotels hadn't been migrated to Marriott own reservation system." [<sup>1</sup>][1]
* On September 8, 2018, Accenture, which managed the legacy Starwood guest reservation database, contacted Marriott IT after a security alert identified an unusual database query. An investigation found that an administrative account was used to run the query, but that "the individual whose credentials were used had not actually made the query." [<sup>2</sup>][2]
* On September 17, 2018, third-party forensic investigators discovered instances of a [Remote Access Trojan (RAT)](https://www.wired.com/2014/12/hacker-lexicon-backdoor/), a type of malware used to provide covert access of a system to hackers. [Mimikatz](https://github.com/gentilkiwi/mimikatz/wiki), a powerful software tool used [to capture passwords and other credentials from computer memory](https://www.wired.com/story/how-mimikatz-became-go-to-hacker-tool/), was also discovered on Starword systems.[<sup>2</sup>][2]
* November 30, 2018, Marriott [announced](https://news.marriott.com/news/2018/11/30/marriott-announces-starwood-guest-reservation-database-security-incident) that the reservation system of Starwood Hotels had been compromised since 2014 and that information relating to 500 million Starwood customers had been compromised (later adjusted downward to 383 million customers)[<sup>2</sup>][2]. This estimate was later adjusted downward to include: 
	- Name 
	- Mailing address 
	- 5.25 million passport numbers 
	- Phone number
	- Email address
	- Starwood Preferred Guest account information
	- 9.1 million credit card numbers and expiration dates, of which 385,000 were unexpired as of September 2018.[<sup>2</sup>][2] This information was encrypted, but could have been unencrypted by attackers because decryption keys were apparently stored on the same server as the encrypted data.[<sup>3</sup>][3]
* Marriott offered customers an ID theft protection service to customers that notably [did not include credit monitoring](https://www.consumerreports.org/identity-theft/why-marriotts-id-theft-protection-may-not-be-enough-a9355979221/).

## What did the breach cost Marriott?

* Marriott has reported $165 million in expenses related to the breach, of which $138 million was covered by cybersecurity insurance.[<sup>10</sup>][10]
* In 2018, the UK Information Commissioner Office fined Marriott approximately $124 million for failing "to process personal data in a manner that ensured appropriate security of the personal data, including protection against unauthorised or unlawful processing and against accidental loss, destruction or damage, using appropriate technical
and organisational measures,"[<sup>8</sup>][8] as required by [GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation), which went into effect in 2018. This fine was reduced in 2020 to approximately $23.9 million.[<sup>9</sup>][9]
* Marriott reported in February 2019 that it had spent $28 million responding to the attack, of which $25 million was covered by cybersecurity insurance.[<sup>7</sup>][7]
* Approximately 100 lawsuits have been filed by consumers and others against Marriott. All but one have been consolidated into a single ongoing class action lawsuit.[<sup>10</sup>][10]
* In addition to lawsuits, "numerous U.S. federal, U.S. state and foreign governmental authorities made inquiries, opened investigations, or requested information and/or documents related to the Data Security Incident and related matters, including Attorneys General offices from all 50 states and the District of Columbia, the Federal Trade Commission, the Securities and Exchange Commission, certain committees of the U.S. Senate and House of Representatives, the Information Commissioner’s Office in the United Kingdom (the “ICO”) as lead supervisory authority in the European Economic Area, and regulatory authorities in various other jurisdictions. With the exception of the ICO proceeding, these matters generally remain open." [<sup>10</sup>][10]

## Who was responsible for the attack?

* In December 2018, _The New York Times_ and _Washington Post_ published articles citing unnamed sources in government who blamed the Marriot breach on hackers employed by the Chinese government intelligence services.[<sup>4</sup>][4][<sup>5</sup>][5] "The Post's and Times's sources had access to more data about the hack than has been made public, and say that the code and attack patterns used match up with techniques employed by state-sponsored Chinese hackers."[<sup>1</sup>][1]
* In February 2020, the U.S. Department of Justice announced the indictment of four members of the Chinese military for hacking into Equifax. In his announcement, U.S. Attorney General Barr linked the Marriott breach to China.[<sup>6</sup>][6]

## Answer the following questions:

1. What are Marriott’s key _information_ assets, in order of priority?
2. Which security objective(s) failed (e.g., confidentiality, integrity, and/or availability)?
3. What was the business impact to those assets (e.g., high, moderate, or low)?

# Case 2: Muskingum Valley Health Centers

## Basic facts

*	Muskingum Valley Health Centers (MVHC) is a medium-sized healthcare provider that serves over 137,000 patients a year at locations in five counties in Ohio ([mvhccares.org](https://www.mvhccares.org/)).
*	The organization suffered a ransomware incident in August 2020 that the company subsequently reported as a data breach.
*	“Ransomware is malware that locks your keyboard or computer to prevent you from accessing your data until you pay a ransom, usually demanded in Bitcoin. The digital extortion racket is not new—it’s been around since about 2005, but attackers have greatly improved on the scheme with the development of [ransomware], which encrypts your files using a private key that only the attacker possesses, instead of simply locking your keyboard or computer” ([Wired.com: What is Ransomware?](https://www.wired.com/2017/05/hacker-lexicon-guide-ransomware-scary-hack-thats-rise/))
* Read the following news article excerpt about the incident:[<sup>11</sup>][11]

  >Ohio hospital's EHR hit by ransomware attack, exposes 7,000+ patients' info
  >Jackie Drees - Thursday, August 6th, 2020
  >
  >Zanesville, Ohio-based Muskingum Valley Health Centers has notified more than 7,000 patients that their personal information may have been exposed in a ransomware attack on its EHR system.
  >
  >In the July 31 data breach notice, the hospital said that in June it discovered a ransomware attack on the EHR system of Cambridge-based OB GYN Specialists of Southeastern Ohio, which MVHC acquired in 2018
  >
  >A cybersecurity firm determined that three OB GYN Specialists' systems, including its EHR server that contained patient records from 2012-17, were hit by ransomware on May 31. Patient names, dates of birth, Social Security numbers, diagnoses, conditions, lab results and insurance claim details were exposed.
  >
  >MVHC reported the incident on July 31 to HHS' OCR data breach portal as affecting 7,447 individuals.
  >
  >The hospital has updated its security policies, procedures and password requirements in response to the incident and is also offering 24 months of credit monitoring and identification theft protection services to individuals affected.

  
*	Breach notification letter:[<sup>12</sup>][12]

    >**What Happened**
    >
    >On June 2, 2020, an employee discovered what appeared to be a ransomware attack on the EMR system of OB GYN Specialists. We immediately took the server containing the EMR system off-line. We launched an internal investigation and hired an external cybersecurity firm to conduct an in-depth investigation. In their July 24, 2020 final report, the cybersecurity firm stated that on May 31, 2020, a ransomware attack encrypted three systems of OB GYN Specialists, including the server containing patient records for the period of 2012-2017. Although their investigation found no evidence that the data was exfiltrated (copied or transferred), we are still required to notify you of this incident.
    >
    >**What Information Was Involved**
    >
    >The OB GYN Specialists' patient records included:
    >*	Demographic information, including patient names, dates of birth, and addresses. We assume that Social Security numbers were also included.
    >*	Clinical information, including diagnoses/conditions, lab results, medications, and other treatment information.
    >*	Financial information, including insurance claim information. This breach did NOT include patient bank account or credit card account information.
    >
    >**What We Are Doing**
    >
    >We take the security of your information seriously and are implementing measures to reduce the likelihood of future cyber-attacks. We have revised our security policies and procedures, strengthened our password requirements and are updating our security risk analysis.
    >
    >In addition, we are offering identity theft protection services through ID Experts®, the data breach and recovery services expert, to provide you with MyIDCare™. MyIDCare services include: 24 months of credit and CyberScan monitoring, a $1,000,000 insurance reimbursement policy, and fully managed id theft recovery services. With this protection, MyIDCare will help you resolve issues if your identity is compromised.”
    >
    
## Answer the following questions:

1. What are MVHC’s key _information_ assets, in order of priority?
2. Which security objective(s) failed (e.g., confidentiality, integrity, and/or availability)?
3. What was the business impact to those assets (e.g., high, moderate, or low)?



# Footnotes

[^1]: “Adverse effects on individuals may include, but are not limited to, loss of the privacy to which individuals are entitled under law. effect on organizational operations, organizational assets, or individuals,” FIPS 199, p. 2, footnote in the original.

[1]: https://www.csoonline.com/article/3441220/marriott-data-breach-faq-how-did-it-happen-and-what-was-the-impact.html 

[2]: https://www.hsgac.senate.gov/imo/media/doc/Soresnson%20Testimony.pdf 

[3]: https://www.computerweekly.com/news/252453521/Marriott-data-breach-highlights-basic-failings 

[4]: https://www.nytimes.com/2018/12/11/us/politics/trump-china-trade.html 

[5]: https://www.washingtonpost.com/technology/2018/12/12/us-investigators-point-china-marriott-hack-affecting-million-travelers/ 

[6]: https://www.nytimes.com/2020/02/10/us/politics/equifax-hack-china.html 
[7]: https://news.marriott.com/2019/02/marriott-international-reports-fourth-quarter-2018-results/ 

[8]: https://ico.org.uk/media/action-weve-taken/mpns/2618524/marriott-international-inc-mpn-20201030.pdf

[9]: https://www.huntonprivacyblog.com/2020/10/30/ico-fines-marriott-international-18-4-million-for-security-breach/ 

[10]: https://marriott.gcs-web.com/node/30866/html

[11]: https://www.beckershospitalreview.com/cybersecurity/ohio-hospital-s-ehr-hit-by-ransomware-attack-exposes-7-000-patients-info.html

[12]: https://www.mass.gov/doc/assigned-data-beach-number-17359-muskingum-valley-health-centers/download

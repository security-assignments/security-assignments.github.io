---
title: Risk Assessment -- Business Impact Activity
description: Drawing from FIPS-199, practice identifying organizational assets via examining media breach reports.
  Business impact assessment of the loss of a given security objective (i.e., confidentiality, integrity,
  and availability).
---

First, read the information in the [Informative References](#informative-references) section.

Following that section are several breach incident cases. **For each of the cases**, do the following from the _perspective of the business_ affected by the incident:

1.  Identify and prioritize the key assets involved in the security incident
2.  Explain which security objective(s) failed for those assets (confidentiality, integrity, and availability)
3.  Determine the business impact to each of the assets identified in terms of “high,” “medium,” or “low” per
[FIPS-199: “Standards for Security Categorization of Federal Information and Information Systems][1].

[1]: https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.199.pdf




# Informative References

The below table from [FIPS-199][1] desecribes how to categorize the business impact of a
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


# Case 1: Marriott Breach (Starwood hotels)

News articles:
*	After purchasing Starwood Hotels and Resorts Worldwide in 2016 for $13 billion (LA Times), Marriott International became “the largest hotel chain in the world by number of available rooms,” with 30 brands and over 7,000 properties around the world.(Wikipedia). Its revenue for 2019 was $5.37 billion with net income of $1.27 billion.
*	Read this article for a summary of the 2018 breach of Starwood Hotels: <https://www.csoonline.com/article/3441220/marriott-data-breach-faq-how-did-it-happen-and-what-was-the-impact.html>
*	Optional: Read the 2018 Marriott announcement: <https://news.marriott.com/news/2018/11/30/marriott-announces-starwood-guest-reservation-database-security-incident>

Answer the following questions:

1. What are Marriott’s key assets, in order of priority?
2. Which security objective(s) failed (e.g., confidentiality, integrity, and/or availability)?
3. What was the business impact to those assets (e.g., high, moderate, or low)?

# Case 2: Muskingum Valley Health Centers

*	Muskingum Valley Health Centers (MVHC) is a medium-sized healthcare provider that serves over 137,000 patients a year at locations in five counties in Ohio ([mvhccares.org](https://www.mvhccares.org/)).
*	The organization suffered a ransomware incident in August 2020 that the company subsequently reported as a data breach.
*	“Ransomware is malware that locks your keyboard or computer to prevent you from accessing your data until you pay a ransom, usually demanded in Bitcoin. The digital extortion racket is not new---it’s been around since about 2005, but attackers have greatly improved on the scheme with the development of ransom cryptware, which encrypts your files using a private key that only the attacker possesses, instead of simply locking your keyboard or computer” ([Wired.com: What is Ransomware?](https://www.wired.com/2017/05/hacker-lexicon-guide-ransomware-scary-hack-thats-rise/))
* Read the following news article excerpt about the incident:

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

  <https://www.beckershospitalreview.com/cybersecurity/ohio-hospital-s-ehr-hit-by-ransomware-attack-exposes-7-000-patients-info.html>
*	Breach notification letter:

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
    <https://www.mass.gov/doc/assigned-data-beach-number-17359-muskingum-valley-health-centers/download>

Answer the following questions:

1. What are MVHC’s key assets, in order of priority?
2. Which security objective(s) failed (e.g., confidentiality, integrity, and/or availability)?
3. What was the business impact to those assets (e.g., high, moderate, or low)?



# Footnotes

[^1]: “Adverse effects on individuals may include, but are not limited to, loss of the privacy to which individuals are entitled under law. effect on organizational operations, organizational assets, or individuals,” FIPS 199, p. 2, footnote in the original.

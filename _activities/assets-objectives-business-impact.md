---
title: Risk Assessment -- Business Impact Activity
description: Drawing from FIPS-199, practice identifying organizational assets via examining media breach reports.
  Business impact assessment of the loss of a given security objective (i.e., confidentiality, integrity,
  and availability).
---

First, read the information in the [Informative References](#informative-references) section.

Then, from the _perspective of the business_, do the following **for each of the below cases**:

1.  Identify and prioritize the key assets involved in the security incident
2.  Explain which security objective(s) failed for those assets (confidentiality, integrity, and availability)
3.  Determine the business impact to each of the assets identified in terms of “high,” “medium,” or “low” per
[FIPS-199: “Standards for Security Categorization of Federal Information and Information Systems][1].

## Case 1: Marriott Breach

News articles:

*	<https://www.nytimes.com/2018/11/30/business/marriott-data-breach.html>


## Case 2: Muskingum Valley Health Centers

News articles:

* <https://www.beckershospitalreview.com/cybersecurity/ohio-hospital-s-ehr-hit-by-ransomware-attack-exposes-7-000-patients-info.html>
* <https://www.mass.gov/doc/assigned-data-beach-number-17359-muskingum-valley-health-centers/download>
* [Wired.com: What is Ransomware?](https://www.wired.com/2017/05/hacker-lexicon-guide-ransomware-scary-hack-thats-rise/)



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

[1]: https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.199.pdf

[^1]: “Adverse effects on individuals may include, but are not limited to, loss of the privacy to which individuals are
    entitled under law. effect on organizational operations, organizational assets, or individuals,” FIPS 199, p. 2,
    footnote in the original.

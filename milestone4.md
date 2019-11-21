---
layout: assignment
title: Milestone 4 Instructions
---

Your assignment is to create a risk assessment and mitigation report for the server your examined in Milestone 2. However, now consider that the Milestone 3 server was an integral part of processing the following financial management information types (e.g., the C.3.2 "Financial Management" category in Table 6 of [NIST Special Publication 800-60 Volume I](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-60v1r1.pdf)):

* Asset and Liability Management (C.3.2.1)
* Reporting and Information (C.3.2.2)
* Funds Control (C.3.2.3)
* Accounting (C.3.2.4)
* Payments (C.3.2.5)
* Collections and Receivables (C.3.2.6)
* Cost Accounting/ Performance Measurement (C.3.2.7)

# Objectives 

1. For each information type listed in section C.3.2 of [NIST Special Publication 800-60 Volume II](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-60v2r1.pdf), complete a row like the following: 

    ![img]( {{ "/assets/images/Impact-table.png" | relative_url }}){: width="700px" }
    
    For each row, the "overall impact rating" is the highest impact listed in any of the cells for "confidentiality," "integrity," and "availability."
    
    You can use [this Excel spreadsheet file](/security-assignments/assets/files/Risk_assessment_table.xlsx) as a template.

2. For each information type, use the information in [FIPS-199: "Standards for Security Categorization of Federal Information and Information Systems"](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.199.pdf) (particularly Table 1) to write about the potential impact to the organization if the Milestone 2 server was breached containing these information types.

3. For each weakness you identified in Section 3 of your penetration test report, find controls that mitigate these weaknesses from Table D-2: "Security Control Baselines" from [NIST Special Publication 800-53: "Security and Privacy Controls for Federal Information Systems and Organizations"](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-53r4.pdf).

    Explain in your assessment how these controls would mitigate each vulnerability you identified in Milestone 2.

## Written Report Deliverable

You should write the report for a managerial audience, one that isn't
versed in information security concepts. In other words, you need to
explain the concepts in terms that can be easily understood by managers
without technical experience. If you use technical or unfamiliar terms,
include a glossary of the terms used.

There is no length requirement for the report, but your report must not
exceed 20 pages (not including appendices).

In writing your report, organize for impact. This means you should
discuss the most serious vulnerabilities first. 

## Report Sections

1. Executive summary (1 page)
2. Briefly summarize the vulnerabilities reported in Section 3 of your penetration test report. Discuss why the likelihood is high that these vulnerabilities could be exploited in the future.
3. Present and describe the impact rating table you created in Step 1 above and discuss the impact for each information type.
4. Describe mitigating controls you identified in Step 3 above for the vulnerabilities you reported in Section 3 of your Milestone 2 report.


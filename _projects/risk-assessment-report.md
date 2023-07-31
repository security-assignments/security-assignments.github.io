---
layout: assignment
title: Risk Assessment Report
order: 2
---

*With Dr.* [*David Lanter*](https://community.mis.temple.edu/dlanter/)

---

Your assignment is to create a risk assessment report for managers of a (fictitious) company that owns and depends on financial information contained in a financial management system.

Financial management involves the aggregate set of accounting practices and procedures that allow for the accurate and effective handling of all a business’ revenues, funding, and expenditures. A financial management information system supports the following business functions and associated datasets:

* Accounting
* Funds Control
* Payments
* Collections and Receivables
* Asset and Liability Management
* Reporting and Information
* Cost Accounting/ Performance

The following three security objectives are critical to these business functions and associated datasets:

* *Confidentiality*: The impacts of a breach of confidentiality of financial management information are generally associated with the sensitivity of the existence of projects, programs, and/or technologies; and customers, suppliers, contractors and employees that might be revealed by unauthorized disclosure of information.
* *Integrity*: The impacts of a breach of integrity of financial management information may result from temporary successful frauds that can affect the business’ image, while corrective actions may disrupt the business’ operations.
* *Availability*: The impacts of a permanent loss of availability of financial management information can cripple business operations.

The purpose of your risk assessment is to clarify the level of concern for confidentiality, integrity, and availability and the potential impact on the business’ operations should the information and information system be compromised through unauthorized access, use, disclosure, disruption, modification, or destruction.

Your risk assessment will be based on:
1.	Security objectives and potential impacts defined in [Federal Information Processing Standard 199: “Standards for Security Categorization of Federal Information and Information Systems”](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.199.pdf),
2.	Methodology for assigning impact levels to information and information system types described in [NIST Special Publication 800-60 Volume I](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-60v1r1.pdf),
3.	Provisional security categorizations assigned to the financial management information types by [NIST Special Publication 800-60 Volume II](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-60v2r1.pdf),
4.	Determination of an overall security categorization for the financial management information system based on the provisional security categorization of the information types (from 3 above)

To start, consider that financial management systems is an integral part of processing the following financial management information types (e.g., the C.3.2 “Financial Management” category in Table 6 of [NIST Special Publication 800-60 Volume I](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-60v1r1.pdf)):

* Asset and Liability Management (C.3.2.1)
* Reporting and Information (C.3.2.2)
* Funds Control (C.3.2.3)
* Accounting (C.3.2.4)
* Payments (C.3.2.5)
* Collections and Receivables (C.3.2.6)
* Cost Accounting/ Performance Measurement (C.3.2.7)

# Instructions

1. For each information type listed in section C.3.2 of [NIST Special Publication 800-60 Volume II](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-60v2r1.pdf), complete a row like the following:

    ![img]( {{ "/assets/images/Impact-table.png" | relative_url }}){: width="700px" }

    For each security objective column (i.e., under “Confidentiality,” “Integrity,” and “Availability”), calculate the overall categorization of the information stored within the server that houses the financial management information and information system. Determine the “Overall Impact Rating” by recording the highest impact value listed in any of the security objectives: “Confidentiality,” “Integrity,” and “Availability” to determine the overall information system categorization.

    You can use [this Excel spreadsheet file]({{ '/assets/files/Risk_assessment_table.xlsx' | relative_url }}) as a template.

2. For each information type, use the information in [FIPS-199: "Standards for Security Categorization of Federal Information and Information Systems"](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.199.pdf) (particularly Table 1) to describe the potential impact to the organization if the financial management information system was breached containing these information types.

## Written Report Deliverable

You should write the report for a managerial audience, one that isn't
versed in information security concepts. In other words, you need to
explain the concepts in terms that can be easily understood by managers
without technical experience. If you use technical or unfamiliar terms,
include a glossary of the terms used.

The suggested length requirement for the report is 4–5 pages (not including appendices).

## Report Sections

1. Executive summary (1 page). In this section, state that the report:
    * Is an assessment of risk to information stored on financial management systems.
    * Classifies impacts to different information types, in terms of confidentiality, integrity, and availability, following [NIST Special Publication 800-60 Volume II](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-60v2r1.pdf).
    * Classifies these potential impacts as "low," "moderate," and "high," which correspond to "limited," "serious," "severe" or "catastrophic" adverse effects, per [FIPS-199: "Standards for Security Categorization of Federal Information and Information Systems"](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.199.pdf).

2. Main body:
    * Present and describe the impact rating table you created in Step 1 of the instructions above and discuss the impact for each information type.
    * Bold the items in the right-most column.
    * State that these impact ratings come from [NIST Special Publication 800-60 Volume II](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-60v2r1.pdf).
    * In section 1, briefly define integrity, confidentiality, and availability, per FIPS 199. You're welcome to quote from [FIPS-199: "Standards for Security Categorization of Federal Information and Information Systems"](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.199.pdf).
    * In section 2, briefly define each impact category: "low," "moderate," and "high," which correspond to "limited," "serious," "severe" or "catastrophic" adverse effects, per [FIPS-199: "Standards for Security Categorization of Federal Information and Information Systems"](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.199.pdf).
    * In section 3, create a subsection for each information type (e.g., Asset and Liability Management, C.3.2.1).
        * For each subsection, explain why it has the impact rating that it does for confidentiality, integrity, and availability. You're welcome to quote from [NIST Special Publication 800-60 Volume II](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-60v2r1.pdf) with attribution.
        * Give emphasis to the most serious impacts.

3. Optionally, add a glossary section that defines the technology terms you use for a managerial audience.
4. Add a reference section where you can list the title, author or agency name (e.g., NIST), URL, and access date for the works you cite.

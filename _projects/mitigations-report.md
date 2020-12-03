---
layout: assignment
title: Final Penetration Test Report with Mitigations
order: 4
---

For this assignment, you will expand your penetration report to include a new section (Section 5) in which you recommend controls that can mitigate the vulnerabilities you identified previously.

# Instructions

1. For each vulnerability discussed in subsections of Section 3 of your penetration report, create a corresponding subsection in Section 5 that discusses one or more controls that would mitigate the risk identified.

    Cross-reference each subsection of Section 5 to corresponding subsections in Sections 4 and 5.

2. For each vulnerability, search for one or more controls in the NIST special publication 800-53 "[NIST Special Publication 800-53 (Rev. 4)
"Security and Privacy Controls for Federal Information Systems and Organizations](https://nvd.nist.gov/800-53/Rev4)" that mitigate the risk.

    A convenient way to do this is to use the [NIST Cybersecurity Framework ⭤  800‑53 Controls Mapping site](https://daveeargle.com/nist_csf_800_53_mapping/).
    
3. For each control identified, state the NIST Cybersecurity Framework function, category, and sub-category, along with the control family and control title from NIST 800-53 as reported by the [NIST Cybersecurity Framework ⭤  800‑53 Controls Mapping site](https://daveeargle.com/nist_csf_800_53_mapping/).

    Cite as many controls as necessary to mitigate the vulnerability. In some cases, a single control may be sufficient. In others, more than one control may be required.

4. Since a single control may involve many activities, quote from NIST 800-53 **only the relevant portions of the control** that address the weakness you identified. This may include material from the "Control Enhancements" or "Supplemental Guidance" sections of the 800-53 control entry.

5. Explain in your own words the value of the control and how it would mitigate the risk you identified.

6. If a vulnerability requires a control that you have previously described elsewhere in Section 5, state the NIST Cybersecurity Framework function, category, etc., as usual, but refer the reader to the subsection where the control is explained.

# Example

For example, for the vulnerability of weak passwords, you could cite the following control:

**NIST Cybersecurity Framework (CSF) function**: Protect

**CSF Category**: Access Control (PR.AC)

**CSF Subcategory**: PR.AC-1: "Identities and credentials are managed for authorized devices and users"

**NIST 800-53 Control Family**: Identification and Authentication

**Control Title**: IA-5: Authenticator Management

The relevant text from the control could include:

* **IA-5 (1)(a) PASSWORD-BASED AUTHENTICATION**: "Enforces minimum password complexity of [Assignment: organization-defined requirements for case sensitivity, number of characters, mix of upper-case letters, lower-case letters, numbers, and special characters, including minimum requirements for each type]"

* **IA-5 (4) AUTOMATED SUPPORT FOR PASSWORD STRENGTH DETERMINATION**: 
"The organization employs automated tools to determine if password authenticators are sufficiently strong to satisfy [Assignment: organization-defined requirements]."

After each control, explain why it would help to mitigate the vulnerability of weak passwords.
   
# Written Report Deliverable

As before, you should write Section 5 of the report for a managerial audience, one that isn't versed in information security concepts. In other words, you need to explain the concepts in terms that can be easily understood by managers without technical experience. If you use technical or unfamiliar terms, briefly give an explanation in the text and include a glossary of the terms used.

There is no length requirement for Section 5 of the report or for the final report overall.

# Rubric

Section 5 of the report will be graded using the following rubric:

{: .table }

| Criteria | Points |
| --- | ---: |
| Cross-reference each subsection of Section 5 to corresponding subsections in Sections 4 and 5 | 5  |
| List at least one NIST 800-53 control for each vulnerability identified in Section 3  | 5  |
| State the NIST Cybersecurity Framework function, category, and sub-category, along with the control family and control title from NIST 800-53 | 5 |
| Quote from 800-53 only the relevant portions of the control | 10 |
| Explain in your own words the value of the control and how it would mitigate the risk you identified| 40 |
| Technical terms and concepts briefly explained in the text so that a non-technical reader can understand | 10 |
| Technical terms introduced added to glossary | 5 |
| Incorporate feedback on the report that was previously received from the instructor | 15 |
| Show tracked changes in Microsoft Word and retain previous comments made by the instructor | 5 |

| **Total** |  **100** |

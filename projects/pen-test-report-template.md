---
title: Penetration Testing Report Template
---

This page provides a template for a penetration test vulnerability assessment
report. The rubric for each section can be found on the [assignment description
page]({{ site.baseurl }}{% link _pen_test_assignments/pen-test.md %}#rubric).

---

# Team [team-number] Penetration Testing Report

_[List team member names here]_

# Executive Summary

_One-page executive summary that highlights the
most important findings of your report._

---

_Must be no longer than one page. This should be written so that
non-technical executives can understand._

_Describe the number of serious successful
exploits and the amount of sensitive data you were
able to obtain._

_Give a high-level summary of your recommendations
to fix the problem._

_Don’t describe specifics or use technical terms
that may be unfamiliar to a non-technical person in
this section._

# 1.	Project Scope Description

_Description of the scope of the project, objectives, and your authorization to perform the assessment_

---

_Includes the IP of the computer you
are attacking, and dates and times that you are given permission to attempt to
access it._

_This should be written so that non-technical executives can understand._

## 1.1.	Objectives

_Place objectives from the agreement here._


## 1.2.	Authorization

_A copy of your authorization to perform the threat assessment._

# 2.	Target of Assessment

_Information about the server examined (i.e., OS, user accounts, applications installed, databases stored)._

---

_Give a brief description of major applications installed, web sites hosted, services running, and
databases that exist (both database applications, such as MySQL, and information stored within those database
applications)._

# 3.	Relevant Findings

_High-level description of vulnerabilities successfully exploited and sensitive data obtained._

---

_Organize for impact. This means you should discuss the most serious vulnerabilities first._

_This should be written so that non-technical executives can understand. Define technical terms and concepts described in
the glossary section._

_List sensitive data obtained in the final subsection of section 3. Clearly state the names and paths of files accessed,
and if secured, how you were able to access them. If files are too numerous to include in the main body of the report,
list them in an appendix. If you obtain passwords, list what those passwords are._

_Use style “Heading 2” to number each exploit and sensitive data obtained.
Give a brief 1–4 sentence overview of what you were able to accomplish. Then include a cross-reference to a subsection in
section 4 with supporting details on how you performed the attack. Give a high-level recommendation on what to do to fix
the problem, cross-referencing a subsection in section 5._

_See below for an example._

> 3.1.	SSH Backdoor (example)
>
> The version of SSH installed on the server, WeakSSH, contained a backdoor… Because of this exploit, we were able to
> obtain… Please refer to section 4.1 for further details. This problem can be remediated by uninstalling WeakSSH and
> installing the latest version of OpenSSH. See section 5.1 for specific remediation steps. See Appendix A for a listing
> of affected users. (end example)

# 4.	Supporting Details

_Supporting details for each of the relevant details listed in the previous section. The detail
should be sufficient for another person to replicate the results of your main findings using your report._

---

_This section should be written so that a technical person can exactly replicate the steps that you performed. List every
command/step used to perform the attack. This should follow the methodology discussed in class for the steps of
vulnerability scanning, moving through to the exploitation lab material._

_Cross reference sections 3 and 5._

_See below for an example._

>4.1.	SSH Backdoor (example)
>
>We discovered this vulnerability by… We performed this exploit by (list all steps) by:
>
> 1.
>
> 2.
>
> 3.
>
>Because of this exploit we were able to obtain… See section 3.1. See section 5.1 for recommended steps to fix this
>vulnerability, see section … (end example)

# 5.	Vulnerability Remediation

_Explanation for how to protect against vulnerabilities successfully exploited and sensitive data obtained. Provide
specific steps._

---

_This section should be written so that a technical person can know what she/he can do to fix the problem._

_Cross reference sections 3 and 4._

_See below for an example._

> 5.1.	SSH Backdoor (example)
>
> Uninstall WeakSSH and install the latest version of OpenSSH. See sections 3.1 and 4.1. (end example)

# 6.	Glossary

_Define technical terms used in the report here._

# 7.	Appendix A

_Optional. Include here technical detail that is useful to include for replication or documentation purposes, but would
disrupt the flow of the report because of its length. Number appendices to make them easy to reference from the
“Supporting Details” section._

_Do *not* submit a Nessus report!_

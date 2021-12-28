---
title: About &amp; Fine Print
layout: page
include_toc: true
---


## What is this site?

_2021-12-08_

Any of you who teach cybersecurity know that it can be a challenge to find
quality, hands-on security labs for your students, as well as providing a safe
environment for the students to work in. Tony Vance and I have created a website
to address both of these problems.


First, we created a series of cybersecurity labs that are freely available for
anyone to use, available on this site. These labs cover a
variety of topics such as:
* Malware analysis
* Password cracking
* Vulnerability scanning and exploitation
* Cryptography
* Social engineering

The labs include questions. Corresponding Canvas quiz questions and answer keys
are available as a free offering to instructors using this in a classroom
environment.

Second, we created a virtual machine hosting environment on Google Cloud
Platform (GCP) for students to safely use security tools associated with the
labs. We charge a nominal one-time fee per student, payable by students via
[an online storefront]({{ site.baseurl }}{% link store.md %}), for them to use the virtual environment
for the academic year. Students can use GCP's free trial credits to cover all
platform usage costs over the semester.

This environment consists of a Kali Linux virtual machine (VM) for each student.
This Kali VM uses nested virtualization to host several VMs within itself:


![included-vms]({{ '/assets/images/included-vms.png' | relative_url }}){: max-width="300px"}

The advantage of this approach are that:

1. Only a web browser is required, giving students access to the same level of
   high computing power, regardless of what personal device they use.
1. Cloud storage means that students do not have to sacrifice storage space on
   their personal devices.
1. A private network ensures that students do not have to worry about
   accidentally compromising their own computers or inadvertently attacking
   others' computers.
1. The private network also means that instructors and students do not need to
   worry about security tools triggering the alarms of campus networks.

The labs or the virtual machine setup can be dropped into existing courses.

This virtual machine setup is used at Virginia Tech, Temple University, and the
University of Colorado-Boulder.

If you would like to learn more about either using the labs or virtual machine
environment for a class you teach, see [this guide]({{ site.baseurl }}{% link instructor-adoption.md %}),
or contact <support@security-assignments.com>.

<hr/>

## Fine Print

These assignments are co-authored by Drs. [Dave Eargle](https://daveeargle.com)
and [Anthony Vance](https://anthonyvance.com/), unless otherwise indicated.

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img class='aligncenter' alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>

All original content on this site is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>,
attributable to {% include attribution-authors-tony-dave.html %}.

All code for this project (the general way the site is structured and built -- excluding its content) is [available on GitHub](http://github.com/{{ site.repository }}) and licensed under the MIT license.

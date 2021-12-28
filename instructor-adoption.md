---
title: Using this material in classroom settings
layout: page
include_toc: true
---

{% capture github_issues_url %}https://github.com/{{ site.repository }}/issues{% endcapture %}

<p class='lead'>This guide is written for instructors considering adopting content on this site into their courses.</p>

See the [about]({{ site.baseurl }}{% link about.md %}) page for an overall description of the use-case of
content on this website.


## Labs that use Kali-on-GCP

{% assign kali_labs = '' | split: '' %}
{% assign nokali_labs = '' | split: '' %}

{% for lab in site.labs %}
{% if lab.vms %}
{% assign kali_labs = kali_labs | push: lab %}
{% else %}
{% assign nokali_labs = nokali_labs | push: lab %}
{% endif %}
{% endfor %}

Not all of the labs use Kali. The labs that _do_ use Kali are following:

<ul>
{% for lab in kali_labs %}
<li><a href="{{ lab.url | relative_url }}">{{ lab.title }}</a></li>
{% endfor %}
</ul>


The labs that _do not_ use Kali are the following:

<ul>
{% for lab in nokali_labs %}
<li><a href="{{ lab.url | relative_url }}">{{ lab.title }}</a></li>
{% endfor %}
</ul>


## Assigning a lab that uses Kali

If instructors assign students any of the labs that use Kali, students will need to purchase
access to the Kali-on-GCP package. Assign the
[Intro to GCP]({{ site.baseurl }}{% link _tutorials/intro-to-gcp.md %}) tutorial to get students started on GCP.

Instructors may also want to assign the [Intro to Linux]({{ site.baseurl }}{% link _tutorials/intro-to-linux.md %}) tutorial.


## Sequencing labs for the pentest assignment

There is a penetration test assignment that is intended as a major project
(found [here]({{ site.baseurl }}{% link _projects/pen-test.md %})). There is a sequence of labs
that prepares students to complete this project.

The pentest preparation lab sequence is as follows:

{% assign pentest_prep_labs = site.labs | where: "is_pentest_prep", true | sort: "number" %}

<ol>
{% for lab in pentest_prep_labs %}
<li><a href='{{ lab.url | relative_url }}'>{{ lab.title }}</a></li>
{% endfor %}
</ol>


## Support and Service Level Agreements

Generally, we guarantee that the lab virtual machines will function, but we do
not provide direct support to students. However, instructor can submit
requests that certain lab content be clarified, to increase lab ease of use for students.
Instructors can also submit bug reports.

To submit lab change requests, or to report bugs, instructors should submit an "issue" on the
[the github repo for this site]({{ github_issues_url }}).

For an example Service Level Agreement, see [here]({{ site.baseurl }}{% link sla.md %}).

Please contact us at <support@security-assignments.com> to arrange your own SLA.
Instructors are provided with free access to Kali-on-GCP.


## Preparing to use

We recommend that instructors personally complete any lab they want to assign to their
students. This will enable them to answer questions that their students may raise.


## The labs are intended to stand independent of lectures

While Tony and Dave use these labs in tandem with custom lectures, these labs
are intended to stand independent of those lectures. If instructors notice content in
these labs that seems to assume certain lecture material has been delivered,
they should please [file a bug report]({{ github_issues_url }}).

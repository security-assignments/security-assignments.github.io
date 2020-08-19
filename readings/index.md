---
title: Information Security Management | Readings
regenerate: true
layout: assignment
---

<h2>Topics</h2>
{% for topic in site.readings %}
<div>
<h3>{{ topic.topic }}</h3>
<ul>
{% for reading in topic.readings %}
    <li> {{ reading | markdownify }} </li>
{% endfor %}
</ul>
</div>
{% endfor %}

{% if site.instructorcollab_domain %}
{% if site.instructorcollab_domain == 'colorado.edu' %}
## CU Boulder Library Links
* ["Secrets & Lies" by Bruce Schneier](http://ucblibraries.summon.serialssolutions.com/#!/search?bookMark=ePnHCXMw42JgAfZbU5lBl_IAKxtg8x50_hgXsJ4xBTUVDI05oLFtZGwCOg_NgpNBIBjUQiopVgD2nRWALa9ibgYNN9cQZw_d0mR4pzHe2MwAdLpDPHT4BHSsiDnouluilQIAZj8pTQ)
* ["Threat Modeling" by Adam Shostack](http://ucblibraries.summon.serialssolutions.com/#!/search?bookMark=ePnHCXMw42JgAfZbUxkhpykBm6_AGsjMElhIcoE5oAYJaJjfCNT0ALYWwNeiWICb2aYWBhzw0RFDM0tTIzNOBv6QDFDjSQF8LwywMOdhYCkpKgWWnBpuriHOHrqlyfBuZbyxmQHo_Id4FCOMuRnUIEqLszNzcoqBhVs8qP1abGRSYR6flF0MvnIXNBfNzaAJUZhYnA0sYICFT0lxfFkOeNKyOB7FN0C1ilBDE9OAlsejqjEEHzPIzaCMRY0hhip1iCpYTRAPthC6NDPe1cnZ0MwI2KdCMg8YDEWJuSmZ6eBrRQogp1LEm4Kn3BCqILOucGl09xMdfgAzQoLM)
* ["The Practice of Network Security Monitoring" by Richard Bejtlich](http://ucblibraries.summon.serialssolutions.com/#!/search?bookMark=ePnHCXMw42JgAfZbUxkhpymZApsHwAYxaGc5Et8A1ATmMgJNmgHTg5kZB2xQBFjfg4604mQArTdQgO0TUshPU8iDLIpWKIbe6qaQC07yoLEvbgYNN9cQZw_d0mR4FzPe2MwAdBZEPIq5xtwMahClxdmZOTnFwIIuHtSWLTYyqTCPT8ouBt-yZ2wCOkNQBaIQVj7Hg-cuoQsm4w1NzY0swEeHykGUQSZ54wsgJ0TEG4IqXmBTCahACauCkooSZEXKMEWIjU8Is-B2Ee1NAGX0cjY)
* ["Practical Malware Analysis" by Sikorski and Honig](http://ucblibraries.summon.serialssolutions.com/#!/search?bookMark=ePnHCXMw42JgAfZbUxkhpymZApsHwDoKdCY2F4RjBL4AicsItGkTfGAXaADOGHTQk5GZEQdsdAR0I4SlsSEngxTk2B6gexVyE3PKE4tSFRKhp3XwMLCUFJUCC1ENN9cQZw_d0mR4DzPe2MwAdBREPIppxtwMahClxdmZOTnFwHIuHtSULTYyqTCPT8ouBp-dCCysgQrVIQphxXM8eOoSul4y3tXJ2dDQ2Bx0eBUJtgMAGRdNlg)
* ["SQL Injection" by Justin Clarke](http://ucblibraries.summon.serialssolutions.com/#!/search?bookMark=ePnHCXMw42JgAfZbQRuBDUFtVUtLYBJihhytBOGbgXtEgY7mZnqWeo7gW1EtQKdGAduuxhyw0RED0JkthhacDIrBgT4KmXlZ4HVJeQqJoAvvs4sVgL1shZTUNGBPD1iIqri5hjh76JYmw3uY8dCxj_gkC2AFa2FsCLq9QBOiLLE4G1h8AIuWkuL4shzwlGRxPMJ55sagE0GVIWphpXM8WBl0uWS8JTDdWlggVAHrmKLE3JTMdPA1HwWQUyLigf0IE_DpokoQVZB5YLh0SUVJPOiOXQtTE5Dj5LAqQlIANwWxNwphFZqDIBOuCGk0zxEVXgAYH4Xm)
* ["The Web Application Hacker's Handbook" by Stuttard and Pinto](http://ucblibraries.summon.serialssolutions.com/#!/search?bookMark=ePnHCXMw42JgAfZbQRuBDUF7Gs1NjUzMmSFHK4FPG4McV84FqncsjU2A9SMHbEQE1BQ2N7fgZFAFhpACsBBRQJrDVchIBC0zUC9WAA0ogxqg3Awabq4hzh66pcnwnmW8sZkB6AiIeBQTjbkZVCBKYaVtPHgmErr8Md7EwBiYcEH7dpQhyoCVRlFibkpmOvjejgLIsQ_xQEUWRqBrEOQgqiATu3BpoPfMgc0lkG1KWBWUVJQQqQh0ZouZsRFuqxAK4KYgtkzBlYEqewMLhLewKkJ4nujgBADKlY-Z)
{% elsif site.instructorcollab_domain == 'temple.edu' %}
## Temple University Library Links
{% endif %}
{% endif %}

---
title: Activities
---

# {{ page.title }}

{% assign activities = site.activities %}
{% for activity in activities %}
* [{{ activity.title }}]( {{ activity.url | relative_url }} )
{%- endfor %}

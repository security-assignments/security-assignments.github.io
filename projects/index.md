---
title: Projects
layout: page
---

{% assign assignments = site.projects | sort: 'order' %}
{% for assignment in assignments %}
- [{{ assignment.title }}]( {{ assignment.url | relative_url }} )
{%- endfor %}

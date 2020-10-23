---
title: Projects
---

# {{ page.title }}

{% include attribution.html %}

## Assignments

{% assign assignments = site.projects | sort: 'order' %}
{% for assignment in assignments %}

1. [{{ assignment.title }}]( {{ assignment.url | relative_url }} )

{% endfor %}

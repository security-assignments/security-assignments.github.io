---
title: Pen Test Assignments
---

# {{ page.title }}

{% include attribution.html %}

## Assignments

{% assign assignments = site.pen_test_assignments | sort: 'order' %}
{% for assignment in assignments %}

1. [{{ assignment.title }}]( {{ assignment.url | relative_url }} )

{% endfor %}

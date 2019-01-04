---
layout: assignment
---
 
{% assign assignments = site.labs | sort: 'number' %}
{% for assignment in assignments %} 

[{{ assignment.title }}]( {{ assignment.url | relative_url }} )

{% endfor %}

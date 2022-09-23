---
title: In-class Activities
layout: page
regenerate: true
---

{% assign activities = site.activities | sort: "title" %}
{% for activity in activities %}
* [{{ activity.title }}]( {{ activity.url | relative_url }} )
{%- endfor %}

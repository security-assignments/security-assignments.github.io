---
title: Readings
regenerate: true
layout: page
include_toc: true
description: A collection of readings assigned in the course.
---

Check your course LMS page (e.g., Canvas) to see whether library links are available for these readings.

{% assign topics = site.readings | sort: "topic" %}
{% for topic in topics %}
<div>
<h2>{{ topic.topic }}</h2>
<ul>
{% for reading in topic.readings %}
    <li> {{ reading | markdownify }} </li>
{% endfor %}
</ul>
{{ topic.content | markdownify }}
</div>
{% endfor %}

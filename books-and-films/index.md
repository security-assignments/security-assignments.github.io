---
title: Books and Films
layout: page
id: security-readings-and-films-list
redirect_from: /security-reading-and-film-list/
include_toc: true
---

A list of recommended security-related books and films.

# Security Films

{% assign films = site.films %}
{% for film in films %}

<div class='row bottom-divider'>

<div class='col-md-2'>
<img src="{{ film.img }}" width="70%" class='center-block' />
</div>

<div class='col-md-8' markdown='1'>

_"{{ film.title }},"_ by {{ film.director }}

{{ film.comment }}

    {% for _link in film.links %}

{{ _link.type }}: [{{_link.link}}]({{_link.link}})

    {% endfor %}

</div>

</div>

{% endfor %}



# Security Books

{% assign books = site.books | sort: 'author' %}

{% for book in books %}

<div class='row bottom-divider'>

<div class='col-md-2'>
<img src="{{ book.img }}" width="70%" class='center-block' />
</div>

<div class='col-md-8' markdown='1'>

_"{{ book.title }},"_ by {{ book.author }}.

{{ book.comment }}


{% for _link in book.links %}

{{ _link.type }}: [{{_link.link}}]({{_link.link}})

{% endfor %}


</div>
</div>
{% endfor %}

---
wide_layout: true
links:
  - name: Labs
    url: '/labs/'
  - name: Tutorials
    url: '/tutorials/'
  - name: Book and Film List
    url: '/security-reading-and-film-list/'
  - name: Reading Topics
    url: '/readings/'
  - name: In-class Activities
    url: '/activities/'
  - name: Projects
    url: '/projects'
  - name: Store
    url: '/store/'
---

<section class="jumbotron text-center">
  <div class="container">
    <h1 class="title jumbotron-heading">Security-Assignments.com</h1>
    <p class="lead text-muted mb-0">Content for an information security management course.</p>
    <p class="text-muted"><em>By Drs. <a href='https://daveeargle.com'>Dave Eargle</a> and <a href='https://anthonyvance.com/'>Anthony Vance</a></em></p>
    <p>
      <a class='btn btn-primary' href="{{ site.baseurl }}{% link about.md %}">Learn more</a>
      <span class="px-1">·</span>
      <a href="{{ site.baseurl }}{% link instructor-adoption.md %}">Adoption guide</a>
    </p>

  </div>
</section>

<div class="">
  <div class="container">
    <div class="row">
      {% for link in page.links %}
      <div class="col-sm-6">
        <div class="card mb-4 shadow-sm">
          <div class="card-body">
            <h5 class="card-title mb-0">{{ link.name }}</h5>
            {% if link.description %}<p class="card-text">{{ link.description }}</p>{% endif %}
            <a href="{{ link.url | relative_url }}" class="stretched-link"></a>
          </div>
        </div>


      </div>
      {% endfor %}
    </div>

  </div>
</div>

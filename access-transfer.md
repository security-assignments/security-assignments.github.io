---
title: Transfer Lab Material Access
layout: page
permalink: '/transfer/'
send_to_address: 'access-request@security-assignments.com'
support_address: 'support@security-assignments.com'
description: Use this service to transfer purchased access to lab GCP materials between your accounts. 
---

If the "transfer from" address has valid access to the lab materials, then the address will receive an email with a link to confirm the transfer.

Note:

* Access is only transferrable between accounts owned by the same person -- access is non-transferrable to different persons. 
* To use this service, access must have been purchased recently.



<form id='email-continue' class='card needs-validation mb-3 p-3 border-bottom'>
  <div class="form-group">
    <label for="gcp-email-from">Transfer <strong>From</strong> GCP Email address</label>
    <input
      type="email"
      required
      class="form-control"
      id="gcp-email-from"
      placeholder="transfer-from@gmail.com"
      pattern=".+@(gmail|example)\.com">
    <small id="emailHelp-from" class="form-text text-muted">The @gmail.com email address that you are transferring access <strong>from</strong>.</small>
    <div class="invalid-feedback" aria-live="polite">Please provide a valid @gmail.com email address.</div>
  </div>
  <div class="form-group">
    <label for="gcp-email-to">Transfer <strong>To</strong> GCP Email address</label> 
    <input
      type="email"
      required
      class="form-control"
      id="gcp-email-to"
      placeholder="transfer-to@gmail.com"
      pattern="^.+@(gmail|example)\.com$">
    <small id="emailHelp-to" class="form-text text-muted">The @gmail.com email address that you are transferring access <strong>to</strong>.</small>
    <div class="invalid-feedback" aria-live="polite">Please provide a valid @gmail.com email address.</div>
  </div>

  <button type="submit" class="btn btn-primary">Submit Transfer Request</button>
</form>
<div class='' id="form-submit-status-container">
  <span id="loading-text"></span>
</div>


<p>If you need support, contact <a href="mailto:{{ page.support_address }}">{{ page.support_address }}</a></p>

<script type="text/javascript">
  const support_address = "{{ page.support_address }}";
</script>


<!-- Add the checkout buttons, set up the order and approve the order -->
<script>

function submitForm() {

  let status_container_id = "form-submit-status-container";

  document.getElementById(status_container_id).classList.remove('d-none');

  let gcp_email_from = document.getElementById('gcp-email-from').value;
  let gcp_email_to = document.getElementById('gcp-email-to').value;
  

  const params = new URLSearchParams();
  params.append("from", gcp_email_from);
  params.append("to", gcp_email_to);

  fetch(`{{ site.transfer_access_service_endpoint }}/sign?${params}`)
  .then(response => {
    if (!response.ok){
      throw new Error("Network response was not ok: " + response.status);
    }
    return response.text()
  })
  .then(data => {
      const element = document.getElementById(status_container_id);
      element.innerHTML = '';
      let inner_html = `
        <div class='alert alert-success'>
          <h3>Request successfully submitted.</h3>

          <p>If address <strong>${gcp_email_from}</strong> has valid access to the lab materials, then it will receive an email with a link to complete the transfer.</p>
        </div>
      `;

      element.innerHTML = inner_html;


    console.log("Success!", data)
  })
  .catch(error => {
    console.error("Fetch error:", error);

    const element = document.getElementById(status_container_id);
      element.innerHTML = '';
      let inner_html = `
        <div class='alert alert-danger'>
          <h3>Error!</h3>
          <p>Something went wrong.</p>
          <p>If you need support, contact <strong>{{ page.support_address }}</strong>.</p>
        </div>
      `;

      element.innerHTML = inner_html;
  })

}

(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        event.preventDefault();
        event.stopPropagation();
        if (form.checkValidity() === true) {

          submitForm();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

</script>

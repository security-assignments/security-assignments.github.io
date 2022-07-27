---
title: Store
layout: page
permalink: '/store/'
send_to_address: 'access-request@security-assignments.com'
support_address: 'support@security-assignments.com'
description: This page is the storefront for security-assignments.com.
---


<h2>Lab virtual machine access package -- $50 for Academic year 22/23</h2>

<div class="container">
  <div class="row">
    <div class="col-sm">

      <p>To gain access to the lab virtual machines, do the following:</p>

      <ol>
        <li>Sign up for an account on GCP using an @gmail.com address.*</li>
        <li>Enter your GCP <strong>@gmail.com</strong> address on this page, and click
            "Continue."</li>
        <li>Submit payment for the <strong>lab virtual machine
          access package</strong>.</li>
        <li>Within a few minutes, you should receive
          notification to your gcp email address (not your paypal email address) that the gcp email address has been added to the
          <strong>image-user@security-assignments.com</strong> group, giving it
          access to the lab virtual machines.</li>
      </ol>

      <p>If you later want to change your GCP email associated with your purchase, <a href="mailto:{{ page.support_address }}">{{ page.support_address }}</a>
        Non-transferrable to different persons -- just transferrable within google accounts that belong to you.</p>
      <hr/>
      <p>* If you have a non-@gmail.com email address that you are certain will work on GCP, contact <a href="mailto:{{ page.send_to_address }}">{{ page.send_to_address }}</a>.</p>
    </div>
    <div class="col-sm">
      <form id='email-continue' class='needs-validation mb-3 pb-3 border-bottom' novalidate>
        <div class="form-group">
          <label for="gcp-email">GCP Email address</label>
          <input
            type="email"
            required
            class="form-control"
            id="gcp-email"
            placeholder="example@gmail.com"
            pattern=".+@(gmail|example)\.com">
          <small id="emailHelp" class="form-text text-muted">The @gmail.com email address that you will use with GCP.</small>
          <div class="invalid-feedback" aria-live="polite">Please provide a valid @gmail.com email address.</div>
        </div>
        <button type="submit" class="btn btn-primary">Continue</button>
      </form>
      <div class='d-none' id="paypal-button-container">
        <span id="loading-text"></span>
      </div>
    </div>
  </div>
</div>

<p>If you need support, contact <a href="mailto:{{ page.support_address }}">{{ page.support_address }}</a></p>

<script type="text/javascript">
  const support_address = "{{ page.support_address }}";
</script>

{% if jekyll.environment == "production" %}
<!-- live client id  -->
<script src="https://www.paypal.com/sdk/js?client-id=AUEsnSYbdrbOdYz8pzZU0ude32jv6JSvP1Uf9nNW0PzEbp3-VDXzAOFAoFQdPtkoytkiJ5sUwwZ6xirc&enable-funding=venmo&currency=USD"></script>
<script type="text/javascript">
  const PAYPAL_MODE = 'LIVE';
</script>
{% else %}
<!-- sandbox client id  -->
<script src="https://www.paypal.com/sdk/js?client-id=ATO5KjQC9-FA8iiRDD3Zl2WE4L3paJRaM3_6xX8XKmDvjW-SDVkrSbmgZpr6WoQnBU5oxPtMdzBg9CeL&enable-funding=venmo&currency=USD"></script>
<script type="text/javascript">
  const PAYPAL_MODE = 'SANDBOX';
</script>
{% endif %}



<!-- Add the checkout buttons, set up the order and approve the order -->
<script>

function initPayPalButton() {

  document.getElementById('paypal-button-container').classList.remove('d-none');
  document.getElementById('gcp-email').setAttribute('readonly', true);
  let gcp_email = document.getElementById('gcp-email').value;

  paypal.Buttons({
    onInit: function(data, actions){
      document.getElementById('loading-text').remove();
    },
    // https://developer.paypal.com/docs/checkout/reference/server-integration/set-up-transaction/
    createOrder: function(data, actions) {
      // return fetch('http://localhost:8080/', {
      return fetch('https://us-central1-security-assignments-kali.cloudfunctions.net/security-assignments-paypal-order-create', {
        method: 'post',
        headers: {
          'content-type': 'application/json'
        },
        body: JSON.stringify({'gcp_email': gcp_email, 'paypal_mode': PAYPAL_MODE})
      }).then(function(res){
        return res.json()
      }).then(function(data){
        return data.id
      })
    },
    onApprove: function(data, actions) {
      return actions.order.capture().then(function(orderData) {
        // Full available details
        console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));

        let paypal_id = orderData.purchase_units[0].payments.captures[0].id;

        // Show a success message within this page, e.g.
        const element = document.getElementById('paypal-button-container');
        element.innerHTML = '';
        let inner_html = `
          <div class='alert alert-success'>
            <h3>Thank you for your payment!</h3>

            <p>Your paypal transaction id is: <strong>${paypal_id}</strong></p>
            <p>Your submitted GCP email address is: <strong>${gcp_email}</strong></p>
          </div>
        `;

        element.innerHTML = inner_html;

        // Or go to another URL:  actions.redirect('thank_you.html');
      });
    },
    onError: function(err) {
      // console.log(err);
      const element = document.getElementById('paypal-button-container');
      element.innerHTML = '';
      let inner_html = `
        <div class='alert alert-danger'>
          <h3>Error!</h3>

          <p>Sorry, an error occurred during payment processing.</p>
          <p>This can happen if you try to submit a purchase for an email address already on file.</p>
          <p>You tried to submit GCP email address: <strong>${gcp_email}</strong></p>
          <p>If you need support, send an email to <strong>${support_address}</strong>.</p>
        </div>
      `;

      element.innerHTML = inner_html;
    }
  }).render('#paypal-button-container'); // Display payment options on your web page
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

          initPayPalButton();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

</script>

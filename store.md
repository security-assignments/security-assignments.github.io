---
title: Store
layout: page
permalink: '/store/'
send_to_address: 'access-request@security-assignments.com'
---


{% if jekyll.environment == "production" %}
<!-- live client id  -->
<script src="https://www.paypal.com/sdk/js?client-id=AUEsnSYbdrbOdYz8pzZU0ude32jv6JSvP1Uf9nNW0PzEbp3-VDXzAOFAoFQdPtkoytkiJ5sUwwZ6xirc&enable-funding=venmo&currency=USD"></script>
{% else %}
<!-- sandbox client id  -->
<script src="https://www.paypal.com/sdk/js?client-id=ATO5KjQC9-FA8iiRDD3Zl2WE4L3paJRaM3_6xX8XKmDvjW-SDVkrSbmgZpr6WoQnBU5oxPtMdzBg9CeL&enable-funding=venmo&currency=USD"></script>
{% endif %}


This page is the storefront for <{{ site.url }}>.

---


<h2>Lab virtual machine access package (<del>$50</del> $40 for Academic year 21/22)</h2>

<div class="container">
  <div class="row">
    <div class="col-sm">

      <p>To gain access to the lab virtual machines, do the following:</p>

      <ol>
        <li>Sign up for an account on GCP. See the note on <a href="{{'/tutorials/intro-to-gcp.html' | relative_url }}">the Intro to GCP page</a> about choosing an email address for GCP. Note which email address you used.</li>
        <li>Purchase this <strong>lab virtual machine access package</strong>.</li>
        <li>Send an email to <strong><a href="mailto:{{ page.send_to_address }}">{{ page.send_to_address }}</a></strong> with your order confirmation information.
          <strong><em>Also mention your GCP email address.</em></strong>
        </li>
        <li>Within 24 business hours, you should receive notification to your gcp email address that it has been added to the <a href="https://groups.google.com/g/infosec-management">infosec-management google group</a>, giving you
          access to the lab virtual machines.</li>
        </ol>

      <p>If you want to later change your GCP email associated with your purchase, send a request to <a href="{{ page.send_to_address }}">{{ page.send_to_address }}</a>.
        Non-transferrable to different persons -- just transferrable within google accounts that belong to you.</p>
    </div>
    <div class="col-sm">
      <div id="paypal-button-container"></div>
    </div>
  </div>
</div>

If you need support, contact <a href="mailto:support@security-assignments.com">support@security-assignments.com</a>


<!-- Add the checkout buttons, set up the order and approve the order -->
<script>
function initPayPalButton() {
  paypal.Buttons({
    createOrder: function(data, actions) {
      return actions.order.create({
        purchase_units: [{
          description: "Access to security-assignments.com lab virtual machines on GCP",
          amount: {
            value: '40.00'
          }
        }]
      });
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

            <p>Forward your paypal transaction confirmation email to <a href="{{ page.send_to_address }}">{{ page.send_to_address }}</a>.
            <strong>In your message, also specify your GCP email address.</strong>
          </div>
        `;

        element.innerHTML = inner_html;

        // Or go to another URL:  actions.redirect('thank_you.html');
      });
    },

    onError: function(err) {
      console.log(err);
    }
  }).render('#paypal-button-container'); // Display payment options on your web page
}
initPayPalButton();
</script>


<div id="smart-button-container">
  <div style="text-align: center;">
    <div id="paypal-button-container"></div>
  </div>
</div>

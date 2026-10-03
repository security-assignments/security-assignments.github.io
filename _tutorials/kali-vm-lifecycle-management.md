---
layout: assignment
title: Kali-on-GCP Lifecycle Management
published: true
number: 3.5
include_toc: true
---

Treat your Kali-on-GCP VM instance as disposable. Keep necessary notes, screenshots, and deliverables outside the VM instance, for example, on your own computer or in a course document.

Before stopping Kali, assume that your next lab session may require a fresh instance.

# Tools: Google Cloud console vs using `kali-launcher`

Use `kali-launcher` to create or recreate the Kali VM instance.

Use the Google Cloud console to stop and start an existing Kali VM instance.


# Key principles for the life of a Kali-on-GCP instance

Subscribing to the Kali-on-GCP lab virtual machine access package gives your Google account access to the Kali on GCP _image_.

GCP resources are located in specific datacenter _zones_. A zone is located within a _region_. Zones have **limited compute resource hardware availability.**

When you use the `kali-launcher` script from the [setup instructions]({{ '/tutorials/intro-to-gcp.html#part-32-launch-your-kali-instance-with-the-launcher-script' | relative_url }}), the launcher searches for a _zone_ with sufficient available hardware to launch your Kali instance, and it _launches_ a Kali instance for you in that zone. It uses a specific _hardware configuration_, which states the required CPU and RAM specifications. It also creates a _disk_ for you from the access package _image_.

While an instance is _running_, its machine resources are _reserved_ -- the resources cannot be taken away.

When you use your Kali instance, such as when you set up Chrome Remote Desktop access, you are making modifications to your _disk_.

"Stopping" keeps the VM instance's disk, but it releases the VM instance's compute capacity. When you start it again, Google Cloud must check for available capacity for its zone and machine type. A **stockout** means that capacity is unavailable in that zone, so the stopped VM instance may fail to start. This is described in [Google's resource availability guidance](https://docs.cloud.google.com/compute/docs/troubleshooting/troubleshooting-resource-availability). Dealing with a stockout involves recreating your Kali instance. This is described more later in this document.




# The startup credit of $300 is enough to leave the instance running constantly for ~1.5 months

Regardless of whether your Kali instance is _running_ or _stopped_, you incur costs for having a _disk_. As of 2026-10-02, those costs are about **$24/month**.

A _running_ instance incurs CPU and RAM "Compute" costs. As of 2026-10-02, these costs for a Kali-on-GCP instance are around **$170/month** compute costs for an instance left running 24/7. This is in addition to the disk costs.


Using these estimates for one Kali VM instance running 24/7:

| Item | Calculation | Approximate amount |
| --- | --- | --- |
| Compute per month | CPU and RAM | $170 |
| Disk per month | Persistent disk | $24 |
| Total per month | $170 + $24 | **$194** |
| Time covered by $300 | $300 ÷ $194 per month | **1.55 months (about 46 days)** |
{: .table .table-bordered .table-striped .table-sm }

This assumes the credit is used only for this instance and its disk. Actual costs vary with the machine type, zone, and other resource usage.

# Keep Kali running throughout a lab

Remember that whenever you stop your Kali instance, there is a chance you will have to destroy it and recreate it when you try to start it again. Recreating it loses any in-progress work.

Therefore, **leave Kali running for the duration of a lab**.

Closing Chrome Remote Desktop or your browser does not stop the VM instance.


# You can stop your Kali instance when you finish a lab

When you finish a lab, you can stop your Kali instance.

Stopping preserves your instance's boot disk, but if you stop your instance, plan to possibly have to recreate it when you try to start it again. Do not stop a Kali instance without first copying all necessary course work off of it.

1. Copy all necessary notes, screenshots, and deliverables off the VM instance. Check that you can open them outside Kali.
2. On the [VM instances page](https://console.cloud.google.com/compute/instances), check your course project, select your `kali` instance, choose **Stop**, and confirm.

{% include lab-image.html image='intro-to-gcp/gcp-shutdown-suspend.png' alt='Selected VM instance with the Stop control marked in the Google Cloud console' caption='First copy necessary course work off your Kali VM instance. Then select its checkbox, choose <strong>Stop</strong>, and confirm. Wait for the stopped status. This older console screenshot labels the Stop control with a square icon. Select your own <code>kali</code> instance.' %}



# Start a stopped Kali for your next lab

1. On the [VM instances page](https://console.cloud.google.com/compute/instances), select your `kali` instance and choose **Start / Resume**.
2. Wait for it to show as running and allow a few minutes for Kali to boot.
3. Connect through [Chrome Remote Desktop](https://remotedesktop.google.com/access).

{% include lab-image.html image='kali-vm-lifecycle-management/start-stopped-instance.png' alt='Stopped Kali VM instance selected with Start / Resume enabled in the Google Cloud console' caption='Check your course project, (1) select the checkbox beside your stopped <code>kali</code> VM instance, and (2) click <strong>Start / Resume</strong>. Wait for the instance to show as running, allow a few minutes for Kali to boot, then connect through Chrome Remote Desktop.' %}

However, you might get a **stockout** when you try to start your stopped Kali instance.


# To deal with a stockout, recreate your Kali instance using `kali-launcher`

A stockout event looks like this:

{% include lab-image.html image='kali-vm-lifecycle-management/stockout.png' alt='Google Cloud reports that the n2-standard-4 VM instance is unavailable in us-central1-b when starting Kali' caption='The stopped <code>kali</code> VM instance is selected, but <strong>Start / Resume</strong> fails because the requested machine type is unavailable in its zone. This is a stockout. Use <code>kali-launcher --recreate</code> in Cloud Shell to create a fresh instance, after ensuring necessary course work is stored offsite.' %}

If you have a stockout when you try to start a stopped Kali instance, you need to recreate your Kali instance using `kali-launcher`.

Recreation gives you a fresh Kali VM instance; it does not carry over your files, installed software, or Chrome Remote Desktop setup.


1. Open **Cloud Shell** using the `>_` icon in the Google Cloud console. Confirm that you are using your course Google account and project.

2. Update the launcher and recreate the instance:

   ```bash
   kali-launcher --self-update
   kali-launcher --recreate
   ```

   Read the deletion prompt and confirm when you are ready. If Cloud Shell cannot find `kali-launcher`, follow [the installation steps in the GCP introduction]({{ '/tutorials/intro-to-gcp.html#part-32-launch-your-kali-instance-with-the-launcher-script' | relative_url }}), then run the commands above.

3. Wait for the launcher to report that the new instance was created. Refresh the VM instances list; the new VM instance may be in a different zone.
4. Repeat [the Chrome Remote Desktop setup]({{ '/tutorials/intro-to-gcp.html#part-4-connect-to-your-kali-linux-vm-using-chrome-remote-desktop' | relative_url }}) and any lab-specific setup you need.




{% include lab-image.html image='kali-vm-lifecycle-management/recreate.png' alt='Cloud Shell shows the recreation command, deletion confirmation, and successful creation of a fresh Kali instance' caption='In Cloud Shell, run <code>kali-launcher --self-update</code>, then <code>kali-launcher --recreate</code>. Confirm deletion only after necessary course work is stored offsite. Wait for <strong>Kali instance created</strong>, then repeat Chrome Remote Desktop setup. This screenshot runs the downloaded script as <code>./kali-launcher.sh --recreate</code>; the instructions above use its installed command, <code>kali-launcher</code>.' %}




# Destroy Kali when you no longer need it

After copying any remaining course work off the VM instance, open Cloud Shell in the correct project and run:

```bash
kali-launcher --delete-only
```

Read and confirm the deletion prompt. When you need a fresh Kali VM instance again, run `kali-launcher` and repeat the Chrome Remote Desktop setup.

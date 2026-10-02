---
title: "Lab: AI Vulnerabilities Playground"
number: 14
vms:
    - Kali
description: Introduction to prompt injection and AI-security defenses with OWASP AIVP
published: true
---

In this lab, you will use the [OWASP AI Vulnerabilities Playground (AIVP)](https://github.com/OWASP/AI-Vulnerabilities-Playground) to learn how prompt injection can undermine an AI application's intended behavior. AIVP is an intentionally vulnerable application built for security education. Its embedded challenge instructions provide the details for each exercise; this lab focuses on safe setup, the concepts to notice, and defensive analysis.

<div class='alert alert-danger'><strong>Authorized use only.</strong> Perform this lab only in the locally installed AIVP application on your course Kali VM. Do not use the techniques from this lab against public AI services, other systems, or data you do not own or have explicit permission to test.</div>

<div class='alert alert-info'><strong>Keep AIVP local.</strong> AIVP's web UI is deliberately vulnerable and is configured to listen only on your Kali VM's loopback interface. Open it only from Chrome inside your Kali Chrome Remote Desktop session at <code>http://127.0.0.1:8888</code>. Do not create a GCP firewall rule, public port exposure, or a tunnel for port 8888. Also do not expose Ollama's port 11434.</div>

# Learning Objectives

By the end of this lab, you should be able to:

* distinguish direct prompt injection from indirect prompt injection;
* identify the trust boundary that fails when a model treats untrusted content as instructions;
* explain why prompt-only instructions are not a dependable protection for secrets; and
* describe controls outside the model that can reduce the impact of prompt injection.

# Part 1: Install and Open AIVP

Complete this part from a terminal inside your Kali Chrome Remote Desktop session. The installer uses the course-supported AIVP configuration and may take approximately 5–10 minutes, depending on network and container-registry speed; the fastest validated installation took 3 minutes 27 seconds. The initial installation needs outbound network access to download required packages, containers, and the model.

1. Run the following command:

        curl -fsSL https://raw.githubusercontent.com/security-assignments/aivp-kali-installer/main/install.sh | sh

2. When the installation finishes, verify that AIVP is running:

        aivp status

3. Open the local application:

        aivp open

   Alternatively, open <http://127.0.0.1:8888> in Chrome inside the Kali desktop. The first CPU-only model response can take about 10 seconds.

# Part 2: Orient Yourself to AIVP

In AIVP, select **Explore Labs**, then expand **Phase 1: Prompt Injection** and select **Launch Lab** for the exercise you are completing. Before attempting a challenge, read its embedded **Scenario**, **Objective**, **What You're Breaking**, **What You'll Learn**, and **Real-World Impact** panels. These panels explain the individual exercise.

{% include lab-image.html image='aivp/aivp-explore-phase-1.png' alt='AIVP Explore Security Labs page with Phase 1 Prompt Injection expanded, listing PI-01 through PI-10 and their Launch Lab buttons.' caption='AIVP Explore Labs with Phase 1 expanded. Use the Launch Lab button next to the challenge you are completing.' %}

After each attempt, use AIVP's **Run Summary** to assess the result. For this lab, a completed exercise has **Exploit Success: Yes**. Aim also for **User-visible Disclosure: Yes** when that field is shown.

When you recover the challenge's synthetic secret, enter it in AIVP's **Submit Your Answer** field and select **Submit Answer** to check it within the local application.

# Part 3: Prompt Injection Exercises

Complete the following three AIVP challenges in **Phase 1: Prompt Injection**:

1. **PI-01: Direct Prompt Injection.** Read the challenge's embedded material and complete it in AIVP.
2. **PI-02: Indirect Prompt Injection.** Read the challenge's embedded material and complete it in AIVP.
3. **One additional Phase 1 challenge of your choice from PI-03 through PI-10.** Choose a different prompt-injection technique, read its embedded material, and complete it in AIVP.

{% include lab-image.html image='aivp/aivp-pi-01-start.png' alt='Clean starting layout of AIVP PI-01 Direct Prompt Injection showing the scenario and objective panels, an empty Chat with the Model field, and zero recent runs.' caption='PI-01 before a prompt is sent. Read the scenario and objective on the left, then use the empty chat field on the right.' %}

As you work, focus on the difference between an attacker directly addressing the model and attacker-controlled content being processed as data. AIVP uses model-generated responses, so results are nondeterministic and you may need to iterate. The goal is to recognize the broken trust boundary, not to memorize a particular wording that happens to work with one model response.

# Part 4: Reflection and Defensive Design

Answer the following questions. Describe your strategy and reasoning.

{% include lab-image.html image='aivp/aivp-pi-01-success.png' alt='AIVP PI-01 Direct Prompt Injection successful-result page. The Run Summary shows Exploit Success, Internal Disclosure, and User-visible Disclosure as Yes, while the chat history is collapsed, the prompt field and answer field are empty, and the submission feedback says Correct.' caption='Example of a successful PI-01 Run Summary from a maintainer validation run. Your submission should show the relevant lab ID and Exploit Success: Yes.' %}

{% include lab_question.html question='For each of PI-01, PI-02, and your selected third challenge, submit a screenshot of its AIVP Run Summary showing the lab ID and Exploit Success: Yes. You may combine screenshots only if each required lab ID and summary remains clearly visible.' %}

{% include lab_question.html question='Which additional Phase 1 challenge did you choose, and what prompt-injection technique does its embedded challenge description explore?' %}

{% include lab_question.html question='Compare direct prompt injection with indirect prompt injection. In each case, where do the attacker-controlled instructions enter the AI application?' %}

{% include lab_question.html question='Why should an AI application avoid placing credentials, private records, or other secrets in model context, even when the system prompt tells the model not to reveal them?' %}

{% include lab_question.html question='Propose two concrete mitigations for a support chatbot that can search internal documents and call tools. At least one mitigation must be enforced outside the model. Explain what each mitigation protects and why a prompt-only instruction is insufficient.' %}

{% include lab_question.html question='Confirm that you performed this work only against the loopback-only AIVP application on your course Kali VM.' %}

# Troubleshooting and Cleanup

Use these commands from a Kali terminal if you need to check or manage the local application:

        aivp status
        aivp restart
        aivp logs
        aivp stop

Use <code>aivp restart</code> if the local application is not responding, and <code>aivp logs</code> if you need to diagnose startup behavior; <code>aivp logs</code> follows the log stream until you press <kbd>Ctrl</kbd>+<kbd>C</kbd>. AIVP remains local to your VM; no additional inbound network configuration is needed. When you are finished, you may stop the AIVP application with <code>aivp stop</code>. This does not uninstall the downloaded model or Ollama. Run <code>aivp start</code> later if you want to return to the playground.

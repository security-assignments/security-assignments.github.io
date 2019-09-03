---
title: "Lab: Threat Modeling with Attack Trees"
number: 1
description: Practice with attack trees
published: true
---
 
**Note:** You can do this assignment alone or in groups of 2–3.

In this lab, you will create attack trees for different attacker goals to help you systematically think through various attacks. You can represent your attack tree graphically (like those depicted in Schneier Chapter 21), or as a numbered list (e.g., 1, 1.1, 1.2, 1.2.1, 1.3, …). The below questions are in part from Cryptography Engineering, 2nd edition, by Ferguson, Schneier and Kohno (2010).

**Note:** I recommend using Microsoft Word’s SmartArt function and the "hierarchy" template to quickly generate an attack tree from an outline. You can enter multiple lines into one box by using `shift+enter`.

![image_4]({{ "/assets/images/lab_threatmodel_smartart.PNG" | relative_url }}){: width="500px" }

**Minimum requirement for each attack tree:**

*   Have at least three different attacks (second-level nodes).
*   Have at least one attack with a path at least three subnodes deep.
*   Have at least two attacks that have subtasks with at least two immediate children.
*   Answer all questions. Defends rankings and answers. E.g., "We think that \_\_\_\_ would be the easiest because \_\_\_\_\_, whereas \_\_\_\_\_ would not be as easy because \_\_\_\_\_." 

1.  Create an attack tree for stealing a car, and show your work. Which attack is easiest for the attacker? Which attack poses the least amount of risk for the attacker?
    
    _Required metrics_: Each node has metrics for both "ease" and "risk."

2.  Create an attack tree for getting into a gym without paying. Which attack do you think is most likely?
    
    _Required metrics_: Each node has metrics for "likelihood" (e.g., very unlikely to very likely, or your could state a probability as a percentage).
    
3.  Create an attack tree for reading someone else’s email. Assign a difficulty level to each attack node, per 'Schneier Chapter 21'. Which attack requires the least sophistication on the part of the attacker? Which attack requires the greatest expertise? **What types of attackers do you think would use each attack?**
    
    _Required metrics_: Each node has a metric for "difficulty", "sophistication", and "expertise."
    
4.  Create an attack tree for learning someone’s online banking account username and password. Assign dollar values to each attack node, per 'Schneier Chapter 21'. Which attack is cheapest for the attacker? Which attack is most expensive?

    _Required metrics_: Each node has a metric for "dollar value".
    
## Deliverable:

Submit a PDF document on Canvas with one page for each of the attack trees along with answers to the associated questions. If working as a team, join a "group" on Canvas, and make only one submission per team. To do this, on the course page in Canvas, select "People" and the "Lab: Threat Modeling" tab. Then, drag the names of class members on the left into one of the available groups.

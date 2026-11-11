---
layout: page
title: "The law of small numbers: how two digit events shape our perception of the world"
description: How rare, life-changing events in the one- to two-digit range bias our beliefs - a Bayesian take on cognitive bias, recommendation systems and free will. Full article PDF linked on the page.
img: assets/img/law_of_small_numbers/bayes-inference.png
importance: 2
category: uni
---

<p style="text-align: center;">
  Cristi Andrei Prioteasa<br>
  University of Heidelberg<br>
  March 19, 2025
</p>

<p style="text-align: center;">
  <a href="{{ '/assets/pdf/law_of_small_numbers.pdf' | relative_url }}" target="_blank" class="btn btn-sm z-depth-0" role="button"><i class="fa-solid fa-file-pdf"></i> Download PDF</a>
</p>

<p style="text-align: center;"><em>Disclaimer: This article represents the author's personal views on cognitive biases and Bayesian modeling, and is not related to or representative of my work at the University of Heidelberg. The views expressed here are subject to revision as new evidence and insights emerge.</em></p>

## Abstract

Cognitive biases are both acquired and innate characteristics of any individual and play a key role in self-regulation and unbiased estimation and perception of external events. The Law of Small Numbers is a cognitive bias where individuals mistakenly assume that small samples accurately represent the characteristics of a larger population, leading to systematic misjudgments. This proposal aims to explore the psychological and statistical foundations of this bias through a Bayesian modeling approach, putting into perspective the level of uncertainty that overgeneralization from small samples brings.

Since the most significant events, both in the private life of the individual (marriage, divorce, birth of a child, death of a relative), as well as in society at large (wars, changes of regime, pandemics etc.) occur in small numbers (single to two digits), we are inclined (and rightly so) to draw general conclusions from these events and act according to them.

How many marriages should one have to draw a statistically unbiased conclusion? How many wars should society at large experience before an emerging pattern is revealed? Where should we draw the line between hasty generalization and not learning from experience? These are the kinds of questions this article will try to answer, offering both a mathematical framework and personal reflections.

## 1 Introduction

There is a certain displeasure in the very sound of the law of small numbers, a displeasure felt most keenly among mathematicians and statisticians alike. The law of small numbers (and here mathematicians will argue that it is not a law at all, but a mere bias) stands in psychological contrast to the law of large numbers, with which I hope the reader is familiar. To make my work more accessible to a larger audience, I will informally note that the law of large numbers (which is indeed a law in its strictest sense) is a fundamental theorem in probability theory, showing that as you take more samples, the average is more likely to be close to the true mean, which in turn justifies why empirical data can approximate theoretical probability distributions. The theory operates on the concept of convergence at infinity, very dear to mathematicians, but as the reader is aware, events in our daily life rarely occur in infinite amounts, but rather in small one- or two-digit numbers.

The whole matter would certainly not deserve further investigation, and we should be at peace knowing that there are laws that govern how probabilities work and that they do indeed work very well with hundreds of thousands of samples, were it not for a simple observation: the vast majority of events that impact our lives (and here we shall think of things like the death of a relative, the birth of a child, an unfortunate accident, a global pandemic) are confined to happen in this one- to two-digit range. Were they more frequent, we would definitely get used to them.

## 2 Background

Regarding our perception being far from absolute is a well-known fact, and the reader is invited to think of the many examples of how our perception of the world is influenced by the limitations of our visual apparatus, hearing, or other senses. Aristotle and Plato were already aware of this, and, although they had their different opinions on the matter (<a href="#ref-plato_phaedo">Plato [-380]</a> and <a href="#ref-aristotle_anima">Aristotle [-350]</a>), they were both convinced that our perception is not absolute and, although knowledge comes from sensory experience, intellectual abstraction is necessary to understand deeper truths such as causal relationships or the nature of the universe.

It was later Descartes, with his famous "cogito ergo sum", who first introduced the concept of mind-body dualism, a concept that is still very much present in our scientific and philosophical understanding of the world. But it is something that Miller, in his famous paper <a href="#ref-miller1956">Miller [1956]</a> *The magical number 7, plus or minus 2: some limits on our capacity for processing information* was only able to hint at: that even logical deduction, what Descartes thought of as independent of sensory experience, is indeed limited by the limited capacity of our sensory apparatus. The Bayesian brain <a href="#ref-bayesian_brain">Knill and Pouget [2004]</a> was only many decades later able to postulate a hypothesis on why the human brain is inherently biased even in the most abstract of thinking (see scruffies vs neats). It is precisely these shortcuts our brain has made (perhaps as an energy-saving mechanism during our evolutionary journey) that lead us to the Law of Small Numbers, that is hasty generalization from small samples and a poor intuitive understanding of statistics and probabilities.

Perhaps if our prehistoric ancestors had been (in some dystopian scenario) exposed and forced to work with large amounts of data for their survival, infer complex probabilities with numerous variables and interact with large complex datasets, we would not have these inherent biases and estimating probabilities would be a much more straightforward and unbiased matter. This dystopian scenario, unthinkable for our hunter-gatherer ancestors, surely sounds today as much familiar as unnerving.

### 2.1 Representativeness heuristic: neglecting priors

I shall make a short excursion by turning to Tversky and Kahneman to illustrate my point on our inherited biases of neglecting priors. The representativeness heuristic is a cognitive bias that occurs when people judge the probability of an event based on how similar it is to a prototype or template, rather than on the actual statistical likelihood of the event. This bias can lead to inaccurate probability assessments and can result in overconfidence in predictions. This is famously illustrated by Tversky and Kahneman in their seminal paper <a href="#ref-tversky1971">Tversky and Kahneman [1974]</a> where they show that people tend to overestimate the probability of events that are similar to prototypes and underestimate the probability of events that are dissimilar to prototypes. Let us in turn look at an example that <a href="#ref-tversky1971">Tversky and Kahneman [1974]</a> proposes, where participants were asked to estimate the probability of being an engineer or a lawyer based solely on description and prior information:

*Dick is a 30-year-old man. He is married with no children. A man of high ability and high motivation, he promises to be quite successful in his field. He is well liked by his colleagues.*

The provided description contained no meaningful information to determine Dick's profession between engineering and law. From a statistical perspective, the probability of Dick being an engineer should have matched the base rate of engineers in the reference group, just as if participants had received no description at all. However, the experimental results revealed that participants consistently estimated a 50% probability that Dick was an engineer, disregarding whether engineers made up 70% or 30% of the reference population.

This demonstrates an interesting phenomenon: people process the absence of information differently from the presence of non-informative details. In scenarios with no information provided, individuals appropriately consider base rates; however, when presented with irrelevant information, they tend to disregard these prior probabilities entirely. Politicians and marketers have paid good attention to this phenomenon, as they are able to use it to their advantage by presenting their candidates or products as the perfect fit for voters or customers, when in fact they are far from it. We have behavioral economics to thank for it.

### 2.2 Bayesian modeling of human behavior

We now turn our attention to bayesian inference, a mathematical framework for updating beliefs in the light of new evidence. In its simplest form, prior assumption about an event are updated in the light of new evidence, which is then used to make predictions about future events. Although some postulate that the human brain is a bayesian machine (<a href="#ref-bayesian-brain">Knill and Pouget</a>), the truth is that seems to serve more as an elegant mathematical model rather than a empirical infered observation.

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/law_of_small_numbers/bayes-inference.png" title="Bayesian inference" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Figure 1: Bayesian inference framework showing how prior beliefs are updated with new evidence to form posterior beliefs.
</div>

What is important for the reader to know from this vast mathematical apparatus is that the more different our prior assumption or belief is from the new evidence, the more we update our belief in light of the new evidence. This is the concept of *Bayesian Updating*. It is rather easy to imagine how much weight important events (such as the birth of a child or the death of a relative due to an accident) in our lives can have on our belief system. These events, which the reader will have noticed so far occur in small numbers, are the ones that can have the most impact on our belief system by shifting the posterior distribution of our beliefs in one direction or another. Were this just a theoretical scenario, the law of large numbers and theories of convergence would have assured us that, although shifts like this are bound to occur, they will eventually converge to a certain stationary distribution. The reader will have discovered by this point that this is indeed not the case in daily life, and that is where the Law of Small Numbers comes into play. We are prone to bias and what we can do is only acknowledge this.

What recent advancements in AI have enabled us to do is model these shifts in belief, measure and quantify them. For this we have to thank autoencoders in particular (see <a href="#ref-autoencoders">Kingma and Welling [2013]</a> and <a href="#ref-backprop">Rumelhart et al. [1986]</a>). What these models can do is learn an informative latent space representation of human behavior (and not only), where the encoded dimensions can represent high-level concepts such as personality traits, preferences, choices, etc. It is easy to see now how large shifts in this latent space correspond to large shifts in our beliefs and preferences, which can be easily measured and quantified (through a change in gradient, for example).

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/law_of_small_numbers/latent_space.png" title="Latent space" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Figure 2: Visualization of a latent space representation where each point represents an individual's belief state. Major life events can cause significant shifts in this space, represented by large distances between points. Figure from <a href="#ref-koppe2023">Koppe [2023]</a>
</div>

It is precisely the topology of this latent space that allows us to visualize the extent to which our beliefs are distorted by our biases. What is important to mention is that the de facto latent representation created by such models is in no way interpretable by the human mind, but rather it is a tool that allows us to capture the patterns in human behavior. In practice, we use different visualization techniques to make these patterns more interpretable, such as PCA or t-SNE.

What is not fascinating from the technical perspective, but I believe to be of interest to the reader, is that the latent spaces created by such models (on a patient basis) are in no way directly comparable to each other; that is, the representation of each patient lives in a completely different space. If we are looking to compare these results, we must first employ another network that learns to map from the patient space to a common space.

### 2.3 Event probabilities are objective. Our perception is not.

Since we cannot expand on the formalisms of the notions presented in the previous section, as the length of this paper will not allow us, we now present to the reader a simpler model of probability bias estimation. This model is a simplification of the one proposed by Kahneman and Tversky in their seminal paper "Prospect Theory: An Analysis of Decision under Risk". They developed a model that incorporates psychological biases into probability estimation (which fits neatly into the Bayesian framework) to account for concepts such as loss aversion, reference dependence, and probability distortion.

Their model, which we now view as reductive, offers the first step towards integrating subjective experience, measured through empirical studies on a patient basis. Moreover, they show that although there is significant in-patient variance in probability estimation, an underlying group-level pattern emerges. This pattern can be captured and stands to show that the human brain is not as rational as we might like to believe.

{% raw %}

$$
\pi(p) = \frac{p^\gamma}{(p^\gamma + (1-p)^\gamma)^{1/\gamma}} \tag{1}
$$

*where $$p$$ is the objective probability of an outcome, $$\pi(p)$$ is the subjective probability as perceived by individuals, and $$\gamma < 1$$ regulates the curvature of the weighting function. This mathematical formulation elegantly captures how our cognitive biases systematically distort probability assessments, particularly in cases involving rare but significant events.*

{% endraw %}

<div class="row justify-content-sm-center">
    <div class="col-sm-6 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/law_of_small_numbers/sigmoid_prob.png" title="Probability weighting" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Figure 3: Probability distributions showing how subjective beliefs distort probability estimation. The function helps explain why people might prefer a certain outcome over a gamble with higher expected value but lower certainty
</div>

These findings not only show a profound bias in our probability estimation, but also demonstrate that this bias is present in both our beliefs and behavior. Taking this into consideration, it is now easier to understand why we are so prone to the Law of Small Numbers and why one should aim to nurture critical thinking and maintain a healthy dose of skepticism when drawing conclusions from rare events that occur in small numbers - that is, most events in our daily life.

### 2.4 Towards individualized modeling: a path to quantifying subjective experience

Subjective experience has been at the core of phenomenological studies, and it seems that the scientific society has come to a quiet consensus that it is exactly that: subjective. Studying it is bound to be problematic. Methodology based on language understanding of qualia has given rise to countless books, papers and even religions, but got stuck in what Wittgenstein called a language game. More statistical approaches were looked upon with suspicion, seen as an attempt to reduce the complexity of living experience to a set of equations.

In the early rise of what we today call AI, that is in the 60s and 70s, the quest of modeling human behavior was only slightly pursued, as the lack of complex hardware that could process large amounts of data was unavailable and much simpler problems, such as trying to categorize written digits for the post office, required immense amounts of computational power (for that time). The old Iron Guard of AI (and here you can count Hinton and McCulloch) would not even hint at the idea of having the computational power we have today, nor at the idea of tech conglomerates collecting millions of terabytes of data from smartphones that can be used to infer choice behavior or preferences. The rise of AI was not linear, but rather a series of events on an exponential scale (at least, up to now).

The fact that our preferences, the likelihood of our future choices and how we will react in certain situations is no longer the study of psychoanalysts (and to what results one may ask) is the reality we find ourselves in today. Today's AI models, imperfect as they are, can no longer be seen as mechanical entities that perform rigorous given instructions, but rather we should look at them in the same way we look at a microscope: a tool that allows us to extend our vision apparatus. In the same way, these models today allow us to extend our cognitive apparatus, to grasp large amounts of data that holds patterns obscured only by their complexity and, in this way, paving the first real step towards truly quantifying subjective experience (and here I mean the experience of the individual, not the collective; it is also worth mentioning that, although these complex models can infer preferences and choices, they do this in a representation that is intelligible only to the machine, not to the human, so it seems this way that we may not actually solve any qualia problems, but rather just transform them into a different form).

Humanists praise the complexity and intricacies of the human mind and its achievements, only by virtue of them being humans themselves, but it is necessary to accept that the things that make individuals capable of greatness are not the ones we initially envisioned. Large Language Models, recommendation systems and Recurrent Neural Networks have only been able to shed light on what aspects of our human cognitive abilities are indeed 'special' and not 'merely' complex. To be able to model human behavior is to be able to control it.

## 3 Life changing events: one or two digits?

Our ability to correctly estimate probabilities and intuitively understand likelihoods is fundamental to decision making. We make decisions both based on our past experience, on our beliefs, observations and what we call intuition. In Bayesian terms, we are dealing with a continuous stream of data, and our brain is constantly making estimations and updating beliefs. What we were able to show earlier is that when it comes to updating our beliefs, not only the prior probability of an event matters, but also individual subjectivity which distorts and exaggerates our beliefs, according to the biases we are most prone to possess. In certain pathological cases, this subjective component to our belief prior can be so strong that it overcomes the actual likelihood of the event.

If we were to base our rationale on the rigorous statistical framework of Bayesian inference and other general laws of statistics, we would quickly arrive at a bridging field between the two, namely Dynamical System Reconstruction. What is important to the reader in this regard is, at least, the concept of stationarity or ergodicity, which is a concept that can be traced back to Boltzmann and Gibbs, and which is the cornerstone of statistical mechanics. What ergodicity and stationarity mean is that, in a dynamical system, the time average of a variable is equal to the ensemble average of the same variable. Putting this into the context of human behavior, it means that the probability distribution of our beliefs and estimations will converge to a certain stationary distribution, which is a function of our prior beliefs and the likelihood of the events. This would make the computation and modeling of human behavior a much more straightforward and elegant matter, were it not for the simple fact that human behavior is rarely stationary and rarely ergodic. Many of the dimensions that build up our subjective experience are not ergodic, that is they do not converge to a stationary distribution, but rather they change over time in response to the environment and our past experiences. What is of interest to us in this article, is to assess the change in magnitude experienced by a certain dimension of our subjective experience in response to a certain event (and here the reader can think about traumatic events, for example).

Thus the remarkable framework of Bayesian inference, with its ability to update beliefs in a continuous stream of data, is quite limited when it comes to modeling human behavior, for the simple reason that human behavior is rarely stationary and rarely ergodic. That is not to say that certain preferences or beliefs do not converge to a certain distribution, even in an ever-changing environment, but the changes in these distributions are not as smooth as one would like them to be.

### 3.1 How a dog bite affects your YouTube recommendations

We will base our analysis on recommendation systems, which have been developed to such a great extent (as good recommendations come with increased revenue for the platform) that they can foresee what we will like before we even know it ourselves. This is no magic, but rather a result of users being unaware of how much of their data they are willingly giving away whenever they visit a website or use an app.

In this high-dimensional dataset, patterns emerge. In the same way that different people interact with different versions of ourselves, the vast amount of collected data gives the recommendation systems an upper hand: they have an almost complete picture of our preferences and choices. We will not explore the formulation behind recommendation systems in this article, but it is important that the reader is aware that the principle behind these algorithms can be used in many sectors of life, from music recommendation, to inferring political preferences or even predicting criminal behavior. It is not a lack of technology that prevents us from being able to use these algorithms in other areas, but rather a lack of economic incentive to do so or regulations.

Let us consider the simple example of a dog bite, which happened to Susan, aged 7 while she was out on her daily walk. As most girls her age, Susan never had an inherent fear toward dogs and finds them quite cute. Susan can rest assured that, as unpleasant as this event is (that is, being bitten by a dog), it will not happen many more times in her life (certainly not more than a two-digit number). Susan can also rest assured that the recommendation systems among all the apps she is using daily (for quite a long time, as children her age <a href="#ref-dog-bite">Mogus and Varga [2022]</a>) will quickly catch up and adapt to her new preferences. Is that not perhaps quite a big achievement in quantifying subjective experience? Susan may come to despise all dogs for a brief period of time, or to seek an answer to why it is she that has been bitten, and the recommendation systems will be close to follow these stages Susan is going through. Instead of feeding this confirmation bias, which is bound to increase revenue through more activity on different apps, would it not be beneficial to intervene at this point, that is to use the predictive power of recommendation systems to **control** the information that reaches Susan? Instead of feeding into her now accentuated fear of dogs, we could intervene and show her content that would help her process this experience in a healthier way, or even content that would help her process the event in a way that is more aligned with her current beliefs. That is to say, now that we have information about her subjective experience, we can use it to guide her behavior.

## 4 The end of free will?

The reader may find themselves asking: where does this leave free will? If we are now able to model and predict human behavior, quantify subjective experience, and even control it, where does free will stand? The answer comes in a subtle nuance. Predictability has never equated to determinism, and being able to compute likelihoods of decisions one may take does not make them any less free.

I believe this gives rise to a different, equally interesting perspective: the question is now not how much freedom we exercise in our decisions, but how conscious we are of our choices. Perhaps God does not play dice, but we ourselves do, as we blame on faith what we cannot consciously foresee. This is not to say that the unconscious is a deep well of ancestral secrets we need to access through deep meditations, as some earlier works would suggest. But it may well be that the unpredictability element we equate to free will is, in fact, the result of our inability to consciously know ourselves more than to a certain extent.

It is sufficient to take a look (with either amazement or stupefaction) at any modern recommendation system to realize that in them we see a glimpse of our unconscious. I will state my view that free will is not in the choices we make, but in the choices we are aware of making.

## References

<ul style="list-style: none; padding-left: 0;">
  <li id="ref-aristotle_anima" class="mb-2">Aristotle. <em>De Anima (On the Soul)</em>. Classical Text, -350. Translated from Ancient Greek.</li>
  <li id="ref-autoencoders" class="mb-2">Diederik P Kingma and Max Welling. Auto-encoding variational bayes. <em>arXiv preprint arXiv:1312.6114</em>, 2013.</li>
  <li id="ref-bayesian-brain" class="mb-2">David C. Knill and Alexandre Pouget. The bayesian brain: the role of uncertainty in neural coding and computation. <em>Trends in Neurosciences</em>.</li>
  <li id="ref-bayesian_brain" class="mb-2">David C Knill and Alexandre Pouget. The bayesian brain: the role of uncertainty in neural coding and computation. <em>Trends in Neurosciences</em>, 27(12):712–719, 2004.</li>
  <li id="ref-koppe2023" class="mb-2">Maximilian Koppe. Exploring uncertainty in machine learning: A bayesian perspective. Structures Blog, University of Heidelberg, 2023. URL <a href="https://structures.uni-heidelberg.de/blog/posts/2023_10_koppe/index.php" target="_blank"><code>https://structures.uni-heidelberg.de/blog/posts/2023_10_koppe/index.php</code></a>. Accessed: 2023.</li>
  <li id="ref-miller1956" class="mb-2">George A Miller. The magical number seven, plus or minus two: Some limits on our capacity for processing information. <em>Psychological Review</em>, 63(2):81–97, 1956.</li>
  <li id="ref-dog-bite" class="mb-2">Ana Mogus and Rahaela Varga. Children's interaction with youtube content from parental viewpoint. 05 2022.</li>
  <li id="ref-plato_phaedo" class="mb-2">Plato. <em>Phaedo</em>. Classical Text, -380. Translated from Ancient Greek.</li>
  <li id="ref-backprop" class="mb-2">David E Rumelhart, Geoffrey E Hinton, and Ronald J Williams. Learning representations by back-propagating errors. <em>Nature</em>, 323(6088):533–536, 1986.</li>
  <li id="ref-tversky1971" class="mb-2">Amos Tversky and Daniel Kahneman. Judgment under uncertainty: Heuristics and biases. <em>Science</em>, 185(4157):1124–1131, 1974.</li>
</ul>

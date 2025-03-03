---
layout: page
title: Brain Imaging Generation with Latent Diffusion Models
description: Making Brains Out of Thin Air (And lots of MRI scans) - as presented in the seminar offered by DKFZ Heidelberg WS24/25.
img: assets/img/dkfz_seminar/cover.png
importance: 1
category: uni
related_publications: true
---


<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    You can also have artistically styled 2/3 + 1/3 images, like these.
</div>

<!-- The code is simple.
Just wrap your images with `<div class="col-sm">` and place them inside `<div class="row">` (read more about the <a href="https://getbootstrap.com/docs/4.4/layout/grid/">Bootstrap Grid</a> system).
To make images responsive, add `img-fluid` class to each; for rounded corners and shadows use `rounded` and `z-depth-1` classes.
Here's the code for the last row of images above: -->



<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/cover.png" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    From the seminar Deep Learning for Medical Image Analysis - WS24/25 University of Heidelberg. Presenter: Cristi Andrei Prioteasa
</div>


{% raw %}

<!-- ```html
<div class="row justify-content-sm-center">
  <div class="col-sm-8 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
  <div class="col-sm-4 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
``` -->



Imagine if we could generate high-resolution MRI scans of the human brain—synthetic images that look just like real MRIs but without the hassle of patient data privacy issues or limited sample sizes. That’s exactly what **Latent Diffusion Models (LDMs)** are bringing to the table. Let's break it down!

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        <div class="citation">
            <p>This work is based on the research by Pinaya et al. (2022) <a href="https://arxiv.org/abs/2209.07162">"Brain Imaging Generation with Latent Diffusion Models"</a>.</p>
        </div>
    </div>
</div>


This presentation explores the generation of high-resolution MRI brain scans using **Latent Diffusion Models (LDMs)**. The study addresses challenges in medical imaging, where **data scarcity** and **privacy concerns** limit access to diverse datasets. By leveraging **generative networks** (Latent Diffusion Models),the study synthesizes realistic MRI scans conditioned on **age, sex, and brain structure volumes**.



---

## **Motivation**

Medical imaging is a goldmine for AI, but there's one major issue: **data is scarce**. This is due to several key factors.

**Privacy concerns** make sharing real patient data particularly tricky. 
**Rare pathologies** present another challenge, as some diseases simply don't appear often enough in datasets to build robust models. Additionally, **Deep Neural Networks (DNNs) are hungry**—they require vast amounts of data to perform well. 

Finally, **MRI scans are 3D and high resolution**, making them significantly more complex than standard 2D images and therefore harder to generate.

{% endraw %}



<div class="row">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/gdpr.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/rare_disease.png" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
Rare diseases an GDPR can limit the ability of data collection in the medical domain.
</div>

{% raw %}

---

To deal with this, researchers turned to **generative models**—AI models that can synthesize new data.

{% endraw %}

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/diffusion_process_intro" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   The solution proposed in the paper is to use Generative Models, in particular LDMs to generate MRI scans conditioned on covariables such as sex, age or ventricular volume.

</div>

{% raw %}

---

## **Challanges**
Reading MRIs is complex as it is, but there are other factors which impact the specialist's ability to objectively assess MRI data. The human visual apparatus is the result of millions of years of evolution and can do some incredible things, but noticing slight changes in curvature, color luminance or accurately estimating area was never one of them. Turning to AI could perhaps one day overcome these inherent limitations all humans possess by virtue of being simply that, humans.

{% endraw %}

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/weber_law.jpeg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/ranking_mri.jpeg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Human visual perception is inherently not suited for analysing small intensity changes in grayscale images, intuitevily perceiving curvatures or area, which are the defining characteristic of MRI data.
</div>

{% raw %}

How complex is actually MRI data? To make things even more complex, whereas in other downstream computer vision tasks individual pixels alone don't count for much, in this case a few voxels make the difference between a deadly pathology and a healthy individual (**this is the brain we’re talking about after all**) so high resolution is really important.

{% endraw %}

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/mri_size" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
  Number of input dimension in an MRI vs a Full HD RGB image.
</div>

{% raw %}
## **The Evolution of Generative Models**

The field of generative AI has evolved dramatically since its early days. Starting with Variational Autoencoders (VAEs) in 2013, which excelled at learning latent representations but produced notoriously blurry outputs, the field soon saw the emergence of Generative Adversarial Networks (GANs) in 2014. GANs represented a major breakthrough in AI-generated images, though they frequently encountered issues with mode collapse. The real revolution came in 2022 with Stable Diffusion, which leveraged diffusion-based approaches to take image generation capabilities to unprecedented heights. This evolution set the stage for Latent Diffusion Models (LDMs), which would go on to fundamentally transform the landscape of generative AI.

---

{% endraw %}

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/gen_ai_evolution.jpeg" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   Generative models have come a long way.

</div>

{% raw %}


### **Why Latent Diffusion?**

Traditional **Diffusion Models** add noise to an image and then train a network to recover it. But this process in pixel space is inefficient. How inefficient exactly?

{% endraw %}

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/difficult_diffusion.jpeg" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   Training a standard SOTA diffusion model is complex.

</div>

{% raw %}

 **LDMs solve this by operating in latent space** instead. This approach reduces computational redundancy since pixel space contains too much detail, encodes images more efficiently by keeping only the most important features, and allows conditioning on variables like age, sex, and brain structure volumes. By working in latent space rather than pixel space, LDMs achieve better results with less computational overhead.

 {% endraw %}

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/paper_overview.jpeg" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   Training a standard SOTA diffusion model is complex.

</div>

{% raw %}

So LDMs should make everything faster, right? Well, not exactly:
{% endraw %}

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/still_slower.jpeg" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
   The default LDM is not actually faster than older GAN based architectures.
</div>


{% raw %}

### **Denoising Diffusion Implicit Models (DDIM)**

One major issue with Diffusion Models (and LDMs for that matter) is their **slow sampling speed**. Enter **DDIM**, which replaces the traditional **stochastic sampling** with a **non-Markovian deterministic update**. This speeds up training **25x**, cutting down training time from **1000 GPU days to just 40**!

{% endraw %}

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/ddim_faster.jpeg" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/sample_time_reduction.jpeg" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
DDIM significantly speeds up training time for LDMs while maintaining high quality results.
</div>

{% raw %}

## **Results**

{% endraw %}

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/results1.jpeg" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/results2.jpeg" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/dkfz_seminar/results4.jpeg" title="start image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
Results todo
</div>

{% raw %}

## Dataset

| Dataset Property | Description |
|-----------------|-------------|
| Image Type | **T1-weighted MRI images** sourced from the **UK Biobank (UKB)** dataset |
| Population | **Healthy individuals** with an average age of **63.6 ± 7.5 years** |
| Registration | Images are **registered to a common MNI space** for consistency |
| Resolution | **160x224x160 voxels** with **1mm³ voxel size** |

## Evaluation Metrics
- **Fréchet Inception Distance (FID):** Measures image quality.
- **Multi-Scale Structural Similarity Index (MS-SSIM):** Measures diversity.
- **Four-Grained Reference SSIM (4-G-R-SSIM):** Further evaluates diversity.

## Key Findings
- **Latent Diffusion Models (LDMs) achieve state-of-the-art MRI synthesis.**
- **DDIM significantly reduces inference time** while maintaining high fidelity.
- **Synthetic images conditioned on age, sex, and brain volumes** exhibit realism comparable to real MRIs.
- The generated dataset has been **released to the public**.

## Challenges & Limitations
- **Training dataset contains only healthy individuals**, limiting generalization to diseased populations. Moreover the average age of the training set is 63.6, further limiting the model's ability.
- **High memory requirements** for training diffusion models.
- **Semantic understanding of covariates remains complex.**


## References
- [Lilian Weng’s Blog on Diffusion Models](https://lilianweng.github.io/posts/2021-07-11-diffusion-models/)
- [Stable Diffusion Explained](https://medium.com/@steinsfu/stable-diffusion-clearly-explained-ed008044e07e)
- [UK Biobank MRI Dataset](https://www.ukbiobank.ac.uk/)

---

This project was presented at **MICCAI 2022** by **Pinaya, Tudosiu, Dafflon et al.**



{% endraw %}

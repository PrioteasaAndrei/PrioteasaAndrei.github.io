---
layout: page
title: "Explainability in Image Recognition vs. HAR problem"
description: From Saliency Maps and grad-CAM in Image Recognition to an adaptation of grad-CAM for skeleton-based Human Action Recognition (ResGCNv2.0 on NTU RGB+D) - as presented at the UPB Academic Scientific Student Conference 2023. Full paper PDF linked on the page.
img: assets/img/explainability_har/gradcam_bias.jpg
importance: 3
category: uni
---

<p style="text-align: center;">
  Cristi Andrei Prioteasa &amp; As. Drd. Ing. Mihai Nan<br>
  Faculty of Automatic Control and Computer Science<br>
  University Politehnica of Bucharest<br>
  2023
</p>

<p style="text-align: center;">
  <a href="{{ '/assets/pdf/explainability_har_upb.pdf' | relative_url }}" target="_blank" class="btn btn-sm z-depth-0" role="button"><i class="fa-solid fa-file-pdf"></i> Download PDF</a>
</p>

<p style="text-align: center;"><em>This work was later extended into my Bachelor's thesis, "Explainability Methods in Human Action Recognition based on Skeletal Joint Data" (<a href="{{ '/assets/pdf/bachelor_thesis.pdf' | relative_url }}" target="_blank">PDF</a>).</em></p>

## Abstract

With the ever-increasing presence of Artificial Intelligence based systems in many critical parts of our society, such as the Healthcare Industry, Finance, or Education, there has been a growing interest towards creating ways to gain insight into how these systems work, in order to build trust and diagnose failure modes. This has proven to be a challenging task in the case of Deep Learning Architecture, because of their inherent "black-box" nature, massive number of parameters and lack of transparency. In this paper we present state-of-the-art visualization techniques for Image Recognition i.e., Class Activation Mapping <a href="#ref-3">[3]</a> and Gradient-Weighted Class Activation Maps <a href="#ref-2">[2]</a> and propose an adaptation of grad-CAM for the problem of Human Action Recognition based on skeletal joints. We test our proposed method on the NTU RGB+D 60 and 120 datasets using a ResGCNv2.0 architecture.

*Index Terms — Explainability, HAR, CAM, grad-CAM, Saliency Maps, Guided Backpropagation*

## I. Introduction

Before the shift towards black box models used today, such as Artificial Neural Networks or Deep Neural Networks, which offer little to no explanation for their decision process, the AI research in the late 1970s was oriented towards rule-based expert systems. These were systems that would follow precise rules according to some criterion, but never attained expert-level performance <a href="#ref-4">[4]</a>. Peter J. Denning and John Arquilla <a href="#ref-5">[5]</a> conclude that this type of failure is bound to happen because humans do not use known rules to guide their actions and, moreover, in many cases the actions they take cannot be described by any rule. Since then, the widely-accepted AI model has become some variation of Neural Network, which outperforms the older rule-based systems, but lacks in interpretability. The lack of transparency in today's ubiquitous Deep Neural Networks can generate hard to diagnose problems. When these systems fail, they usually do so without a warning or explanation. A good example for the need of an explainable model is described in the work of Kaufman et al. <a href="#ref-6">[6]</a>. They discovered that, in a model designed for medical diagnosis, there was a heavy correlation between the target class and the patient's ID (Data leakage). Such an issue is considerably hard to identify just by looking at the predictions and the raw training data, but would be relatively easy to diagnose using an interpretable model, which would suggest that its decision process was influenced by the patient's ID.

Selvaraju et al. <a href="#ref-2">[2]</a> illustrate how their technique, called grad-CAM, can be used in the context of CNNs to identify biased models. Grad-CAM visualizations revealed that a model trained to distinguish between doctors and nurses learned to look at a person's face and hairstyle in order to determine the correct class, thus promoting a gender stereotype. Through the intuition gained from this visualization technique, they identified that the dataset was gender-biased (78% of images with doctors were men and 93% of images with nurses were women <a href="#ref-2">[2]</a>). By correcting the dataset they were able to obtain an 8% increase in accuracy, but, most importantly, they were able to guarantee fair and ethical outcomes for the model.

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/explainability_har/gradcam_bias.jpg" title="Grad-CAM for biased vs unbiased model" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Fig. 1. The visualization provided by grad-CAM is able to show that the biased model is looking at the person's face in order to distinguish between a doctor and a nurse, thus promoting a gender-bias, while the unbiased model looks at the coat and the stethoscope. Extracted from <a href="#ref-2">[2]</a>.
</div>

Human-Action Recognition has been a long-standing important research direction in Computer Vision. Due to the availability of affordable commercial sensors for estimating human skeletons and the remarkable evolution of computing devices, especially GPUs, there is a growing interest in developing new models which can address problems such as Patient Analysis, Vide Indexing or Security Surveillance. Skeleton data has become the widely accepted mode of representation for Human Action Recognition due to its simplicity, its ability to capture the motor behavior and dynamics of real persons and memory efficiency. Skeleton data captures the trajectories of human skeleton joints and is both view and illumination invariant. Nevertheless, HAR remains a hard to solve problem, because of its many degrees of freedom, action, and subject flexibility. We propose a way to adapt grad-CAM for the HAR problem based on Skeletal Data and use this insight to determine the focus attributed by the model to the spatial and the temporal component.

## II. Related Work

In this chapter, we summarize the key concepts of Convolutional Neural Networks and transition towards methods of visualization. We explore the simple intuition behind Saliency Maps and transition towards two state-of-the-art methods: Class Activation Mapping and Graident-Weighted Class Activation Mapping. We will later use the intuition gained from analyzing grad-CAM in order to propose our solution for visualizations in the context of Skeleton-Based Action Recognition.

### A. CNNs for visual classification

Convolutional neural networks became the widely accepted choice for any visual classification tasks due to their remarkable ability to capture high-level semantic concepts in an image. They achieve this through a series of hierarchical layers. Studies such as those of Hubel & Wiesel <a href="#ref-7">[7]</a> in 1968 and, more recent, Michael A. Silver et al. <a href="#ref-8">[8]</a> show that the human brain employs a similar hierarchical structure when processing visual stimuli: simple cells respond to light orientation, while more complex cells respond to movement with respect to an end-point. Moreover, nearby cells in the cortex are responsible for nearby regions in the visual field. Although the biological neuron analogy should be utilized cautiously, this stands to show that developing a model that resembles the cognitive process of the human brain is remarkably powerful.

### B. Gradient-based approaches: Saliency maps

Since gradients play a key-role in the learning process through backpropagation it is only natural that they should offer an insight on the model's decision. Simonyan et al. <a href="#ref-9">[9]</a> introduced one of the first approaches for visualizing gradients in a Visual Task based on CNNs: Saliency maps. The idea behind saliency maps is to use the gradient of the loss function with respect to the input pixels and map it on the original image. The pixels which have a large absolute value for the gradient at that location are those which, when slightly perturbed, affect the class score significantly. In this way, we create a heatmap which shows the importance attributed to each pixel of the original image in the prediction process.

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/explainability_har/saliency_pug.jpg" title="Saliency heatmap" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Fig. 2. Saliency heatmap for the target class "Mops".
</div>

Since in the backpropagation process, the gradients carry information about the target class and all the counterfactual classes (i.e., the classes that decrease the confidence of the model in predicting the target class), in their standard formulation saliency maps are often incomprehensible, an improvement called Guided-Backpropagation has been proposed, that restricts the backpropagation of the gradients through the ReLU activation function only to the activations that have positive influence on the output. With this simple improvement, Guided-Backpropagation is able to create more interpretable representations of the decision process. More importantly, Guided-Backpropagation is model-agnostic, i.e., works with any type of convolutional architecture.

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/explainability_har/guided_backprop.png" title="Vanilla vs Guided-Backpropagation" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Fig. 3. Vanilla vs Guided-Backpropagation. Guided-Backpropagation offers a more interpretable heatmap that distinguishes general characteristics of a dog: ear shape, eye position etc.
</div>

### C. Activation-based approaches: CAM and Grad-CAM

CAM and Grad-CAM aim to solve the shortcomings of saliency maps. Proposed by Zhou et al. <a href="#ref-3">[3]</a>, CAM are class-discriminative saliency maps, which are able to illustrate with high resolution discriminative image regions used by the network to predict that class. The idea behind CAM is to use a weighted sum of the feature maps of the last convolutional layer in order to compute the activation $$F_c$$ for class $$c$$ (Figure 4):

{% raw %}

$$
F_c = w^c_1 A_1 + w^c_2 A_2 + \dots + w^c_n A_n
$$

{% endraw %}

The solution for CAM first proposed by Zhou et al. <a href="#ref-3">[3]</a> requires the training of an additional linear model to learn the weights for each activation map and a Global Average Pooling before the final Classification Module. In the case of grad-CAM, the new weights are calculated based on the gradients (thus, a forward and a backward pass are required). Grad-CAM represents a strict generalization of CAM and is model-agnostic. Grad-CAM also provides counter-factual explanations for Object Detection, as well as Object Localization, although being trained only on image-level labels (Figure 8).

<div class="row justify-content-sm-center">
    <div class="col-sm-10 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/explainability_har/cam_diagram.jpg" title="Class Activation Mapping" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Fig. 4. The predicted class score is back propagated to the last convolutional layer to generate the activation maps. For a specific class, the activation map represents a weighted sum of visual patterns at different spatial locations. Extracted from <a href="#ref-3">[3]</a>.
</div>

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/explainability_har/counterfactual.jpg" title="Counterfactual explanation" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Fig. 5. Counterfactual explanation generated by grad-CAM in an AlexNet architecture for target class Siamese Cat and Italian Gray hound.
</div>

## III. Proposed Solution

In this section we describe our proposed solution which uses an adaptation of Class Activation Mapping for the problem of Human Action Recognition. Since the input data is now a set of skeletal joints, we formulate a way to use the gradients propagated into some of the last convolutional layers (since they offer the best trade-off between localization and concept discovery) and the activation of these layers to create a weighted activation map which will highlight the key joints implicated in each type of action at each frame moment. We then test our proposed method on different layers of a ResGCN v2.0 architecture <a href="#ref-10">[10]</a> and present the obtained results.

### A. Skeletal Data

Although Class Activation Maps <a href="#ref-2">[2]</a> have been designed to work on image inputs, we can use the underlying concept for the HAR problem with some slight modifications. The first intuitive step is to take the activation maps generated just before the Classification Module of the ResGCN v2.0 architecture and compute a weighted sum with the learned weights of the FC layer. Thus, the learned weights of the FC layer have a shape of (60, 128) for the NTU RGB+D 60 dataset and (120, 128) for the NTU RGB+D 120 dataset. The activation maps generated just before the Classification module have the shape (4, 128, 72, 25, 2). The first and last dimension represent the batch and the number of skeletons in the video, respectively. For simplicity, we will ignore them for now, but the computation holds, nevertheless, with the batch and number of skeletons dimensions. We perform a weighted sum on the common dimension of length 128 (i.e., a tensor contraction, using Einstein notation: (kc,ctvm-ktvm) or ((kc,ctv-ktv) for single person actions) and we are left with a tensor of size (60, 72, 25) (or (120, 72, 25) for the NTU RGB+D 120 dataset) which represent the Class Activation Maps for all the classes. Since we are only interested in the activation maps for the target class, we index this tensor after the first dimension.

### B. Interpolating the missing frames

Since the resulted Class Activation Maps don't offer the direct influence of each joint over each frame of the original input, but rather a time-focused interpretation of the most important joints, we interpolate the missing values to reach the size of the input. Depending on the used interpolation (and how strong its smoothing effect is), we obtain a more time-focused visualization (which highlights the exact key frames and joints) or a more smoothed version which loses time localization, but better illustrates the spatial influence of each joint.

<div class="row justify-content-sm-center">
    <div class="col-sm-6 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/explainability_har/interp_before.png" title="Before interpolation" class="img-fluid rounded z-depth-1" %}
        <div class="caption">(a) Time influence of right hand shoulder joint before interpolation</div>
    </div>
    <div class="col-sm-6 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/explainability_har/interp_after.png" title="After interpolation" class="img-fluid rounded z-depth-1" %}
        <div class="caption">(b) Time influence of right hand shoulder joint after interpolation</div>
    </div>
</div>
<div class="caption">
    Fig. 6. The exact temporal localization is lost after the interpolation, but we obtain a visualization which captures the influence of each joint over a smoother interval of time.
</div>

### C. Using different target convolutional layers

We test our proposed solution on different layers of the ResGCNv2.0 architecture. For our first visualization, We use the activation maps from the last convolutional layer of the attention layer and the gradients corresponding to the target class flowing back from the classification module. For our second test, we test deeper layers of the Temporal SG Layer, respectively, both the depth convolutions. We expect the grad-CAM activation maps generated by the deeper convolutional layer to have better spatial localization.

## IV. Results

The generated visualization seem to indicate that a there is a higher spatial localization when using a deeper convolutional layer as the target for our visualization technique. Nevertheless, more research should be conducted before drawing a conclusion.

In future work, we will test with a more comprehensive experiment the spatial localization capabilities of earlier layers in the ResGCNv2.0 architecture.

<div class="row justify-content-sm-center">
    <div class="col-sm-12 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/explainability_har/skeleton_last_layer.png" title="grad-CAM on the last convolutional layer" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Fig. 7. Visualization created by grad-CAM using the last convolutional layer of a ResGCNv2.0 architecture as target. The red joints represent the most influential points in performing the action: drinking water.
</div>

<div class="row justify-content-sm-center">
    <div class="col-sm-12 mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/explainability_har/skeleton_deeper_layer.png" title="grad-CAM on a deeper convolutional layer" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Fig. 8. Visualization created by grad-CAM using a deeper convolutional layer of a ResGCNv2.0 architecture as target. The red joints represent the most influential points in performing the action: drinking water.
</div>

## Acknowledgment

This paper was prepared for the Academic Scientific Student Conference of 2023 held by University Politehnica of Bucharest.

## References

<ul style="list-style: none; padding-left: 0;">
  <li id="ref-1" class="mb-2">[1] G. Eason, B. Noble, and I. N. Sneddon, "On certain integrals of Lipschitz-Hankel type involving products of Bessel functions," <em>Phil. Trans. Roy. Soc. London</em>, vol. A247, pp. 529–551, April 1955.</li>
  <li id="ref-2" class="mb-2">[2] R. R. Selvaraju, M. Cogswell, A. Das, R. Vedantam, D. Parikh and D. Batra, 'Grad-CAM: Visual explanations from deep networks via gradient-based localization', <em>International Journal of Computer Vision</em>, vol. 128, no. 2, pp. 336–359, 2019. doi: 10.1007/s11263-019-01228-7.</li>
  <li id="ref-3" class="mb-2">[3] B. Zhou, A. Khosla, L. A., A. Oliva and A. Torralba, 'Learning Deep Features for Discriminative Localization.', <em>CVPR</em>, 2016.</li>
  <li id="ref-4" class="mb-2">[4] H. L. Dreyfus, <em>What Computers Cannot Do</em>. MIT Press, 1992, isbn: 9780262540674.</li>
  <li id="ref-5" class="mb-2">[5] P. J. Denning and J. Arquilla, 'The context problem in artificial intelligence', <em>Commun. ACM</em>, vol. 65, no. 12, 18–21, 2022, issn: 0001-0782. doi: 10.1145/3567605. [Online]. Available: <a href="https://doi.org/10.1145/3567605" target="_blank">https://doi.org/10.1145/3567605</a>.</li>
  <li id="ref-6" class="mb-2">[6] S. Kaufman, S. Rosset and C. Perlich, 'Leakage in data mining: Formulation, detection, and avoidance', vol. 6, Jan. 2011, pp. 556–563. doi: 10.1145/2020408.2020496.</li>
  <li id="ref-7" class="mb-2">[7] D. H. Hubel and T. N. Wiesel, 'Receptive fields, binocular interaction and functional architecture in the cat's visual cortex', <em>The Journal of Physiology</em>, vol. 160, 1962.</li>
  <li id="ref-8" class="mb-2">[8] M. A. Silver and S. Kastner, 'Topographic maps in human frontal and parietal cortex', <em>Trends in Cognitive Sciences</em>, vol. 13, no. 11, pp. 488–495, 2009, issn: 1364-6613. doi: https://doi.org/10.1016/j.tics.2009.08.005. [Online]. Available: <a href="https://www.sciencedirect.com/science/article/pii/S1364661309001739" target="_blank">https://www.sciencedirect.com/science/article/pii/S1364661309001739</a></li>
  <li id="ref-9" class="mb-2">[9] K. Simonyan, A. Vedaldi and A. Zisserman, <em>Deep inside convolutional networks: Visualising image classific- ation models and saliency maps</em>, 2014. arXiv: 1312.6034 [cs.CV]</li>
  <li id="ref-10" class="mb-2">[10] Song, Yi-Fan and Zhang, Zhang and Shan, Caifeng and Wang, Liang, <em>Stronger, Faster and More Explainable: A Graph Convolutional Baseline for Skeleton-Based Action Recognition</em></li>
</ul>

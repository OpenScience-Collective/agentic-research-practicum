# DeepGaze II: Reading fixations from deep features trained on object recognition

# DeepGaze II: Reading fixations from deep features trained on object recognition

Matthias Kümmerer Thomas S. A. Wallis
Matthias Bethge

###### Abstract

Here we present DeepGaze II, a model that predicts where people look in images. The model uses the features from the VGG-19 deep neural network trained to identify objects in images. Contrary to other saliency models that use deep features, here we use the VGG features for saliency prediction with no additional fine-tuning (rather, a few readout layers are trained on top of the VGG features to predict saliency). The model is therefore a strong test of transfer learning. After conservative cross-validation, DeepGaze II explains about 87% of the explainable information gain in the patterns of fixations and achieves top performance in area under the curve metrics on the MIT300 hold-out benchmark. These results corroborate the finding from DeepGaze I (which explained 56% of the explainable information gain), that deep features trained on object recognition provide a versatile feature space for performing related visual tasks. We explore the factors that contribute to this success and present several informative image examples. A web service is available to compute model predictions at http://deepgaze.bethgelab.org.

## 1 Introduction

Humans and other animals with foveated visual systems make several eye movements per second, bringing their high-resolution fovea to bear on things they want to see. Understanding the factors that guide eye movements is therefore an important component of understanding behaviour. One problem that has received significant attention is that of predicting fixation locations given the image the observer is viewing (usually in a free-viewing paradigm). Here we term this problem saliency prediction, in keeping with the computer vision literature .

The state-of-the-art in saliency prediction improved markedly since 2014 with the advent of models using deep neural networks. The first of these mod

---

els *(Vig et al., 2014)* trained deep neural networks on the task of saliency prediction. We subsequently boosted performance significantly above EDN in our model DeepGaze I *(Kümmerer et al., 2015)*, by using pretrained features (taken from AlexNet *Krizhevsky et al. (2012)*) trained on the ImageNet object recognition benchmark. This is therefore an example of transfer learning, where features learned on one task are re-used for a second task (with or without fine-tuning). The success of this approach is exciting because it implies that the features learned by deep neural networks on ImageNet have abstracted generalisable information from images. The transfer learning paradigm seems to be particularly important for saliency prediction because typical saliency datasets are relatively small—a few thousand images with fixations in the hundreds per image—making learning of deep neural networks from scratch *(Vig et al., 2014)* relatively unconstrained.

Since DeepGaze I, a variety of new models also apply transfer learning approaches using deep features. In contrast to DeepGaze I, which uses AlexNet, the SALICON model *(Huang et al., 2015)*, DeepFix *(Kruthiventi et al., 2015)* and PDP *(Jetley et al., 2016)* use the better-performing VGG-19 network *(Simonyan and Zisserman, 2014)*, whose features are retrained on saliency prediction using the SALICON dataset then fine-tuned on the MIT1003 dataset. SALICON and DeepFix substantially improved performance over DeepGaze I in the MIT benchmark (MIT Saliency Benchmark; see below). The scale of this improvement could suggest that retraining deep features is crucial for further performance improvement, or it could suggest that the VGG features themselves (which significantly outperform AlexNet for object recognition) provide a better feature space for saliency prediction irrespective of retraining. In this paper we show the latter is the case.

Here, we introduce DeepGaze II. Relative to DeepGaze I, it uses the VGG-19 pretrained network and pretraining on the SALICON dataset. In addition, rather than using a linear predictor, DeepGaze II uses a pointwise nonlinear combination of deep features. Two additional crucial distinctions between DeepGaze II and the models discussed above (SALICON, DeepFix and PDP) are that we train our model in a probabilistic framework optimising the log-likelihood *(Kümmerer et al., 2015)*, and that we do not re-train the VGG features themselves. DeepGaze II (as for DeepGaze I) also models the centre bias as an explicit prior.

## 2 Methods

### 2.1 Model

As for DeepGaze I, we formulate DeepGaze II as a probabilistic model. Building on previous work applying probabilistic modelling to fixation prediction *(Vincent et al., 2009; Barthelmé et al., 2013)*, we have recently shown that formulating existing models appropriately can remove most of the inconsistencies between existing model evaluation metrics *(Kümmerer et al., 2015)*. Furthermore, we

---

![img-0.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-1.jpg)
Figure 1: The architecture of DeepGaze II. The activations of a subset of the VGG feature maps for a given image are passed to a second neural network (the readout network) consisting of four layers of  $1 \times 1$  convolutions. The parameters of VGG are held fixed through training (only the readout network learns about saliency prediction). This results in a final saliency map, which is then blurred, combined with a centre bias and converted into a probability distribution by means of a softmax.

---

argued that using log-likelihood (the standard way to compare probabilistic models) as an evaluation criteria represented a useful and intuitive loss function for model evaluation with close ties to information theory (though other loss functions may have advantages for certain use cases *(Vig et al. 2014)*. Here, we train and evaluate DeepGaze II using the framework of log-likelihood (specifically reported as information gain explained, see [Kümmerer et al. 2015]) for our in-house tests, and present key metrics from the MIT benchmark (AUC, shuffled AUC).

The architecture of DeepGaze II is visualized in 2.1. The image in question is (possibly after resizing, see below) given as input to the VGG-19 network, from which all fully-connected layers have been removed and for which all filters have been rescaled to yield feature maps with unit variance over the imagenet dataset *(Gatys et al. 2015)*. After processing the image in VGG, the feature maps of a selection of layers (conv5_1, relu5_1, relu5_2, conv5_3, relu5_4; selected via random search) are rescaled and cropped to match an earlier layer (conv2_1 in our implementation). This rescaling is necessary to equate the sizes of the feature maps from different layers; conv2_1 is chosen such that spatial resolution is sufficient for precise prediction but computation time is reduced. Matching here means that we identify a pixel in the output of a convolution with the center of its receptive field in its input layer.

After rescaling and cropping, these feature maps have the same size and can be combined into one 3-dimensional tensor (with $5\times 512$ channels) which is used as input for a second neural network (called the *readout network*) in the following. This readout network consists of four layers of 1x1 convolutions followed by ReLu nonlinearities. Therefore, the readout network is only able to represent a *pointwise* nonlinearity in the VGG features. The first three layers use 16, 32, and 2 features. The last layer has only one output channel $O(x,y)$. This final output from the readout network is convolved with a Gaussian to regularize the predictions:

$S(x,y)=O(x,y)\star G_{\sigma}$

Fixations tend to be near to the center of the image in a way which is strongly task and dataset dependent *(Tatler 2007)*. Therefore it is important to model this center bias and do so in a way that allows easy substitution of other centre biases (e.g. depending on the task). We do so by explicitly modelling the center bias as a prior distribution that is added to $S$:

$S^{\prime}(x,y)=S(x,y)+\log p_{\text{baseline}}(x,y)$

$S^{\prime}(x,y)$ is finally converted into a probability distribution over the image by the means of a softmax (as for DeepGaze I):

$p(x,y)=\frac{\exp(S^{\prime}(x,y))}{\sum_{x,y}\exp(S^{\prime}(x,y))}$

In implementing DeepGaze II, we use a caffe *(Jia et al. 2014)* implementation for the VGG; all other parts of the model are implemented in Lasagne and Theano *(Al-Rfou et al. 2016)*.

# #

---

![img-1.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-2.jpg)
Figure 2: Training and crossvalidation procedure of the readout network used for DeepGaze II. In the pretraining phase, the model is trained on the 10000 images of the SALICON dataset using the 1003 images from the MIT1003 as a stopping criterion. In the fine-tuning phase, ten models are trained (starting from the pretrained model), each on  $90\%$  of the MIT1003 data for training and a unique  $10\%$  for stopping (10-fold crossvalidation). In our evaluation (reported below), for each image we use the model predictions from the model that did not use that image in training. The final model evaluation is performed via the MIT benchmark on the held-out MIT300 dataset, based on a mixture of the ten models from the fine-tuning stage.

# 2.2 Training

DeepGaze II is trained using maximum likelihood learning (see Kümmerer et al. 2015 for an extensive discussion of why log-likelihoods are a meaningful metric for saliency modelling). If  $p(x,y\mid I)$  denotes the probability distribution over  $x$  and  $y$  predicted by DeepGaze II for an image  $I$ , the log-likelihood of a dataset is

$$
\frac{1}{N} \sum_ {i} \log p (x _ {i}, y _ {i} | I _ {i}),
$$

for fixations at locations  $(x_{i},y_{i})$  in the image  $I_{i}$ . This loss function depends on the parameters of the readout network and the kernel size of the Gaussian used to regularize the prediction (note that it also depends on the parameters of VGG, but we do not retrain them). As it also is differentiable in these parameters, of-the-shelf optimization techniques can be used to optimize the loss. Here we use the Sum-of-Functions-Optimizer (SFO, Sohl-Dickstein et al. 2013), a minibatch-based version of L-BFGS. The full training procedure consists of multiple phases and is visualized in 2.2.

In the pretraining phase, the readout network is initialized with random weights and trained on the SALICON dataset (Jiang et al. 2015). This dataset consists of 10000 images with pseudofixations from a mouse-contingent task and has proven to be very useful for pretraining saliency models (Huang et al. 2015; Kruthiventi et al. 2015; Jetley et al. 2016). All images are downsampled by a

---

factor of two. We use 100 images per mini-batch for the SFO.

The MIT1003 dataset is used to determine when to stop the training process. After each iteration over the whole dataset (one epoch) we calculate the performance of the model on the MIT1003 (test) dataset. We wish to stop training when the test performance starts to decrease (due to overfitting). We determine this point by comparing the performance from the last three epochs to the performance five epochs before those. Training runs for at least 20 epochs, and is terminated if all three of the last epochs show decreased performance or if 800 epochs are reached. As it is more expensive to use images of many different sizes, we resized all images from the MIT1003 dataset to either a size of $1024\times 768$ or $768\times 1024$ depending on their aspect ratio, before downsampling by a factor of two.

After pretraining, the model is fine-tuned on the MIT1003 dataset. As DeepGaze I showed that overfitting to images is in fact a much larger problem than overfitting to subjects, DeepGaze II is crossvalidated over images: the images from the dataset are randomly split into 10 parts of equal size. Then ten models are trained starting from the result of the pretraining, each one using 9 of the ten parts for training and the remaining part for the stopping criterion (following the stopping criteria as above). We use 10 images per mini-batch in the SFO.

When evaluating on any dataset but the MIT1003 dataset, we use a mixture of these ten models. This holds specifically for the MIT300 dataset from the MIT Saliency Benchmark. When evaluating on the MIT1003 dataset for our in-house analyses, for each image we use the model which has not been trained using this image.

## 3 Results

How well does the DeepGaze II model perform on saliency prediction relative to other saliency models? We first consider this from the standpoint of information theory (information gain explained) evaluated on a subset of the MIT1003 dataset (as used in *Kümmerer et al. (2015); Kümmerer et al. (2015)*), and second present results from the MIT saliency benchmark website on the held-out MIT300 set.

### 3.1 Information gain explained

In [Kümmerer et al. 2015], we described the calculation of information gain explained (an intuitive transformation of log-likelihood). Information gain tells us what the model knows about the data beyond the baseline model, which here is the image-independent centre bias, expressed in bits / fixation:

| $IG(\hat{p}\ | p_{\text{baseline}})=\sum_{i}\log\hat{p}(x_{i},y_{i} | I_{i})-\log p_{\text{baseline}}(x_{i},y_{i})$ |

---

$p_{{\rm baseline}}(x,y)=\frac{1}{2}\sum_{{i=1}}^{{N}}p_{i}(x,y)p_{{\rm
baseline}}(x,y),$ (1)

where $p_{{\rm gold}}(x,y)$ is the density of the model at location $(x,y)$ when viewing image $I$, and $p_{{\rm baseline}}$ is the density of the baseline model. Information gain explained relates the model’s information gain to the gold standard (crossvalidated prediction of all subjects from all other subjects—sometimes called the “empirical saliency map”) information gain. It is the proportion of the gold standard information gain accounted for by the model.

| $\frac{IG(p |  | p_{{\rm baseline}})}{IG(p_{{\rm gold}} |  | p_{{\rm baseline}})}$ |

where $p_{{\rm gold}}$ is the density of the gold standard model.

To remain consistent with our previously published work *(Kümmerer et al., 2015; Kümmerer et al., 2015)*, we evaluate DeepGaze II on a subset of the MIT1003 dataset consisting of all images of size $1024\times 786$ ($N = 463$). For each image in this set, there is exactly one model from the fine-tuning crossvalidation procedure that did not use that image for training. We use the density from this model for evaluation. This means we are reporting test performance, crossvalidated over images, as opposed to training performance.

The gold standard model is essentially a Gaussian kernel density estimate that predicts one subject’s fixations for a given image from the fixations of all other subjects. That is, the gold standard model is an image-specific prediction crossvalidated over subjects, and as for the models we report test not training performance.

Figure 3 shows the information gain explained for DeepGaze II against that for DeepGaze I and the models evaluated in [Kümmerer et al. 2015]. DeepGaze II accounts for 87% of the explainable information gain, a substantial improvement from DeepGaze I’s 56%, and begins to approach the upper limit (according to the gold standard) of performance in saliency prediction. Note that we currently do not include models that improved on DeepGaze I on the MIT benchmark (SALICON, DeepFix and PDP) in this evaluation because the code for these models is not publically available.

We can also evaluate candidate models according to their performance relative to the gold standard for each image in the dataset (Figure 3.1). Here, one can see that the AIM, eDN and DeepGaze I model predictions fall largely below the gold standard, and all include a number of images with negative information gain (meaning that the models make worse predictions than the baseline for those images). DeepGaze II clusters much closer to the gold standard predictions (diagonal line) and there are no images for which its prediction is worse than the baseline. Note that it is possible to have images for which the model prediction is *better* than the gold standard. There can be at least two reasons for this: first, it can be that fixations cluster in smaller areas than predicted by the gold standard (recall that the gold standard kernel size is learned over all images); second, there could be subjects who are inconsistent relative to other subjects but still look at areas that a model can predict. In this case the gold standard model performs poorly when predicting that subject relative to the model (recall that the gold standard performances are test performances).

---

![img-2.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-3.jpg)
Figure 3: Model performance (information gain explained as a percentage of the gold standard model's information gain relative to the baseline model) for a selection of models from the MIT Benchmark, DeepGaze I and DeepGaze II. The eDN model (state-of-the-art in 2014) explained  $34\%$  of the explainable information gain, and DeepGaze I explains  $56\%$ . DeepGaze II gains a substantial improvement over DeepGaze I, explaining  $87\%$  of the explainable information in the evaluation set.

![img-3.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-4.jpg)

![img-4.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-5.jpg)

![img-5.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-6.jpg)
Figure 4: Gold standard information gain against model information gain relative to the baseline model, for AIM, eDN, DeepGaze I and DeepGaze II. Each point is an image in the subset of the MIT1003 dataset used for evaluation. DeepGaze II is highly correlated with the gold standard, and is the only model for which no images show negative information gain (i.e. for which the model's prediction is worse than the pure centre bias).

![img-6.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-7.jpg)

---

| Model | AUC | sAUC |
| --- | --- | --- |
| DeepGaze II | 88% | 77% |
| SALICON | 87% | 74% |
| DeepFix | 87% | 71% |
| DeepGaze I | 84% | 66% |

Table 1: DeepGaze II performance in the MIT Saliency Benchmark. DeepGaze II reaches top performance in both AUC and sAUC. Note that we use saliency maps without center bias for the sAUC result (see text for more details).

# 3.2 MIT saliency benchmark

The area under the ROC curve (AUC) metric expects saliency maps to include the centre bias, whereas shuffled AUC expects models to exclude the centre bias (Barthelmé et al. 2013; Kümmerer et al. 2015). Because the DeepGaze II architecture makes it trivial to include or exclude the centre bias into the model prediction, we submitted two sets of saliency maps to the MIT benchmark: one uses the centre bias trained on the MIT1003 dataset, the other uses a uniform centre bias. In addition, because the MIT Benchmark requires submission of model predictions as JPEG images, we quantised the log density for each image into 256 values such that each value receives the same number of pixels.

Table 3.2 reports the results of evaluating DeepGaze II on the MIT saliency benchmark (the held-out MIT 300 set). DeepGaze II beats the nearest competitors SALICON and DeepFix by one percent. For shuffled AUC, DeepGaze II beats the nearest competitors by a larger margin (note that this could be due in part to those models not excluding centre biases).

# 3.3 Model prediction examples

Figure 5 shows the three images for which DeepGaze II explained the most of the explainable information gain in the patterns of fixations, and Figure 6 shows the worst. For visualising probability densities, we include three contour lines which together divide the map into four regions. Each region has the same probability mass: that is, the model expects each area to receive the same number of fixations on average. If the dark areas are very concentrated, then the model expects a small area to receive most of the fixations. In addition, for each image we sample from each model to obtain the same number of fixations as for the ground truth fixations. Sampling is straightforward because the density predicted by the model is a multinomial distribution over the pixels. This allows an intuitive comparison of model and data. Note that both of these analysis approaches are only possible using a probabilistic model.

Some interesting patterns to consider include the first image in Figure 6, which is a photograph of a bakery shopfront. Humans fixate on the baked goods (which DeepGaze II captures) and on the store logo imprinted on the window in the upper right of the image (which DeepGaze II fails to capture, presumably

---

![img-7.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-8.jpg)
Figure 5: The three images for which DeepGaze II had the highest information gain explained. For each unique image, the leftmost column shows the image itself (top) and the empirical fixations (bottom). The remaining columns show model predictions for the gold standard model, DeepGaze II, DeepGaze I and the eDN model respectively. The top row visualises probability densities, in which contour lines divide the images into four regions, each of which is expected to receive equal numbers of fixations. The bottom row shows fixations sampled from the model (see text for details). Sampled fixations can be compared to the empirical fixations to gain additional insight into model performance.

---

![img-8.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-9.jpg)
Figure 6: The three images for which DeepGaze II had the lowest information gain explained.

---

![img-9.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-10.jpg)
Figure 7: The contribution of the primary changes from DeepGaze I to DeepGaze II in terms of improving information gain explained. The most important contributions to the improvement are using VGG features and pre-training on the SALICON dataset.

because it does not detect the low-contrast, partially-occluded text). For the third image of Figure 6, people fixate on the signage above the storefront, which in the image is distorted by perspective projection. Both DeepGaze I and II appear to miss this text. This might be because both the VGG and AlexNet fail to provide features sensitive to such distorted text, or because distorted text is so rare in the training set that the contributions of these features are downweighted by our training procedure. In either case, these two examples highlight one potential avenue for model improvement (better training on text).

# 3.4 Reasons for improvement over DeepGaze I

Why is DeepGaze II better than DeepGaze I? We quantified the contributions of the three primary changes from DeepGaze I to DeepGaze II on the MIT1003 dataset $^2$ . As seen in Figure 7, the largest single improvement is brought by using the pretrained VGG features in place of AlexNet (though we also include more channels from VGG than from AlexNet). Using the readout network rather than a linear regression slightly decreases performance when considered independently, likely due to overfitting. Training on the SALICON dataset marginally improved performance. Combining SALICON pretraining with the VGG features yields the largest intermediate model performance improvement.

---

We additionally provide examples of images for which DeepGaze II improves most from DeepGaze I (Figure 8) and performs worse than DeepGaze I (Figure 9) in terms of information gain differences (in bit/fix). The improvement for the first image in Figure 8 seems to be driven by better recognition of text, whereas for the second and third images DeepGaze II seems to benefit from improved (or more spatially-specific) face and person detection.

## 4 Discussion

Here we have presented DeepGaze II, a model of saliency prediction that uses transfer learning from the VGG-19 network to achieve state-of-the-art performance. Information gain explained is able to quantify precise differences between models, and shows the clear improvement gained by DeepGaze II (note however, that some high-performing models were not included in these evaluations because their code is not publically available). Our model is also ranked first on the held-out MIT300 benchmark according to AUC and shuffled AUC, the most commonly-reported evaluation metrics. Note however that here, at least for AUC, the difference between DeepGaze II and other models is modest.

Why does DeepGaze II perform better relative to other models that also use deep features? We believe this could be because, at least in part, we do not retrain the VGG features. While this reduces the model space, it also greatly reduces the number of parameters that must be learned from data, reducing the chance of overfitting. Furthermore, since we only use $1\times 1$ convolutions on top of this, we cannot learn new features that are substantially different from VGG: only a pointwise nonlinearity is possible. These two aspects of our model therefore represent a much more stringent test of the transfer success of deep features.

We provide a web service to calculate DeepGaze II predictions for arbitrary images at http://deepgaze.bethgelab.org.

## References

- Al-Rfou et al. (May 2016) Al-Rfou, Rami et al. (May 2016). “Theano: A Python framework for fast computation of mathematical expressions”. In: *arXiv e-prints* abs/1605.02688. url: http://arxiv.org/abs/1605.02688.
- Barthelmé et al. (2013) Barthelmé, Simon et al. (2013). “Modelling fixation locations using spatial point processes”. In: *Journal of Vision* 13.12.
- Bylinskii et al. (2015) Bylinskii, Zoya et al. *MIT Saliency Benchmark*. http://saliency.mit.edu/.
- Gatys et al. (2015) Gatys, Leon A., Alexander S. Ecker, and Matthias Bethge (2015). “A Neural Algorithm of Artistic Style”. In: *CoRR* abs/1508.06576. url: http://arxiv.org/abs/1508.06576.
- Huang et al. (2015) Huang, Xun et al. (2015). “SALICON: Reducing the Semantic Gap in Saliency Prediction by Adapting Deep Neural Networks”. In: *The IEEE International Conference on Computer Vision (ICCV)*.

---

![img-10.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-11.jpg)
Figure 8: The three images for which DeepGaze II most improves predictions relative to DeepGaze I in terms of information gain.

---

![img-11.jpeg](10.48550_arXiv.1610.01563_images/deepgaze-ii-reading-fixations-from-deep-features-t-b4eeca-fig-12.jpg)
Figure 9: The three images for which DeepGaze II most fails in prediction relative to DeepGaze I.

---

Jetley, Saumya, Naila Murray, and Eleonora Vig (2016). “End-to-End Saliency Mapping via Probability Distribution Prediction”. In: *Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition*, pp. 5753–5761.

Jia, Yangqing et al. (2014). “Caffe: Convolutional Architecture for Fast Feature Embedding”. In: *arXiv preprint arXiv:1408.5093*.

Jiang, Ming et al. (2015). “SALICON: Saliency in Context”. In: *2015 IEEE Conference on Computer Vision and Pattern Recognition (CVPR)*. Institute of Electrical and Electronics Engineers (IEEE). url: http://dx.doi.org/10.1109/CVPR.2015.7298710.

Krizhevsky, Alex, Ilya Sutskever, and Geoffrey E Hinton (2012). “Imagenet classification with deep convolutional neural networks”. In: *Advances in neural information processing systems*, pp. 1097–1105.

Kruthiventi, Srinivas S., Kumar Ayush, and R. Venkatesh Babu (2015). “Deep-Fix: A Fully Convolutional Neural Network for predicting Human Eye Fixations”. In: *CoRR* abs/1510.02927. url: http://arxiv.org/abs/1510.02927.

Kümmerer, Matthias, Thomas S. A. Wallis, and Matthias Bethge (2015). “Information-theoretic model comparison unifies saliency metrics”. In: *Proceedings of the National Academy of Sciences* 112.52, pp. 16054–16059. url: http://dx.doi.org/10.1073/pnas.1510393112.

Kümmerer, Matthias, Lucas Theis, and Matthias Bethge (2015). “Deep Gaze I: Boosting Saliency Prediction with Feature Maps Trained on ImageNet”. In: *2015 International Conference on Learning Representations - Workshop Track (ICLR)*. url: https://arxiv.org/abs/1411.1045.

Simonyan, Karen and Andrew Zisserman (2014). “Very Deep Convolutional Networks for Large-Scale Image Recognition”. In: *CoRR* abs/1409.1556. url: http://arxiv.org/abs/1409.1556.

Sohl-Dickstein, Jascha, Ben Poole, and Surya Ganguli (2013). “Fast large-scale optimization by unifying stochastic gradient and quasi-Newton methods”. In: *CoRR* abs/1311.2115. url: http://arxiv.org/abs/1311.2115.

Tatler, Benjamin W (2007). “The central fixation bias in scene viewing: Selecting an optimal viewing position independently of motor biases and image feature distributions”. In: *Journal of Vision* 7.14, p. 4.

Vig, Eleonora, Michael Dorr, and David Cox (2014). “Large-Scale Optimization of Hierarchical Features for Saliency Prediction in Natural Images”. In: *Computer Vision and Pattern Recognition, 2014. CVPR’14. IEEE Conference on*. IEEE.

Vincent, Benjamin T et al. (2009). “Do We Look at Lights? Using Mixture Modelling to Distinguish between Low- and High-Level Factors in Natural Image Viewing”. In: *Visual Cognition* 17.6-7, pp. 856–879.

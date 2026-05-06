# Regression-based analysis of combined EEG and eye-tracking data: Theory and applications

Journal of Vision (2021) 21(1):3, 1-30

# Regression-based analysis of combined EEG and eye-tracking data: Theory and applications

Olaf Dimigen*

Department of Psychology, Humboldt-Universität zu Berlin, Berlin, Germany

Benedikt V. Ehinger*

Institute of Cognitive Science, Universität Osnabrück, Osnabrück, Germany

Donders Institute for Brain, Cognition and Behaviour, Radboud University, Nijmegen, The Netherlands

Fixation-related potentials (FRPs), neural responses aligned to the end of saccades, are a promising tool for studying the dynamics of attention and cognition under natural viewing conditions. In the past, four methodological problems have complicated the analysis of such combined eye-tracking/electroencephalogram experiments: (1) the synchronization of data streams, (2) the removal of ocular artifacts, (3) the condition-specific temporal overlap between the brain responses evoked by consecutive fixations, and (4) the fact that numerous low-level stimulus and saccade properties also influence the postsaccadic neural responses. Although effective solutions exist for the first two problems, the latter two are only beginning to be addressed. In the current paper, we present and review a unified regression-based framework for FRP analysis that allows us to deconvolve overlapping potentials while also controlling for both linear and nonlinear confounds on the FRP waveform. An open software implementation is provided for all procedures. We then demonstrate the advantages of this proposed (non)linear deconvolution modeling approach for data from three commonly studied paradigms: face perception, scene viewing, and reading. First, for a traditional event-related potential (ERP) face recognition experiment, we show how this technique can separate stimulus ERPs from overlapping muscle and brain potentials produced by small (micro)saccades on the face. Second, in natural scene viewing, we model and isolate multiple nonlinear effects of saccade parameters on the FRP. Finally, for a natural sentence reading experiment using the boundary paradigm, we show how it is possible to study the neural correlates of parafoveal preview after removing spurious overlap effects caused by the associated difference in average fixation time. Our results suggest a principal way of measuring reliable eye movement-related brain activity during natural vision.

# Introduction

During everyday life, we make two to four eye movements per second to extract new information from our visual environment. Despite the fundamentally active nature of natural vision, the electrophysiological correlates of visual cognition have mostly been studied under passive viewing conditions that minimize eye movements. Specifically, in most event-related potential (ERP) experiments, participants are instructed to fixate the screen center while stimuli are presented at a comparatively slow pace.

An alternative approach that has gained popularity in recent years is the simultaneous recording of eye movements and the electroencephalogram (EEG) during the free viewing of complex stimuli. In such co-registration studies, the EEG signal can then be aligned to the end of naturally occurring eye movements, yielding fixation-related potentials (FRPs) (for reviews, see Baccino, 2011; Dimigen, Sommer, Hohlfeld, Jacobs, &amp; Kliegl, 2011; Nikolaev, Meghanathan, &amp; van Leeuwen, 2016; Velichkovsky et al., 2012). Compared to traditional passive stimulation paradigms without eye movements, this data-rich technique has the advantage that it combines the behavioral information gained from eye-tracking (such as fixation durations and locations) with the high temporal resolution and neurophysiological markers provided by the EEG, allowing the researcher to resolve the attentional, cognitive, and affective processes occurring within individual fixations. Due to the rapid pace of saccade generation during natural vision, it is also possible to collect up to 10,000 evoked responses per hour under ecologically more valid conditions.

However, the co-registration of eye movements and EEG during free viewing is also complicated by several data-analytic challenges that have hampered the more widespread adoption of this technique in

Citation: Dimigen, O., &amp; Ehinger, B. V. (2021). Regression-based analysis of combined EEG and eye-tracking data: Theory and applications. Journal of Vision, 21(1):3, 1-30, https://doi.org/10.1167/jov.21.1.3.

https://doi.org/10.1167/jov.21.1.3

Received October 6, 2019; published January 7, 2021

ISSN 1534-7362 Copyright 2021 The Authors

This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

CC BY NC ND

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

![img-0.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-1.jpg)
Figure 1. Schematic overview of four data-analytic challenges encountered when co-recording eye movement and EEG data during natural vision (after Dimigen et al., 2011). Whereas good solutions already exist for the first two problems, deconvolution modeling with nonlinear predictors effectively addresses the problems of varying overlap and low-level influences on the brain signals.

neurocognitive research. These problems, as illustrated in Figure 1, are (1) the synchronization and integration of the two data streams; (2) the ocular measurement artifacts caused by movements of the eye balls, eye lids, and extraocular muscles; (3) the condition-specific temporal overlap between the brain responses evoked by successive fixations; and (4) the strong and often nonlinear influences of visual and oculomotor low-level variables on the neural responses produced by each eye movement. Whereas there are decent solutions for the first two problems, the latter two are only beginning to be solved. In the current paper, we describe an integrated analysis framework for EEG analyses during natural vision which addresses these remaining two problems (overlap and low-level influences). We also provide a tutorial review on how this framework can be implemented using a recently introduced open-source toolbox that offers all of the necessary procedures (Ehinger &amp; Dimigen, 2019). Finally, to demonstrate how this approach can improve the analysis of unconstrained viewing experiments and produce new theoretical insights, we will apply it to co-registered datasets from three domains of neurocognitive research: face perception, scene viewing, and sentence reading.

# Four problems related to free viewing

The four methodological problems are illustrated in Figure 1. The first problem summarizes several technical issues related to the simultaneous acquisition, precise synchronization, and joint representation of the EEG and the video-based eye-tracking data. Nowadays, these issues are largely solved by optimizing the laboratory setup and by sending shared trigger pulses to both systems during each trial (e.g., Baccino &amp; Manunta, 2005). The two recordings can then be aligned offline at millisecond precision with existing software solutions (e.g., the EYE-EEG toolbox) (Dimigen et al., 2011; see also Baekgaard, Petersen, &amp; Larsen, 2014; Xue, Quan, Li, Yue, &amp; Zhang, 2017) that

also add saccade and fixation onsets as additional event markers to the EEG.

A second and more critical problem is the strong EEG artifacts generated by movements of the eye balls, eyelids, and extraocular muscles during free viewing (Keren, Yuval-Greenberg, &amp; Deouell, 2010; Lins, Picton, Berg, &amp; Scherg, 1993; Plöchl, Ossandón, &amp; König, 2012). The eye balls, in particular, act as electrostatic dipoles that rotate with each eye movement, producing large voltage distortions across the scalp (corneoretinal artifact). Two smaller artifacts are produced by the relative movement of the eye lids over the cornea during upward saccades (Lins et al., 1993; Plöchl et al., 2012) and by the recruitment of the eye muscles at saccade onset (saccadic spike potential) (Blinn, 1955; Keren et al., 2010; Yamazaki, 1968). All three ocular artifacts—corneoretinal, eye lid, and spike potential—have to be removed from the EEG without distorting brain activity. Algorithms such as independent component analysis (ICA) (Jung, Humphries, Lee, Makeig, McKeown, Iragui, &amp; Sejnowski, 1998) have commonly been used to suppress ocular artifacts, even under free-viewing conditions (Henderson, Luke, Schmidt, &amp; Richards, 2013; Hutzler et al., 2007; Keren et al., 2010; Plöchl et al., 2012; Ries et al., 2018a; Van Humbeeck, Meghanathan, Wagemans, van Leeuwen, &amp; Nikolaev, 2018). Although some residual artifacts (in particular from spike potentials) are visible in the waveforms of most published FRP studies, it seems likely that correction procedures can be improved further in the future by, for example, taking into account the information provided by the eye tracker. Specifically, the concurrent eye-tracking data are useful for selecting optimal training data for the ICA algorithm (Craddock, Martinovic, &amp; Müller, 2016; Keren et al., 2010) to identify artifact components (Plöchl et al., 2012) and to evaluate the results of the correction (Dimigen, 2020; Ries et al., 2018a). Recent findings indicate that if ICA procedures are fine-tuned for free-viewing experiments in this manner, ocular artifacts can be almost fully suppressed with relatively

---

little distortion of genuine brain activity (Dimigen, 2020; Ries et al. 2018a).

The last two major problems, differences in temporal overlap and low-level covariates, have received less attention but are a direct consequence of the fast pace and quasi-experimental nature of normal visual exploration behavior. In traditional EEG laboratory experiments, the experimenter has full control over the timing and sequence of the presented stimuli, and the participant's motor behavior is often restricted to a single button press. In most cases, it is also possible to match the visual low-level properties of the stimuli between conditions. In contrast, in any experiment with multiple saccades, the participant rather than the experimenter decides where to look and when to look at a stimulus belonging to a given condition. This means that the durations of fixations, the size and direction of saccades, and the low-level features of the stimulus at the currently foveated location (e.g. the local luminance and local contrast of an image) not only are intercorrelated with each other (Nuthmann, 2017) but are usually different between the conditions. Because all of these factors also influence the postsaccadic brain response, this can easily lead to condition-specific distortions and incorrect conclusions. In the following sections, we discuss these two problems and some proposed solutions in more detail.

## Varying temporal overlap

Event-related potentials that index cognitive processes often last up to a second before the signal tapers off and returns to baseline. In contrast, the average fixation lasts only 200 to 400 ms (Rayner, 2009) in most viewing tasks. This rapid pace of natural vision means that brain responses elicited by any given fixation will overlap with those of preceding and following fixations. Although this overlapping activity is smeared out due to the normal variation in fixation durations, overlap becomes a problem whenever the distribution of fixation durations differs between conditions.

As an example, consider a visual search task where participants look for a target item within a complex visual scene while their EEG is recorded (Cooper, McCallum, Newton, Papakostopoulos, Pocock, & Warren, 1977). It is well known that, on average, task-relevant target items are fixated longer than irrelevant non-targets (e.g. Brouwer, Reuderink, Vincent, van Gerven, & van Erp, 2013). This in turn means that the visually evoked lambda response (the analog of the P1 component in FRPs) from the next fixation will overlap at an earlier latency in the non-target condition than in the target condition (for a similar example, see also Figure 2C). Unless special precautions are taken (e.g. as in Kamienkowski, Ison, Quiroga, & Sigman, 2012), cognitive effects of target processing on the P300 component will therefore be confounded with trivial condition differences produced by the change in overlap. In other words, any difference in mean fixation duration between conditions can produce spurious differences in the EEG, even if the real underlying brain activity is the same in both conditions. Furthermore, if the duration of the pre-target fixation differs between conditions (e.g. because of the extrafoveal preprocessing of the target), these distortions will also affect early parts of the FRP waveform, including the baseline interval before fixation onset (see also Figure 7D). The confounding effect of overlapping potentials is illustrated in Figure 2 for a simulated experiment with cars and faces.

A second, but frequently overlooked, type of overlap is that between stimulus-onset ERPs and FRPs. In most free-viewing experiments, a single visual stimulus—for example, a search array, a sentence, or a scene—is presented at the beginning of each trial. The FRPs, therefore, overlap not only with each other but also with this stimulus ERP, which is often strong and long-lasting. This means that fixations that happen early and late during a trial differ systematically in terms of their baseline activity and cannot be directly compared to each other. In practice, this type of overlap can be just as problematic as that from neighboring fixations (Coco, Nuthmann, & Dimigen, 2020; de Lissa, McArthur, Hawelka, Palermo, Mahajan, Degno, & Hutzler, 2019).

Finally, overlapping potentials are also relevant in traditional EEG experiments in which the stimulus ERP is the signal of interest, and eye movements are just a confound. In particular, potentials from involuntary (micro)saccades executed during the trial have been shown to distort stimulus-locked EEG analyses in the frequency (Yuval-Greenberg, Tomer, Keren, Nelken, & Deouell, 2008) and time (Dimigen, Valsecchi, Sommer, & Kliegl, 2009) domains. We therefore need effective methods to disentangle overlapping activity from multiple events.

Several workarounds to the overlap problem have been proposed that center on data selection. One simple approach to reduce overlap is to analyze only long fixations with a minimum duration (e.g. >500 ms) (Brouwer et al. 2013; Kamienkowski et al. 2012; Kaunitz, Kamienkowski, Varatharajah, Sigman, Quiroga, & Ison, 2014); another is to analyze only the first or last fixation in a sequence of fixations, which eliminates overlapping activity from the preceding and subsequent fixations, respectively (Hutzler et al. 2007). Of course, solutions like these are not optimal because they either exclude a large portion of the data or place strong constraints on the possible experimental designs.

A stark improvement is found in the deconvolution approach that was first used for EEG analyses in

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

![img-1.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-2.jpg)

![img-2.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-3.jpg)

![img-3.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-4.jpg)

![img-4.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-5.jpg)

![img-5.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-6.jpg)

![img-6.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-7.jpg)
Figure 2. (A) A hypothetical eye-tracking/EEG experiment (simulated data) in which participants freely looked at pictures of faces and cars. We are interested in whether the FRP differs between the stimulus categories. (B) Short interval of the recorded EEG. Every fixation on a car or face elicited a brain response (lower row). Because brain responses last longer than the respective fixation durations, we can only observe the sum of the overlapping responses in the EEG (upper row). (C) In most free-viewing tasks, eye movement behavior differs systematically between conditions. For this example, we assume that, on average, faces are fixated more briefly than cars. This means that the overlap with the brain responses of the next fixations is stronger in the face condition. (D) Furthermore, we assume that, due to more refixations on faces, saccades are on average smaller in the face condition. (E) We also assume that there is a true "cognitive" effect, that the N170 component of the FRP is larger for faces than cars (Rossion &amp; Jacques, 2012). In addition, it is well known that saccade size alone has a strong nonlinear effect on the lambda response, the P1 component of the FRP. (F) Average FRP that would be measured in each condition. In addition to the genuine N170 effect, this simulation reveals several spurious effects, caused by the differences in fixation duration and saccade size. (G) Linear deconvolution corrects for the effects of overlapping potentials. (H) To also remove the confounding effect of saccade amplitude, we need to also include it as a (nonlinear) predictor in the model. (H) Now we can recover just the true N170 effect free of confounds. A conceptually similar figure was used in Ehinger &amp; Dimigen (2019).

![img-7.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-8.jpg)

![img-8.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-9.jpg)

the 1980s (Eysholdt &amp; Schreiner, 1982; Hansen, 1983). Here, the measured continuous EEG signal is understood as the convolution of the experiment events (i.e., a vector that contains impulses at the latencies of the experimental events) with the isolated brain responses generated by each type of event (as illustrated in Figure 2B). The inverse operation is deconvolution, which recovers the unknown isolated brain responses (Figure 2G) given only the measured (convolved) EEG signal and the latencies of the experimental events.

Deconvolution is only possible because the events show different temporal overlap with each other;

conversely, without any jitter (i.e., with a constant stimulus-onset asynchrony, or SOA), the responses would be inseparable because it is ambiguous as to whether the observed activity was evoked by the current event or the preceding event. This can be achieved by experimentally adding jitter to event onset times, or it happens naturally as fixation durations vary between fixations. Such temporal variability allows us to recover the unknown isolated responses, under two assumptions: (1) the brain signals evoked by different events add up linearly, and (2) the degree of temporal overlap between the events does not change

---

the processing in the brain itself and the neural response evoked by each event. The first assumption is met due to the linear summation of electrical fields (Nunez & Srinivasan, 2006). The second assumption—that the underlying brain responses are the same, regardless of the amount of overlap in the experiment—is likely incorrect but in practice is still a useful approximation (see Discussion).

Early iterative deconvolution techniques for EEG, particularly the Adjacent Response (ADJAR) algorithm (Woldorff, 1993), have proven difficult to converge (Kristensen, Rivet, & Guérin-Dugué, 2017; Talsma & Woldorff, 2004), do not allow to simultaneously control for the influences of continuous covariates on the EEG or were designed for specialized applications (Ouyang, Herzmann, Zhou, & Sommer, 2011).

More recently, a linear deconvolution method based on the least-squares estimation was successfully applied to solve the overlap problems in EEG (Burns, Bigdely-Shamlo, Smith, Kreutz-Delgado, & Makeig, 2013; Cornelissen, Sassenhagen, & Võ, 2019; Dandekar, Privitera, Carney, & Klein, 2012; Ehinger & Dimigen, 2019; Guérin-Dugué, Roy, Kristensen, Rivet, Vercueil, & Tcherkassof, 2018; Kristensen, Guerin-Dugué, & Rivet, 2017; Kristensen, Rivet, et al. 2017; Litvak, Jha, Flandin, & Friston, 2013; Lütkenhöner, 2010; Sassenhagen, 2018; Smith & Kutas, 2015a; Spitzer, Blankenburg, & Summerfield, 2016). This approach, initially applied to fMRI (Dale & Buckner, 1997; Glover, 1999; Serences, 2004), has crucial advantages over the previous, often iterative approaches. Not only are the properties of the linear model well understood, but the embedding of deconvolution in the linear model allows for multiple regression, meaning that many different event types (such as stimulus onsets, fixation onsets, and button presses) can be modeled within the same model together with continuous covariates. We provide a non-mathematical review of this linear deconvolution approach in the Tutorial Review section.

## Low-level covariates influencing eye-movement-related responses

After adequate correction for overlap, only the fourth problem remains: the massive influence of visual and oculomotor low-level variables on the shape of the saccade- or fixation-related brain responses. As an example, consider the lambda response, the dominant visually evoked P1 component of the FRP that is likely generated in striate and/or extrastriate visual cortex (Dimigen et al. 2009; Kazai & Yagi, 2003) and peaks at occipital scalp sites at around 80 to 100 ms after fixation onset. Like much of the rest of the FRP waveform (see also Figure 7F), the lambda response is strongly influenced by the size of the incoming saccade (Armington & Bloom, 1974; Dandekar, Privitera, et al. 2012; Dimigen et al. 2011; Kaunitz et al. 2014; Ries et al. 2018a; Thickbroom, Knezevič, Carroll, & Mastaglia, 1991). If saccade amplitudes differ between conditions, an analogous problem to the previously discussed fixation duration bias will occur—the experimental condition with larger saccades will also have larger lambda responses. Increasing saccade amplitude also increases the amplitude of the pre-saccadic cortical motor potentials that ramp up slowly before eye movement onset in saccade-onset locked ERPs (Becker, Hoehne, Iwase, & Kornhuber, 1972; Everling, Krappmann, & Flohr, 1997; Herdman & Ryan, 2007; Richards, 2003). Due to these premotor potentials, saccade amplitude can also affect the typical pre-fixation baseline interval for the FRP (Nikolaev, Jurica, Nakatani, Plomp, & van Leeuwen, 2013; Nikolaev et al. 2016).

Other visual and oculomotor covariates will introduce similar biases. For example, the stimulus features in the currently foveated image region (Gaarder, Krauskopf, Graf, Kropfl, & Armington, 1964; Kristensen, Rivet, et al. 2017; Ossandón, Helo, Montefusco-Siegmund, & Maldonado, 2010; Ries et al. 2018a), the fixation location on the screen (Cornelissen et al. 2019; Dimigen et al. 2013), and the direction of the incoming saccade (Cornelissen et al. 2019; Meyberg, Werkle-Bergner, Sommer, & Dimigen, 2015; see also the results in this paper) can all modulate the FRP wave shape. It is therefore reasonable to conclude that most existing FRP results (including our own) are confounded to some degree, as they did not fully control for differences in overlap and low-level covariates.

## Fixation matching: Limitations and problems

One proposed method to partially control for these confounding factors is post hoc fixation matching (Dias, Sajda, Dmochowski, & Parra, 2013; Kamienkowski et al. 2012; Luo, Parra, & Sajda, 2009; Van Humbeeck et al. 2018). The underlying idea is simple: After the experiment, the researcher selects those fixations from each experimental condition that are the most similar in terms of overlap and a few of the most important visuomotor covariates (e.g. incoming saccade amplitude) by selecting them based on their distance to each other in this multidimensional feature space (e.g. the Mahalanobis distance in Dias et al. 2013). These matched subsets of fixations are then compared, and the remaining fixations are discarded. After matching, the oculomotor covariates are as similar as possible across conditions, and all conditions are affected by overlap to a similar degree. To describe it differently, with fixation matching, we attempt to convert a quasi-experimental, naturalistic situation

---

(free viewing) back into an orthogonal, well-controlled experiment.

Matching procedures are relatively easy to implement, and if the durations of the fixations in the different conditions are also matched then they also address the overlap problem. However, there are also several limitations to this method. First, there is a loss of data due to fixations that cannot be matched. Second, the number of covariates that can be simultaneously matched under practical conditions is limited and likely smaller than the number of variables that are already known to modulate the FRP. In particular, variables shown to affect the waveform include the durations of the preceding and current fixation, the temporal overlap with the stimulus-onset ERP, the amplitude (e.g. Gaarder et al. 1964; Thickbroom et al. 1991) and direction (Cornelissen et al. 2019; Meyberg et al. 2015) of the incoming saccade, the fixated region of the screen (Dimigen et al. 2013), and local image properties at the foveated spot, such as the local luminance (Armington et al. 1967; Gaarder et al. 1964; Kristensen, Rivet, et al. 2017; Ossandón et al. 2010) and spatial frequency spectrum (Armington & Bloom, 1974; Armington, Gaarder, & Schick, 1967; Ries et al. 2018a; Yagi, Ishida, & Katayama, 1992).

In our experience, in a task such as sentence reading, it is rarely possible to match more than two to three covariates, at least if these covariates show sizeable condition differences in the first place. Third, matching approaches are limited to simple factorial designs; it is difficult to imagine how a matching procedure would work if the independent variable manipulated in the experiment (e.g. the saliency of an image region) would be continuous rather than categorical in nature. Fourth, currently proposed algorithms for fixation matching are based on predefined thresholds or null-hypothesis testing. In the latter case, it is assumed that there is no longer a difference in the mean of the covariates if the difference is not statistically significant anymore. However, a non-significant difference between the covariates after matching does not mean that the null hypothesis is correct (Sassenhagen & Alday, 2016).

Finally, it is possible that the matching of saccade or fixation properties reduces the actual psychological effect in the data. For example, once fixation durations are matched, we are comparing the neural correlates of two pools of fixations that on average did not differ in terms of the behavioral outcome. In contrast, the fixations that may be the psychologically most relevant ones that contribute the most to the behavioral effect—those at the tail of the distribution—tend to be eliminated from the FRP by the matching. Discarding these fixations could therefore lead to more false-negative findings.

## Towards a unified model based on linear deconvolution and spline regression

Based on these problems, it is clear that another solution needs to be found. Instead of selecting fixations, we need to correct for the aforementioned effects. One tool to account for these confounds is multiple linear regression with continuous regressors. The approach, called mass-univariate linear modeling (Figure 3), has been frequently applied to traditional EEG datasets (Amsel, 2011; Hauk, Davis, Ford, Pulvermüller, & Marslen-Wilson, 2006; Pernet, Chauveau, Gaspar, & Rousselet, 2011; Rousselet, Pernet, Bennett, & Sekuler, 2008) and more recently also to account for linear influences of saccade parameters on FRPs (Weiss, Knakker, & Vidnyánszky, 2016). Importantly, the linear modeling of covariates has recently also been shown to combine seamlessly with the linear deconvolution approach introduced above, for both ERPs (Smith & Kutas, 2015a) and FRPs (Cornelissen et al. 2019; Ehinger & Dimigen, 2019; Guérin-Dugué et al. 2018; Kristensen, Rivet, et al. 2017).

A fact that complicates the problem further is that the relationship between saccade properties and the FRP is often nonlinear. For example, several studies found that with increasing saccade amplitude, the lambda response increases in a nonlinear fashion (Dandekar, Privitera, et al. 2012; Kaunitz et al. 2014; Ries et al. 2018a; Thickbroom et al. 1991; Yagi, 1979). Nonlinear relationships with saccade size have also been reported for the saccadic spike potential (Armington, 1978; Boylan & Doig, 1989; but see also Keren et al. 2010), the burst of eye muscle activity at saccade onset. As we will confirm below, the influences of some oculomotor covariates on the FRP are indeed highly nonlinear. Ignoring these nonlinear relations and modeling the data by a simple linear predictor can therefore produce suboptimal results and bias the results in an arbitrary way (e.g. Tremblay and Newman, 2015).

Fortunately, due to the flexible nature of the linear model, it is also possible to model nonlinear relationships within this framework. For this purpose, the linear model is augmented by spline regression, as used in the generalized additive model (GAM) (Wood, 2017). Recently, spline regression has been applied to ERPs (Hendrix, Baayen, & Bolger, 2017; Kryuchkova, Tucker, Wurm, & Baayen, 2012; Tremblay & Baayen, 2010; Tremblay & Newman, 2015) and also to FRPs (Van Humbeeck et al. 2018). In this paper, we demonstrate how spline regression can be combined with deconvolution to control for the highly nonlinear influences of some predictors (exemplified here for saccade amplitude and saccade direction) during the free viewing of pictures.

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

Mass univariate approach uses epoched data: fit one regression model separately to each time point  $(\tau)$  after the event

![img-9.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-10.jpg)
Figure 3. Illustration of mass univariate modeling of EEG (without overlap correction). (A) Similar to a traditional ERP analysis, short epochs are cut around all events of interest—for example, the onsets of fixations on two types of stimuli, cars and faces (see Figure 2). A regression model is then fit separately to each time point within the epoch, with the EEG signal over trials serving as the dependent variable. The design matrix  $X$  codes the value of the predictors in each trial. In this example, we model each time point by an intercept term, which captures the overall brain response generated by fixations on stimuli of type "car" (using treatment coding). A second predictor captures the additional effect elicited by face fixations (as compared to car fixations). (B) After the model is repeatedly run for each time point, the resulting regression coefficients (betas) can be plotted as an ERP-like waveform (rERP). The mass univariate approach can also account for covariates but not for overlapping potentials from preceding and following events.

# Current paper

Combining the ideas presented above, we propose that the combination of linear deconvolution with nonlinear spline regression (GAM) can solve both of the major remaining problems: overlap and covariate control. In the remainder of this paper, we first describe both methods on an intuitive level by building up a model for a typical free-viewing experiment, step by step. To illustrate the advantages of this approach on real data, we then use the recently introduced unfold toolbox (http://www.unfold toolbox.org) to analyze combined eye-tracking/EEG data from three paradigms: face recognition, visual search in scenes, and reading.

# (Non)linear deconvolution: A tutorial review

In this section, we first review the basic principles of deconvolution modeling within the linear regression framework. We then outline how deconvolution combines with the concept of spline predictors to model nonlinear effects. Introductions to linear models, regression-based ERPs (rERPs), and deconvolution within the rERP framework can be found in Smith and Kutas (2015a, 2015b), Ehinger &amp; Dimigen (2019), and Sassenhagen (2018). Recent applications to saccade-and fixation-related potentials are found in Coco et al.

(2020); Cornelissen et al. (2019); Dandekar, Privitera, et al. (2012); Guérin-Dugué et al. (2018); and Kristensen, Rivet, et al. (2017). A more technical description of some of the steps summarized below is provided in Ehinger &amp; Dimigen (2019). In the following, we describe the general principles in a less technical and more intuitive fashion.

# Linear modeling of the EEG

Before we introduce linear deconvolution, let us first look at another common way that multiple regression is applied to EEG: mass-univariate linear modeling (Pernet et al., 2011). Figure 3A illustrates this approach for a simple experiment with two conditions, but the concept can be generalized to arbitrary designs. In a first step, we cut the data into epochs around the onsets of experimental events—for example, fixations (e.g., Weiss et al., 2016). For each of the  $n$  time points in the epoch, we then fit a separate regression model, which tries to explain the observed data over trials at the given time point  $t$ :

$$
E E G _ {e p o c h, t} = b _ {1, t} + b _ {2, t} * \left(i s \_ f a c e _ {e p o c h}\right) + e _ {e p o c h, t}
$$

The same model can also be written in matrix notation:

$$
E E G _ {t} = X b _ {t} + e _ {t}
$$

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

# Linear deconvolution

uses continuous data: fit one large regression model

![img-10.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-11.jpg)
Figure 4. Illustration of linear deconvolution in a situation with overlapping brain responses. In contrast to the mass univariate approach, linear deconvolution explains the continuous EEG signal of each channel within a single regression model. (A) A short interval of the continuous EEG is plotted on the left (time runs from top to bottom). Highlighted are the onset latencies of four experimental events belonging to the conditions car fixation (in orange) and face fixation (in blue). Our goal is to recover the unknown isolated brain responses (betas) elicited by each fixation event, so that together they best explain the continuous EEG. For this purpose, we create a time-expanded version of the design matrix  $(X_{dc})$  in which a number of local time points around each fixation onset (in this example only five time points) are added as predictors. We then solve this large regression model for the betas, which are plotted on the right. In this example, responses are modeled by an intercept term, which describes the overall neural response to fixations on a "car" stimulus. Furthermore, in a second model term, we model the additional effect of fixating a face as opposed to a car—that is, the face effect. (B) For example, the 25th sample of the continuous EEG can be explained by the sum of the overlapping brain responses to three fixations: the response to an earlier fixation on a car (at time point 5 after that event), the response to an earlier fixation on a face (at time point 3 after that event), and, finally, by a fixation on a car that happened at sample 25 itself (at time point 1 after that event). Because the temporal distances between events vary throughout the experiment, it is possible to find a unique solution for the betas, thereby disentangling the overlapping responses.

Here,  $X$  is the design matrix. Each of its rows represents one observation (e.g., one fixation onset), and each of its columns represents one predictor and its value in the respective trial (e.g., the type of object fixated or the incoming saccade size). In the equation,  $b$  is a vector of to-be-estimated parameters (regression coefficients, or betas) that we wish to estimate, and  $e$  is the error term, a vector of residuals. For each time point relative to the event, we run the model again and estimate the respective betas. The result is a time series of betas for each predictor, also called a rERP, that can be plotted against time just like a traditional ERP waveform. Mass-univariate models have been successfully applied to ERP studies in which many covariates affect the neural response (Amsel, 2011; Hauk et al., 2006; Rousselet et al., 2008), but they cannot account for varying temporal overlap between neighboring events.

In other words, if overlap differs between conditions, they will produce biased estimates.

# Deconvolution within the linear model

The linear deconvolution approach, as illustrated in Figure 4, directly addresses this issue of overlapping brain responses. As an example, consider the left part of Figure 4A, which shows a small part of a continuous EEG recording. We can see that the EEG recorded at sample 25 of the experiment (gray dashed box) is the sum of the responses to three different fixations: the early part of the brain response to a fixation on a car that happened at this sample (indicated in orange), the middle part of the response to an earlier fixation on a face (which had occurred two samples earlier,

---

in blue), and the late part of the response to another earlier fixation on a car (which had occurred four samples earlier, in orange). During free viewing, the temporal overlap with neighboring fixation events is slightly different for each fixation. Additionally, in many experiments, participants look at different categories of stimuli during each trial, leading to variable sequences of events. For example, in our hypothetical car/face experiment, fixations on cars are sometimes followed by a fixation on a face and sometimes by a fixation on another car. Due to both sources of variability—in terms of temporal overlap, the sequence of events, or both—it is possible to recover the non-overlapped signals in a regression model.

One property that distinguishes linear deconvolution from the mass-univariate approach is that the input EEG data have to be continuous rather than cut into epochs. This is because, for a correct estimation, we need to consider the temporal relationship between all event-related responses that happened close to each other in time. If we would cut the EEG into short epochs, the epochs would likely not contain all of the preceding and following events that also influenced the signal. If we would instead cut the EEG into very long epochs, the epochs would start overlapping with each other, meaning that some data points would enter the model multiple times, biasing the estimation. For these reasons, we need to model the continuous EEG (after it was corrected for ocular artifacts and eye movement markers were added).

We set up the deconvolution model by generating a new design matrix *X*_{*d**c*} (where dc stands for deconvolution), which spans all samples of the continuous EEG recording (Figure 4A). Like in the mass univariate model (Figure 3), the columns of this design matrix code the condition of the events in our model (e.g. “intercept” and “is this a face fixation?”). In order to explain linear deconvolution, we need to introduce the concept of local time (τ), which describes the time (in samples) relative to the onset of a given type of event. In the simplified example of Figure 4, we model just the n = 5 time points following each event (from τ = 1 to τ = 5 after event onset). In a realistic scenario, one would model a couple of hundred sampling points before and after the fixation onset (e.g. in a time window from --200 to 800 ms). The time range should be chosen so that it captures the entire fixation-related EEG response, including oculomotor potentials that reflect saccade planning and precede fixation onset (Becker et al. 1972; Everling et al. 1997; Herdman & Ryan, 2007; Richards, 2003). To set up the deconvolution model, we then have to add n = 5 new predictors to the model for each model term. These predictors will directly model the time course of the event-related response, a process that we call time-expansion and explain in the following.

The first n columns in the new design matrix *X*_{*d**c*} belong to the intercept predictor. The first column codes the first time point after that type of event occurred (τ = 1). This column will be 0 at every sample, except at those latencies of the EEG when a fixation occurred; there, we set it to 1. The second column codes the second time point after the event, τ = 2. This column will get a 1 at all continuous EEG samples that were recorded one sample after a fixation and 0 everywhere else. We repeat this process for all five sampling points relative to each fixation, after which we repeat the procedure for the second model term. In our example model, which uses treatment coding, the second term codes whether a fixation was on a face (rather than on a car). Repeating the time-expansion process for this second model term therefore adds five more columns to the design matrix.

If we look at the expanded design matrix produced by this process (Figure 4A), we see diagonal staircase-like patterns. We can now also immediately see which parts of the individual evoked responses contribute to the observed continuous EEG signal, as highlighted here for sample number 25. Note that the resulting time-expanded design matrix *X*_{*d**c*} is large; it has as many rows as there are samples in the EEG recording. The number of its columns is given by the number of model terms (here, 2) multiplied by the number of modeled time points (here, n = 5). Thus, to solve the regression model, we need to solve a large linear equation system. In realistic applications, the design matrix *X*_{*d**c*} often spans a few million rows (continuous EEG samples) and several tens of thousands of columns (predictors). Fortunately, this computationally difficult problem can nowadays be solved efficiently with modern algorithms for solving sparse matrices (time expansion produces a very sparse matrix, that is, a matrix mostly filled with 0s, as illustrated in Figure 4A). In summary, the regression formula changes little from the mass univariate model to the deconvolution model:

*E**E**G* = *X*_{*d**c*} *b* + *e*

Solving this formula for b provides the n betas for each term in the model, one for every time point modeled (see Figure 4A, right side). However, in contrast to the mass univariate model, we do not need to calculate a separate model for each time point; instead, all betas for a given EEG channel are returned in just one model fit. This time series of betas, or rERP, represents the non-overlapping brain responses for each predictor. Like traditional ERP waveforms, rERPs can be visually inspected, plotted as waveforms or scalp topographies, entered into a dipole analysis, and compared statistically (Smith & Kutas, 2015a; Smith & Kutas, 2015b). Furthermore, because the estimation is linear, linear operations such as a baseline

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

correction can also be applied to the rERPs after the deconvolution (Smith &amp; Kutas, 2015a).

# Modeling nonlinear effects

As explained above, some predictors have nonlinear influences on the EEG. As we show in the empirical part of this paper, considering nonlinear effects is especially important in free-viewing experiments. In the linear regression framework, nonlinear effects can be accounted for in different ways. Common approaches are to transform individual predictors (e.g., via a log transform) or to include higher order terms, such as quadratic or cubic terms, in the model (polynomial regression). However, these approaches have drawbacks. The transformation of individual predictors (such as saccade amplitude) necessitates a priori knowledge about the correct shape of the relationship, but for ERPs and FRPs this shape is often unknown. For more complex relationships, such as circular predictors with non-sinusoidal shapes, it can be difficult to find a good transformation function without resorting to an inefficient Fourier set. By using a polynomial regression one could in principle fit any arbitrary relationship, but in practice one often observes oscillatory patterns (Runge, 1901). These patterns occur because each additional term added to the polynomial acts on the entire range of the predictor; that is, it affects the fit at all values of the independent variable rather than just locally.

A more flexible option is spline regression, a technique also commonly summarized under the name GAM (Wood, 2017). Splines can be understood as local smoothing functions (Figure 5), and they have the advantage that they are defined locally—that is, over only a short range of the continuous predictor (e.g., just for saccade amplitudes between  $2^{\circ}$  and  $4^{\circ}$ ). This solves the problem of oscillatory patterns and makes the predictors easily interpretable and less dependent on the exact fit of the other parameters. The following section attempts a brief and intuitive overview of spline regression.

Figure 5A shows a hypothetical nonlinear relationship between a predictor and the EEG. As an example, the predictor might be saccade amplitude, and we see that the difference between saccades of  $1^{\circ}$  and  $2^{\circ}$  has a much larger influence on the amplitude of the fixation-related lambda response (P1) than the difference between  $11^{\circ}$  and  $12^{\circ}$  saccades. Obviously, a linear function would not fit these data well. An alternative way to model this relationship is to represent the continuous predictor (the independent variable) by a set of basis functions (Figures 5B to 5E). One simple way to do this is to split up the range of the independent variable into multiple distinct bins (as used by Dandekar, Privitera, et al., 2012).

![img-11.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-12.jpg)
Figure 5. Using splines to model nonlinear effects, illustrated here for simulated data. (A) Example of a relationship between a predictor (e.g., saccade amplitude) and a dependent variable (e.g., fixation-related P1). As can be seen, a linear function (black line) fits the data poorly. The dashed vertical line indicates some example value of the independent variable (IV) (e.g., a saccade amplitude of  $3.1^{\circ}$ ). (B) Categorization basis set. Here, the range of the IV is split up into non-overlapping subranges, each coded by a different predictor that is coded as 1 if the IV value is inside the range and as 0 otherwise. The IV is evaluated at all functions, meaning that, in this case, the respective row of the design matrix would be coded as [0 0 0 1 0 0]. (C) After computing the betas and weighting the basis set by the estimated beta values, we obtained a staircase-like fit, clearly better than the linear predictor, but still poor. (D) Spline basis set. The range of the IV is covered by several spline functions that overlap with each other. Note that the example value of the IV  $(3.1^{\circ})$  produces non-zero values at several of the spline predictors (e.g., [0 0 0.5 0.8 0.15 0]). (E) After computing the betas and weighting the spline set by the betas, we obtain a smooth fit.

In the regression model, such a basis set is implemented by adding one additional column to the design matrix for each bin or basis function. For example, if we split the values of the saccade amplitude into six bins (Figure 5B), we would add five columns plus the intercept to the design matrix  $X$ . The independent variable now covers several columns, and each column models a certain range of possible saccade amplitudes (e.g.,  $0^{\circ} - 2^{\circ}$ ,  $2^{\circ} - 4^{\circ}$ ,  $4^{\circ} - 6^{\circ}$ , ...). When we solve the model, we estimate the beta weights for each basis function. As Figure 5C shows, this

---

produces a better fit to the data, because it captures the nonlinear relationship (Dandekar, Privitera, et al. 2012); however, it also produces abrupt jumps between category borders, which can decrease statistical power and increase type-1 errors (Austin & Brunner, 2004). So, instead, it is strongly recommended to keep the continuous predictors continuous (Altman & Royston, 2006; Bennette & Vickers, 2012; Collins, Ogundimu, Cook, Le Manach, & Altman, 2016; Royston, Altman, & Sauerbrei, 2006).

A better alternative, illustrated in Figures 5D and 5E, is to use spline functions as a basis set. This is conceptually similar to the categorization approach but makes use of the assumption that the fit should be smooth. Instead of defining distinct bins, the range of possible values of the independent variable is covered by a number of spline functions that overlap with each other, as shown in Figure 5D (how exactly the spline set is constructed is outside the scope of this paper; the interested reader is referred to Wood, 2017).

If we now evaluate this set of splines at a given value of the independent variable (e.g. for a saccade of 3.1°), we obtain non-zero values not just for a single predictor but also for several neighboring spline functions, as well (note that three functions are non-zero in Figure 5D). The different splines will have different strengths, as they have different amounts of overlap with this value. When we solve the model, the spline functions are again weighted by their respective beta coefficients and summed up to obtain the modeled values. In contrast to the categorization approach, the result is a smooth, nonlinear fit (Figure 5E). In practice, however, we are not interested in the betas for each of the individual spline functions; instead, we want to evaluate the whole set of overlapping splines at certain values of the independent variable. For example, to visualize the effect of saccade amplitude on FRPs (see Figure 7F), we might want to evaluate the spline set, weighted by the previously estimated betas, at several saccade sizes of interest (e.g. 0.6°, 5°, 10°, and 15°).

When modeling nonlinear effects, one important parameter to set is the number of splines that cover the range of the predictor, because this determines how flexible (or “wiggly”) the modeled relationship can be. Using too few splines or too many splines increases the risk of underfitting or overfitting the data, respectively. Several automatic selection methods exist to set the number of splines which are usually based on cross-validation or penalized fitting (Wood, 2017). Unfortunately, in case of the large deconvolution models, methods such as cross-validation are computationally expensive. Also, while it is still possible to use cross-validation to determine the best number of splines for a single, or just a few, spline predictors (e.g. with the help of function uf_checkmodelfit.m in the unfold toolbox), the problem quickly becomes intractable when the model contains many spline predictors and the optimal number of splines must be determined for each predictor. A pragmatic approach that we currently employ is to err on the side of caution (that is, underfitting) by using a relatively small number of splines to model nonlinear relationships (i.e. five splines in all models presented here). For more discussions on this issue, the reader is referred to Ehinger and Dimigen (2019).

### Analyzing a free-viewing dataset with the unfold toolbox

In the following, we briefly go through the practical steps to run and analyze a deconvolution model with spline predictors, using the unfold toolbox and the hypothetical car/face experiment depicted in Figure 2. Parts of the following description are adapted from our toolbox paper (Ehinger & Dimigen, 2019). For a detailed technical documentation of the toolbox and its features, we refer the reader to that paper.

To begin, we need a continuous EEG dataset in the EEGLAB format (Delorme & Makeig, 2004) that also contains event markers (triggers) for the experimental events of interest (such as stimulus onsets). For free-viewing experiments, we need additional events that code the onsets of saccade and/or fixations, as well as the respective properties of these eye movements (e.g. amplitude and direction of saccades, duration and location of fixations, type of object fixated). With existing open-source software, such eye movement events can be easily imported or detected in the synchronized eye-tracking data. In most cases, the EEG data that we wish to analyze should have already been preprocessed (e.g. filtered) and corrected for ocular artifacts.

We then start the modeling process by writing down the model formula, which defines the design matrix X of the regression model. In the unfold toolbox, models are specified using the common Wilkinson notation (Wilkinson & Rogers, 1973) that is also used in other statistics software such as R. Using this notation, we might define the following model for the hypothetical free-viewing experiment depicted in Figure 2:

FRP ∼ 1 + cat(is_face) + sacc_amplitude

Here, the FRP is modeled by an intercept term (1) that describes the overall waveform; by a categorical variable (or factor) is_face, which codes whether the currently looked-at object is a face (1) or a car (0); and by a continuous linear predictor that codes the amplitude of the saccade that precedes fixation onset. It is also possible to define interactions (e.g. is_face * sacc_amplitude).

---

As explained earlier, it is unrealistic to always assume a linear influence of oculomotor behavior on the EEG. We can therefore relax this assumption and model saccade amplitude as a nonlinear predictor. With the following formula, the effect of saccade amplitude would be modeled by a basis set consisting of five splines^{1}:

FRP ∼ 1 + cat(is_face) + spl(sacc_amplitude,5)

In the same model, we can simultaneously model brain responses evoked by other events, such as stimulus onsets or button presses. Each of these other event types can be modeled by their own formula. For example, in the car/face task, it would be important to also model the stimulus ERP that is elicited by the onset of the car/face display on the screen; otherwise, this stimulus ERP will distort the baseline intervals of the following FRPs. This issue is crucial in experiments in which stimuli belonging to different conditions are fixated at slightly different average latencies after stimulus onset (e.g. Coco et al. 2020). For example, if the first fixation in a trial is aimed more often at a face than at a car, the face FRP will be distorted differently by the overlapping stimulus-locked ERP waveform than the car FRP. Fortunately, the ERP evoked by the stimulus presentation can be simply accounted for by adding an additional intercept-only model for all stimulus events. In this way, it will be removed from the estimation of the FRPs. The complete model would then be

ERP ∼ 1 {for stimulus onsets}

FRP ∼ 1 + cat(is_face) + spl(sacc_amplitude,5) {for fixation onsets}

When the formulas have been defined, the design matrix X is time-expanded to X_{dc} and now spans the duration of the entire EEG recording. Subsequently, the equation (EEG = X_{dc} b + e) is solved for b, the betas. This is done for each channel separately. The resulting regression coefficients, or betas, correspond to the subject-level ERP waveforms in a traditional ERP analysis (Smith & Kutas, 2015b). For example, in the model above, for which we used the default treatment coding in the unfold toolbox, the intercept term of the FRP corresponds to the average FRP at the subject level elicited by a face fixation. The other betas, for example, cat(is_face), will capture the partial effect of that particular predictor (here, the effect of fixating a face rather than a car) and therefore correspond to a difference wave in a traditional ERP analysis (here, face FRP minus car FRP). For data visualization or for second-level statistical analyses at the group level, these regression-based waveforms can therefore be treated just like any other subject-level ERP. In the following, we will apply this approach to several real datasets.

## Experimental methods

The empirical part of this paper will demonstrate the possibilities and advantages of (non)linear deconvolution modeling for analyzing free-viewing experiments. For this, we will use combined EEG/eye-tracking data from three commonly studied paradigms: face recognition, scene viewing, and natural sentence reading. The following section briefly summarizes the experimental methods that are common to all three experiments. Afterwards, we report the experiments in detail.

### Participants

Participants in all three co-registration experiments were young adults, mostly psychology students, with normal or corrected-to-normal visual acuity (verified using Bach, 2006). Different participants took part in the three studies. We analyzed 10 participants for the face recognition experiment, 10 for the scene viewing experiment, and 42 for the sentence reading study. Experiments were conducted in compliance with the tenets of the Declaration of Helsinki (2008), and participants provided written informed consent before participation.

### Apparatus and eye-tracking

All datasets were recorded in an electromagnetically shielded laboratory at Humboldt University using identical eye-tracking, EEG, and stimulation hardware. In all experiments, stimuli were presented at a viewing distance of 60 cm on a 22-inch CRT monitor (Iiyama Vision Master Pro 510, resolution 1024 × 768 pixels, vertical refresh 100 or 160 Hz depending on the experiment). Binocular eye movements were recorded at a rate of 500 Hz with a table-mounted eye tracker (iView-X Hi-Speed; SMI GmbH, Teltow, Germany) that was frequently (re-)calibrated using a 9-point or 13-point grid and validated on a 4-point grid. Stimulus presentation and recordings were controlled by Presentation software (Neurobehavioral Systems, Albany, CA). Saccades and fixations were detected offline using the algorithm of Engbert & Kliegl (2003) as implemented in the EYE-EEG toolbox.

### Electrophysiological recordings

Electrophysiological signals were recorded from either 46 (Face and Scene experiments) or 64 (Reading experiment) Ag/AgCl electrodes. EEG electrodes were mounted in a textile cap at standard 10-10 system positions. Electrooculogram (EOG) electrodes were

---

positioned at the outer canthus and infraorbital ridge of each eye. Data were amplified with BrainAmp amplifiers (Brain Products GmbH, Gilching, Germany) and digitized at 500 Hz, with impedances kept below 5 kΩ. Electrodes were initially referenced against an electrode on the left mastoid bone but digitally re-referenced to an average reference. The Face and Scene data were acquired with a time constant of 10 seconds, whereas the Reading data were acquired as DC data. Offline, data of all experiments were high-pass filtered at a cutoff (-6 dB) of 0.1 Hz using the EEGLAB finite response windowed sinc filter with default slope settings. Datasets were also low-pass-filtered at 100 Hz (Face experiment) or 40 Hz (Reading and Scene experiments) using the same function.

EEG and eye-tracking data were synchronized offline using EYE-EEG (version 0.81) based on shared trigger pulses sent from the presentation computer to the computers recording EEG and eye movements. The mean synchronization error was < 1 ms, computed based on the trigger alignment. Proper signal synchronization was additionally verified by computing the cross-correlating function between the horizontal gaze position signal and the horizontal bipolar electrooculogram which consistently peaked at or near lag zero (function checksync.m in EYE-EEG).

EEG data from the Scene experiment were corrected for ocular artifacts using Infomax ICA, which was trained on bandpass-filtered training data (Dimigen, 2020). Ocular components were then removed using the eye-tracker-guided method proposed by Plöchl et al. 2012 (variance ratio threshold, 1.1). Data for the reading experiment were artifact corrected using Multiple-Source Eye Correction (Berg & Scherg, 1994) as implemented in BESA (BESA GmbH, Gräfelfing, Germany). Data for the Face experiment were not corrected for ocular artifacts, because there was a central fixation instruction during this experiment and the data therefore contained only comparatively small saccades. Instead, for this dataset, artifact-contaminated intervals were identified offline by moving a window with a length of 2000 ms in steps of 100 ms across the continuous recording. Whenever this window contained a peak-to-peak voltage difference of >150 µV at any channel, the corresponding EEG interval was removed from the deconvolution model. This was accomplished by setting all columns of the time-expanded design matrix (X_{dc}) to 0 for these “bad” time intervals; this way, they will be ignored in the regression model.

### Statistics

Statistical comparisons in all experiments were performed using the threshold-free cluster-enhancement method (Mensen & Khatami, 2013; Smith & Nichols, 2009), a data-driven permutation test that controls for multiple comparisons across time points and channels (using ≥1000 random permutations).

## Experiment 1: Face perception

In typical EEG experiments, participants are instructed to avoid eye movements. Yet, high-resolution eye-tracking reveals that even during attempted fixation the eyes are not completely motionless but frequently perform microsaccades, small involuntary movements with a typical amplitude of less than 1° (Rolfs, 2009). Depending on the task, these microsaccades are often found intermixed with small exploratory saccades aimed at informative regions of the stimulus, such as the eye region of a face. In the following, we refer to both kinds of small eye movements simply as “miniature saccades” (Yuval-Greenberg et al. 2008).

Previous co-registration studies have shown that despite their small size, miniature saccades can generate sizable eye muscle (Craddock et al. 2016; Yuval-Greenberg & Deouell, 2009) and brain potentials (Dimigen et al. 2009; Gaarder, Koresko, & Kropfl, 1964) in EEG. Furthermore, because the amplitude and rate of miniature saccades often differ systematically among experimental conditions (Rolfs, 2009), these additional signals can seriously distort stimulus-locked analyses in the time and frequency domain (Dimigen et al. 2009; Yuval-Greenberg et al. 2008). In the following, we demonstrate how deconvolution and spline regression can be used to elegantly control for the effects of miniature saccades and improve data quality, even in standard ERP experiments in which participants are told to maintain fixation.

### Participants

Twelve participants took part in the study. Here, we analyze the data of 10 participants (19 to 35 years old; eight female), because the data of two additional participants could not be synchronized across the entire recording. Single-subject data from one participant of this study were also shown in Ehinger & Dimigen (2019).

### Methods

During this experiment, previously described in the supplement of Dimigen et al. (2009), participants saw 480 pictures of human faces (7.5° × 8.5°) with a happy, neutral, or angry facial expression. The participants' task was to classify the face's emotional expression using three manual response buttons. At the start of each trial, a small (0.26°) central fixation cross appeared for 1000 ms. It was then replaced by the face for 1350 ms. Afterwards, the fixation cross reappeared.

---

Before the experiment, participants received written instruction to keep their fixation at the screen center for the duration of each trial.

For data analysis, we specified the following model: The formula for the stimulus onset events (face onset) was `ERP ~ 1`, meaning that the stimulus ERP was modeled by a constant intercept term (the factor “emotion” was ignored for the current analysis). Potentials from miniature saccades were modeled by the formula `Saccade ERP ~ 1 + spl(sacc_amplitude,5)`—that is, by a constant intercept term and by a predictor coding saccade amplitude. Because the effect of saccade amplitude on the post-saccadic brain response is nonlinear, this effect was modeled here by five splines. Neural responses were estimated in the time window between --500 and 800 ms around each stimulus/saccade event and subsequently baseline corrected from --100 to 0 ms.

### Results and discussion

Results are shown in Figure 6. Eye-tracking revealed that participants made at least one miniature saccade in the vast majority (99%) of trials. With a median amplitude of 1.5° (Figure 6B), most of these saccades were not genuine microsaccades but rather small exploratory saccades aimed at the eyes or at the mouth region (Figure 6A), the parts of the face most informative for the emotion classification task. The histogram in the lower part of Figure 6C shows that the rate of miniature saccades reached a maximum around 240 ms after stimulus onset. Each miniature saccade elicits its own visually evoked lambda response (Dimigen et al. 2009), which peaks around 110 ms after saccade onset. Therefore, we would expect an impact of saccades on the stimulus ERP beginning around 350 ms (240 + 110 ms) after stimulus onset. Indeed, if we compare the stimulus ERP with and without deconvolution at occipital electrode Oz (panel C), we see a positive shift in the uncorrected signal that starts around 350 ms and continues until the end of the analysis time window. This reflects the statistically significant distortion produced by overlapping miniature saccades (Figure 5E).

Figure 6D shows the saccade ERP, again with and without deconvolution. As expected, the saccadic response was also changed by the deconvolution, because we removed from it the overlapping influences of the stimulus ERP as well as those of other miniature saccades. Similar results have recently been reported by Guerin-Dugue et al. (2018).

This simple example shows how linear deconvolution can disentangle eye-movement-related potentials from stimulus-evoked activity to obtain an unbiased version of the stimulus ERP not contaminated by saccade-evoked activity. Deconvolution is especially important in experiments in which the rate, direction, or amplitude of saccades differs among conditions (Engbert & Kliegl, 2003; Meyberg et al. 2017; Yuval-Greenberg et al. 2008). However, even in cases where oculomotor behavior is the same in all conditions, the signal-to-noise ratio of the stimulus-locked ERP should improve after removing the brain-signal variance produced by miniature saccades (as already suggested in one of the earliest EEG/eye-tracking papers, Armington et al. 1967). Another major advantage compared to traditional averaging is that deconvolution also provides us with a clean, unbiased version of the (micro)saccade-related brain activity in the task. This is interesting, as potentials from small saccades have been shown to carry valuable information about the time course of attentional (Meyberg et al. 2015) and affective (Guérin-Dugué et al. 2018) processing in the task. With deconvolution, we can now mine these “hidden” brain responses to learn more about the participant's attentional or cognitive state.

## Experiment 2: Scene viewing

Next, we model fixation-related activity during natural scene viewing. As explained in the Introduction, the properties of eye-movement-related brain potentials are not yet fully understood. What is clear, however, is that, in addition to local stimulus features, properties of the incoming saccade strongly influence neural responses following fixation onset (Armington & Bloom, 1974; Thickbroom et al. 1991). This means that even a slight mismatch in oculomotor behavior between two conditions will produce spurious differences between the respective brain signals. Fortunately, deconvolution modeling can simultaneously control for overlapping potentials and the effects of oculomotor (e.g. saccade size) and visual (e.g. foveal image luminance) low-level variables.

In the following, we model FRPs from a visual search task on natural scenes. For the sake of clarity, in this example we focus only on the results of two oculomotor variables: saccade amplitude and saccade direction. These variables are highlighted here, because, as we show below, they both have clearly nonlinear effects on the FRP. Previous studies have already reported nonlinear influences of saccade amplitude on FRPs (Dandekar, Privitera, et al. 2012; Kaunitz et al. 2014; Ries et al. 2018a; Thickbroom et al. 1991; Yagi, 1979). For example, when executed on a high-contrast background, microsaccades of 0.3° can generate a lambda responses (P1) that is almost as large as that following a 4.5° saccade (see Figure 2c in Dimigen et al. 2009). Results like these suggest that it is insufficient to model saccade amplitude as a linear predictor. Effects of saccade direction on the postsaccadic neural response have only recently been reported (Cornelissen et al.

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

![img-12.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-13.jpg)
A

![img-13.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-14.jpg)

![img-14.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-15.jpg)

![img-15.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-16.jpg)

![img-16.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-17.jpg)

![img-17.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-18.jpg)
Figure 6. Grand-average results of the face classification experiment, with and without deconvolution. (A) On each trial, participants saw one face stimulus. Despite the instruction to avoid eye movements, participants made miniature saccades in almost every trial. Saccade endpoints are visualized as a heatmap, superimposed on the average face stimulus. (B) Miniature saccades had a median amplitude of  $1.5^{\circ}$ . The thin gray lines depict results for individual participants. (C) ERP at occipital electrode Oz, aligned to stimulus onset, without and with deconvolution (mean  $\pm 95\%$  bootstrapped confidence intervals). The embedded histogram plots the saccade rate—that is, the occurrences of miniature saccades on the face. (D) Brain potentials time-locked to the onsets of miniature saccades detected during the trials. (E) Difference between the stimulus ERP with and without deconvolution. The largest ERP difference can be seen about 100 ms after the rate of saccades reaches its maximum. (F) Same difference, but for the saccade-related ERP. (G) Color-coded single-trial EEG (erpimage) time-locked to face onset. When single trials are sorted by the latency of the first miniature saccade in the trial, the overlapping saccade-related activity becomes evident. Note how the distortion of the stimulus ERP (in panels C and E) can be explained by the peak in saccade rate around 230 ms and the resulting overlap with the postsaccadic lambda response (shown in panel D). (H) Same data as in panel G but after deconvolution. The erpimage also includes the residuals, the EEG activity not explained by the model. Saccade-related activity was successfully removed.

![img-18.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-19.jpg)

2019; Meyberg et al., 2015). As we show below, the direction of the preceding saccade has indeed a significant and nonlinear effect on the FRP during scene viewing.

# Participants

Ten young adults (19 to 29 years old; four female) with normal or corrected-to-normal visual acuity participated in the study.

# Methods

In the experiment, participants searched for a target stimulus hidden within images of natural scenes. Scenes consisted of grayscale versions of the first 33 images of the Zurich Natural Image Database (Einhäuser, Kruse, Hoffmann, &amp; König, 2006), a collection of photographs taken in a forest (see Figure 7A for an example). Scenes spanned  $28.8^{\circ} \times 21.6^{\circ}$  of visual angle  $(800 \times 600$  pixels) and were centered on an otherwise empty black screen (resolution,  $1024 \times 768$  pixels).

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

![img-19.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-20.jpg)
A

![img-20.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-21.jpg)
B

![img-21.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-22.jpg)
C

![img-22.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-23.jpg)
D

![img-23.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-24.jpg)
E

![img-24.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-25.jpg)
F

![img-25.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-26.jpg)
G

![img-26.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-27.jpg)
H

![img-27.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-28.jpg)
Figure 7. Visual search experiment with natural scenes. (A) Example scene with overlaid gaze path. (B) Distribution of saccade amplitudes and (C) saccade directions in the task. (D) FRP waveform over visual cortex without deconvolution (simple average, red line) and with deconvolution (blue line). Color-coded single-trial EEG of all participants (erpimage), sorted by the onset latency of the preceding  $(n - 1)$  fixation on the scene. (E) Same FRP data as in panel D. The erpimage shows the estimated deconvolved response plus the residuals—that is, the EEG activity not explained by the model. The overlapping activity from fixation  $n - 1$  was successfully removed. (F) Effect of saccade amplitude on the FRP, as revealed by the deconvolution model. Saccade amplitude modulates the

---

entire postsaccadic waveform, with EEG amplitude changing as a nonlinear function of saccade size for the P1 (lambda response) and as a more linear function for the N1 component. (G) When saccade size is plotted against P1 amplitude (within the gray-shaded interval in panel F), the nonlinear, logarithmic relationship becomes obvious. The solid line depicts the mean over participants; gray lines depict single-subject estimates. (H) The FRP is also affected by the direction of the preceding saccade, with upward saccades generating the strongest brain responses. This effect is again nonlinear and was therefore modeled by a set of circular spline functions coding the saccade angle. (I) Scalp topographies of the saccade direction effect at the latency of the second positive deflection (P2, 200--300 ms; see gray shading in panel H). A topographic lateralization for leftward versus rightward saccades and a differentiation between upward versus downward saccades can be seen.

One image was shown on each trial. The participant's task was to find a small dark gray dot (0.4 cd/m^{2}) that appeared at a random location within the scene at a random latency 8 to 16 seconds after scene onset. At first, the dot appeared with a diameter of just 0.07°, but then it gradually increased in size over the course of several seconds. When participants found the target, they pressed a button, which terminated the trial. A full manuscript on this dataset is currently in preparation.

For analysis, we specified the following model, which includes two types of events, the stimulus onset at the beginning of each trial and the onsets of fixations on the scene:

ERP ∼ 1 {for stimulus onsets}

FRP ∼ 1 + spl(fixation_position_x,5) + spl(fixation_position_y,5) + spl(sacc_amplitude,5) + circspl(sacc_angle,5,0,360) {for fixation onsets}

For the stimulus ERP, we included only an intercept term that captures the long-lasting ERP evoked by the presentation of the scene. Including it in the model ensures that FRPs are not distorted by the overlap with this stimulus ERP. For the fixation onset events, we modeled the horizontal and vertical fixation positions on the screen, as well as the incoming saccade amplitudes, using spline predictors. In addition, we modeled the direction of the incoming saccade. Because the angle of a saccade is a circular predictor, ranging from 0° to 360° of angle, it was modeled by a set of five circular splines (Ehinger & Dimigen, 2019). Responses were modeled in a time window from --400 to 800 ms around each event. To sum up the model, we modeled the ERP elicited by the scene onset and the FRPs elicited by each fixation on the scene and allowed for several nonlinear effects of saccade properties on the FRP. In the following, we focus on the results for two of these predictors: saccade amplitude and saccade angle.

## Results

Figures 7B and 7C summarize the eye movement behavior in the task. Saccades had a median amplitude of 4.9°, and fixations lasted on average 264 ms. Electrophysiological results are summarized in Figures 7D to 7I. Figures 7D and 7E compare the raw FRP (obtained with simple averaging, red line) to the regression-FRP obtained with the deconvolution model (blue line). The erpimages at the bottom of each panels show the corresponding EEG data at the single-trial level. To illustrate the impact of overlapping activity, single-trial epochs were sorted by the onset latency of the preceding fixation (n -- 1) on the scene. In the raw data (Figure 7D), it is obvious that the neural activity from fixation n -- 1 distorts the waveshape of the current fixation n, especially during the baseline interval. In the modeled data, which also include the residual activity not accounted for by the model (Figure 7E), activity aligned to fixation n -- 1 is no longer visible. Importantly, the lack of activity time-locked to fixation n -- 1 suggests that the neural activity during scene viewing was successfully modeled and corrected for overlapping activity.

Figures 7F and 7G show the partial effects of saccade amplitude and saccade direction taken from the deconvolution model. The isolated effect of saccade amplitude (Figures 7F and 7G) reveals a long-lasting impact of saccade size on the FRP waveform: At electrode Oz, located over primary visual cortex, saccade amplitude influenced all time points of the FRP up to 600 ms after fixation onset. Results also confirm that this effect is indeed highly nonlinear. The increase in P1 amplitude with saccade size was steep for smaller saccades (< 6°) but then slowly leveled off for larger saccades. Such nonlinearities were observed for all 10 participants (Figure 7G). It is obvious that a nonlinear model is more appropriate for these data than a linear one.

Interestingly, the angle of the incoming saccade also modulated the FRP in a highly nonlinear manner. In Figure 7H, this is shown for lateralized posterior electrode PO8, located over the right hemisphere. The corresponding scalp topographies for saccades of different directions are shown in Figure 7I, in the time window 200 to 300 ms after fixation onset. It can be seen how saccade direction changes the FRP scalp distribution, with rightward-going saccades generating higher amplitudes over the left hemisphere and vice versa. Note that this effect is not due to corneoretinal

---

artifacts, which were successfully suppressed with ICA. This effect of saccade direction is also not explained by different fixation locations on the screen following saccade offset (Dimigen et al. 2013), because horizontal and vertical fixation positions were also included as predictors in the model (results not shown here).

## Discussion

In this example, we simultaneously modeled the effects of some oculomotor covariates on FRPs. During scene viewing, these low-level covariates are often intercorrelated with each other (e.g. Nuthmann, 2017) and correlated with the high-level “cognitive” factors of interest (e.g. whether the fixated item is the search target). Furthermore, as we show here, they influence long intervals of the FRP waveform in a nonlinear way. A strictly linear model (e.g. linear saccade amplitude in Coco et al. 2020; Cornelissen et al. 2019; Kristensen, Guerin-Dugué, et al. 2017; Weiss et al. 2016) is therefore not ideal to capture these complex relationships.

In addition to the covariates discussed here, one could easily enter more low-level predictors into the model, such as the local luminance and local power spectrum of the currently foveated image region. Finally, to study cognitive effects on the fixation-related P300 component in this task (Dandekar, Ding, et al. 2012; Dias et al. 2013; Kamienkowski et al. 2012; Kaunitz et al. 2014), one could add a categorical predictor (0 or 1) coding whether the fixated screen region contains the search target that participants were looking for. The next example illustrates how we can reliably study the time course of such psychologically interesting effects during active vision.

## Experiment 3: Natural reading

In free-viewing experiments, the psychological manipulation of interest is typically linked to a change in fixation duration, which will distort the FRPs. A classic task to illustrate this problem and its solution via deconvolution modeling is reading. In ERP research on reading, sentences are traditionally presented word-by-word at the center of the screen. Although this serial visual presentation procedure controls for overlapping potentials, it differs in important ways from natural reading (Kliegl, Dambacher, Dimigen, & Sommer, 2014; Sereno & Rayner, 2003). One key property of visual word recognition that is neglected by serial presentation procedures is that the upcoming word in a sentence is usually previewed in parafoveal vision (eccentricity 2° to 5°) before the reader looks at it (Schotter, Angele, & Rayner, 2012). The parafoveal preprocessing then facilitates recognition of the word when the word has been fixated. This facilitation is evident in the classic preview benefit (Rayner, 1975) in behavior, such that words that were visible during preceding fixations receive 20- to 40-ms shorter fixations (Vasilev & Angele, 2017) than words that were gaze-contingently masked with a different word or a meaningless string of letters before being fixated.

Combined eye-tracking/EEG studies have recently established tentative neural correlates of this preview benefit in FRPs: an early effect, corresponding to a reduction of the late parts of the occipitotemporal N1 component between about 180 to 280 ms after fixation onset (preview positivity) that is sometimes followed by a later effect at around 400 ms that may reflect a reduction of the N400 component by preview (Degno, Loberg, Zang, Zhang, Donnelly, & Liversedge, 2019; Dimigen, Kliegl, & Sommer, 2012; Kornrumpf, Niefind, Sommer, & Dimigen, 2016; Li, Niefind, Wang, Sommer, & Dimigen, 2015). However, an inherent problem with all previously published studies is that the difference in fixation times measured on the target word also changes the overlap with the following fixations. This raises the question of to what degree the reported neural preview effects are real or are just a trivial consequence of the different overlap situation in the conditions with and without an informative preview. Below we demonstrate how nonlinear deconvolution modeling can answer this question by separating genuine preview effects from spurious overlap effects.

### Participants

Participants were native German speakers with normal or corrected-to-normal visual acuity (mean age, 25.7 years, range 18--45 years; 27 female). Here, we present results from the first 42 participants recorded in this study. A manuscript describing the full dataset is currently in preparation.

## Methods

Participants read 144 pairs of German sentences belonging to the Potsdam Sentence Corpus 3, a set of materials previously used in psycholinguistic ERP research and described in detail in Dambacher et al. (2012). On each trial, two sentences were successively presented as single lines of text on the monitor (Figure 8A). Participants read the sentences at their own pace and answered occasional multiple-choice comprehension questions presented randomly after one third of the trials. Sentences were displayed in a black font (Courier, 0.45° per character) on a white

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

![img-28.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-29.jpg)

![img-29.jpeg](source_images/regression-based-analysis-of-combined-eeg-and-eye-4cc1d6-fig-30.jpg)
Figure 8. Grand-average results from the sentence reading experiment  $(N = 42)$ . (A) Participants read sentences from left to right. For one target word, the parafoveal preview was manipulated with the boundary technique. (B) Preview benefit in behavior. Fixations on the target word (e.g., weapon) were  $41\mathrm{ms}$  shorter when the parafoveal preview shown during the preceding fixation was valid (correct word, highlighted here in blue) rather than invalid (random letter preview, red). (C) Grand-average FRP at left occipitotemporal electrode PO9, aligned to the first fixation on the target. Black bars indicate the extent of the clusters that contributed to the overall significant effect of preview on the FRP. Lower panel: Color-coded single-trial epochs sorted by the fixation duration on the target word reveal that the FRP waveform is a mixture of potentials evoked by the current and the next fixation. (D) Same data, but corrected for overlapping potentials. We can see that the middle cluster (from about  $382 - 400\mathrm{ms}$ ) has disappeared, because it was only caused by the different overlap situation in the valid/invalid condition. In contrast, the clusters around 228 to 306 ms (preview positivity) (Dimigen et al., 2012) and 480 to  $600\mathrm{ms}$  remain visible because they are not a trivial result of overlap. (E) The isolated overlapping activity from neighboring fixations differed significantly  $(p &lt; 0.05)$  between conditions. In addition to modulating the effect sizes of the early and late preview effect, overlap also produced the spurious middle-latency cluster (around  $390\mathrm{ms}$ ).

background. The second sentence contained a target word (e.g., "weapon") for which the parafoveal preview was manipulated using Rayner's (1975) boundary paradigm (Figure 8A). Before fixating the target word (that is, during the preceding fixations), readers saw either a correct preview for the target word (e.g., "weapon") or a non-informative preview that consisted of a meaningless but visually similar letter string of the same length (e.g., "vcrqcr"). During

the saccade to the target, while visual sensitivity is reduced (Matin, 1974), the preview mask was always gaze-contingently exchanged with the correct target word (e.g., "weapon"). This display change was executed with a mean latency of  $&lt; 10$  ms and typically was not noticed by the participants, as validated with a structured questionnaire after the experiment $^2$ .

To analyze the data, we first marked all trials that contained eye blinks, a loss of eye-tracking data, a late

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

|  | First-fixation duration, ms (1 SD) |  | Gaze duration, ms (1 SD) |  |
| --- | --- | --- | --- | --- |
|  | Invalid preview | Valid preview | Invalid preview | Valid preview |
| Pre-target word | 216 (32) | 211 (28) | 238 (45) | 230 (44) |
| Target word | 248 (36) | 207 (24) | 275 (44) | 224 (30) |

Table 1. Fixation times in the reading experiment.

display change (executed  $&gt;10$  ms after saccade offset), a skipping of the target word, or excessive non-ocular EEG artifacts. Remaining non-ocular artifacts were detected by shifting a 1000-ms-long moving window across the continuous EEG and by marking all intervals in which the window contained peak-to-peak voltage differences  $&gt;120~\mu \mathrm{V}$  in any channel. In the deconvolution framework, these "bad" intervals can then be easily excluded by setting all columns of the design matrix to 0 during these intervals (Smith &amp; Kutas, 2015a). The mean number of remaining target fixations per participant was 51.0 (range, 36-65) for the invalid preview condition and 44.1 (range, 29-59) for the valid preview condition.

In the second step, we modeled both the ERP elicited by the sentence onset (with its intercept only) and the FRP evoked by each reading fixation. The model specified was

ERP  $\sim 1$

FRP  $\sim 1 +$  cat(is_targetword) *

cat(is_previewed) + spl(sac_amplitude, 5)

where is_targetword and is_previewed are both binary categorical predictors coding whether or not a fixation was on the manipulated target word and whether or not that target word had been visible during preceding fixations, respectively. Saccade amplitude was again modeled by a spline predictor. We estimated the responses from  $-300$  to  $+800$  ms around each event and baseline-corrected the resulting waveforms by subtracting the interval from  $-100$  to  $0$  ms. For second-level group statistics, the interval between  $-300$  and  $+600$  ms after fixation onset at occipitotemporal channel PO9 was submitted to the threshold-free cluster enhancement permutation test.

# Results and discussion

Table 1 reports the fixation durations in the target region of the sentence. The average duration of all fixations during sentence reading (including the usually shorter refixations on words) was only  $207\mathrm{ms}$ , meaning that FRPs were strongly overlapped by those from preceding and subsequent fixations. Figure 8B visualizes the distribution of first-fixation durations on the target word (e.g., "weapon") as a function of whether the

preview for this word was valid (blue line) or invalid (red line). Note that the two conditions differ only in terms of what the participant saw as a preview during the preceding pre-target fixation. As expected, fixation durations on the pre-target word were not significantly affected by the preview manipulation. However, the subsequent first fixation on the target word itself was on average 41 ms shorter in the condition in which a valid rather than an invalid preview was provided. This preview benefit was significant,  $t(41) = 10.82$ ,  $p &lt; 0.0001$ . In gaze duration, which is the summed duration of all first-pass fixations on the target word, the effect was also significant, with a difference of 51 ms,  $t(41) = 11.83$ ,  $p &lt; 0.0001$ . These results replicate the classic preview benefit in behavior (Rayner, 1975).

Figure 8C presents the corresponding FRP waveforms. The plotted channel is PO9, a left-hemispheric occipitotemporal electrode where the strongest preview effects have been observed previously (Dimigen et al., 2012; Kornrumpf et al., 2016). Time zero marks the fixation onset on the target word. Note that, at this time, readers were always looking at the correct target word; the two conditions differ only in terms of what was parafoeally visible during the preceding fixation. As Figure 8C shows, permutation testing revealed a significant effect  $(p &lt; 0.05$ , under control of multiple comparisons) of preview condition on the FRP after conventional averaging (without deconvolution). Black bars in Figures 7C, 7D, and 7E highlight the duration of the underlying temporal clusters at electrode PO9. Please note that because these clusters are computed during the first stage of the permutation test (Sassenhagen &amp; Draschkow, 2019) they are themselves not stringently controlled for multiple comparisons (unlike the overall test result). However, their temporal extent provides some indication of the intervals that likely contributed to the overall significant effect of preview.

With conventional averaging, clusters extended across three intervals after fixation onset: early, 228-306 ms; middle, 382-400 ms; and late, 480-600 ms (black bars in Figure 8C). However, if we look at the underlying single-trial EEG activity sorted by the fixation duration on the target word (lower panel of Figure 8C), it becomes obvious that a relevant part of the brain potentials after 200 ms is not generated by the fixation on the target word but by the next fixation  $(n + 1)$  within the sentence. Because this next fixation

---

begins on average 41 ms later in the invalid preview condition (see Table 1), this creates a spurious condition difference in the FRP.

Figure 8D shows the same data, corrected for overlapping potentials. In the sorted single-trial data (lower panel), the activity related to the target fixation is preserved, whereas that from the next fixation (n + 1) is removed. Crucially, the overall significant effect of preview (p < 0.05) is preserved. However, instead of three, we now observe only two clusters, one extending from 232 to 300 ms (reflecting the early preview positivity) and another late one, beginning at 490 ms and lasting until the end of the epoch at 600 ms (possibly reflecting a preview effect on the N400). In contrast, the middle cluster around 390 ms has disappeared, because this difference was only caused by overlapping activity. This confounding effect of overlapping potentials is confirmed in Figure 8E, which shows just the activity produced by the neighboring non-target fixations. The permutation test confirmed that this overlapping activity alone produced a significant difference between conditions (p < 0.05) in three intervals (Figure 8E, black bars). In addition to modulating the strength of the genuine early and late preview effects, overlapping potentials produced the entirely spurious mid-latency effect at around 390 ms.

## Discussion

Existing studies on neural preview effects did not control for the signal distortions produced by the corresponding difference in fixation time. Our analysis confirms for the first time, to the best of our knowledge, that the previously reported neural preview effects are not trivial artifacts of overlapping activity but genuine consequences of parafoveal processing. This insight is important because during natural vision many visual objects are already partially processed in the parafoveal or peripheral visual field before they enter the fovea. In other words, although ERP research has traditionally presented isolated visual objects during steady fixation, objects during natural vision are typically primed and/or partially predictable based on a coarse extrafoveal preview of the object. Indeed, a similar preview effect, as shown here for words, was recently also reported for the N170 component of previewed human faces (Buonocore, Dimigen, & Melcher, 2020; de Lissa et al. 2019; Huber-Huber, Buonocore, Dimigen, Hickey, & Melcher, 2019). Together, these results indicate that the attenuation of the late N1 and N170 components by preview may be a characteristic feature of visual object recognition under real-world conditions.

In summary, the application to reading demonstrates how deconvolution can disentangle genuine cognitive effects from spurious effects of overlap, allowing us to resolve the precise time course of mental processes within a single fixation duration during natural vision.

## General discussion

Fixation-related potentials are a promising and data-rich tool to study the dynamics of visual cognition under ecologically valid conditions. In this article, we have outlined an integrated regression-based analysis framework for combined eye-tracking/EEG experiments that integrates deconvolution modeling with nonlinear spline regression. Applications of this approach to three commonly studied paradigms showed that this analysis framework can effectively control for the confounding effects of overlap and low-level covariates on fixation-related brain activity, thereby providing new insights into cognitive processes during active vision.

In the face recognition study, our analysis confirmed that overlapping muscle and brain potentials from small involuntary (micro)saccades are problematic and contained in the majority of trials of “traditional” EEG experiments. However, with a simple deconvolution model, these saccade-related potentials could be effectively isolated and removed to obtain clean stimulus-locked ERPs for the presented faces. This also raises the interesting possibility of using the now isolated eye movement-related brain potentials as an additional source of information about the participant's attentional, cognitive, or affective processing in the task (Guérin-Dugué et al. 2018; Meyberg et al. 2015).

The scene viewing example was included to show that at least some of the (numerous) visual and oculomotor low-level influences on the FRP during free viewing are highly nonlinear. In addition to the effect of saccade amplitude, our analysis revealed a previously unreported nonlinear effect of the angle of the incoming saccade on the FRP. Both effects could be modeled by adding spline predictors to the model. The scene viewing results also illustrate how deconvolution can produces FRP waveforms with a clean and unbiased baseline interval.

Finally, the application to natural reading demonstrates how spurious effects due to different fixation durations can be controlled. This allowed us to describe the time course of neural preview benefits during reading in an unbiased manner. In contrast, the simple averaging approach used in previous studies (e.g. Degno et al. 2019; Dimigen et al. 2012; Kornrumpf et al. 2016) will have necessarily produced incorrect conclusions about the exact timing and duration of the effect. In the following, we further discuss the

---

underlying assumptions, possibilities, and existing limitations of the proposed (non)linear deconvolution approach for combined eye-tracking/EEG research and outline some interesting future perspectives.

## Assumptions of deconvolution models

Traditional ERP averaging is based on the assumption that the underlying event-related response is invariant across all epochs of a given condition and that the average is therefore a sensible description of the individual trials (Otten & Rugg, 2005). This assumption is likely incorrect, as cortical information processing likely varies between trials, as also indicated by trial-to-trial differences in reaction times. Deconvolution models are based on the same assumption—namely, that the fixation-related response is the same, regardless of the amount of overlap. In other words, we rely on the somewhat unrealistic assumption that the neural response does not differ between short and long fixations. The same assumption also concerns sequences of fixations. From ERP research, we know that the processing of one stimulus can change the processing of the next one due to adaptation, habituation, or priming (e.g. Schweinberger & Neumann, 2016). Again, it would be surprising if these factors do not also modulate the FRP waveform while a stimulus is rapidly scanned with several saccades. If such sequential effects occur often enough in an experiment, they can be explicitly modeled within the deconvolution framework. For example, in a scene viewing study, one could add an additional predictor that codes whether a fixation happened early or late after scene onset (Fischer, Graupner, Velichkovsky, & Pannasch, 2013) or whether it was the first fixation or a refixation on a particular image region (Meghanathan et al. 2020).

## Baseline correction and placement

In ERP research, baseline correction is performed to accommodate for slow drifts in the signal due, for example, to changes in skin potential (Luck, 2014). The baseline interval is typically placed in a “neutral” interval immediately before stimulus onset. In experiments with multiple saccades, it is more difficult to find an appropriate neutral baseline. The first reason for this is of a methodological nature and directly linked to the problems of overlap and covariates; the baseline for the FRP is often biased because of differences in the duration of the preceding fixation, differences in the size of the preceding saccade, or because of a different overlap with the stimulus-onset ERP. Several workarounds have been proposed to deal with this problem, such as placing the baseline before trial onset (Dimigen et al. 2011; Nikolaev et al. 2016), before an earlier fixation (Coco et al. 2020; Degno et al. 2019), or in the first few milliseconds after fixation onset (de Lissa et al. 2019; Hutzler et al. 2007; Simola, Le Fevre, Torniainen, & Baccino, 2014; for an illustration of different baseline placement options, see Nikolaev et al. 2016). With deconvolution, this is no longer necessary, because we can effectively remove the overlapping activity and covariate effects from the baseline. In our experience, the baseline intervals of the deconvolved FRPs are essentially flat (as also visible in Figure 7E), which means that a conventional baseline correction can be applied to the deconvolved FRPs.

A second reason why the baseline should still be chosen carefully are the effects of extrafoveal preprocessing. Because viewers obtain some information about soon-to-be fixated items in parafoveal and peripheral vision, EEG effects may in some cases already begin before an object is foveated (e.g. Baccino & Manunta, 2005; Luo et al. 2009). In paradigms where such parafoveal-on-foveal effects are likely to occur, it may therefore still be sensible to place the baseline interval further away from fixation onset, even after overlapping potentials have been removed. An even better option would be to capture these parafoveal-on-foveal effects in the model itself by adding the pre-target fixations as a separate type of event to the model. For example, in the reading experiment reported above, rather than coding the status of each reading fixation (in the predictor is_targetword) as non-target fixation (0) or target fixation (1), we could have added a third category of events for pre-target fixations (those on the word before the target word). In this way, any potential parafoveal-on-foveal effects produced by seeing the parafoveal non-word mask during the pre-target fixation could be disentangled from the neural preview benefits after fixating the target.

## Time--frequency analysis

Although most EEG datasets during free viewing have so far been analyzed in the time domain, it is also possible to study eye-movement-related changes in oscillatory power and phase (Bodis-Wollner et al. 2002; Gaarder et al. 1966; Hutzler, Vignali, Hawelka, Himmelstoss, & Richlan, 2016; Kaiser, Brunner, Leeb, Neuper, & Pfurtscheller, 2009; Kornrumpf, Dimigen, & Sommer, 2017; Metzner, von der Malsburg, Vasishth, & Rösler, 2015; Nikolaev et al. 2016; Ossandón et al. 2010). Event-related responses in the frequency domain, such as induced changes in power, can last for several seconds and are likely biased by overlapping activity in much the same way as FRPs (Litvak et al. 2013; Ossandón, König, & Heed, 2019). To address this problem, Ossandón and colleagues (Ossandón et

---

al., 2019) recently used the Hilbert transformation to obtain instantaneous power of the EEG in the alpha band. They then deconvolved the bandpass-filtered and rectified signal, showing that deconvolution can also be applied to EEG oscillations. Deconvolution is also an interesting option to correct for the spectral artifacts that are produced by involuntary microsaccades in time--frequency analyses (Yuval-Greenberg et al. 2008). Specifically, the results of the face recognition experiment (Figure 6D) suggest that deconvolution is able to isolate the saccadic spike potential, the eye muscle artifact known to produce strong distortions in the gamma band (>30 Hz) of the EEG. Cognitive influences on stimulus-induced gamma oscillations can therefore likely be disentangled from microsaccade artifacts if the continuous gamma band power (rather than the raw EEG) is entered into the model.

An unresolved question concerns the most suitable measure of spectral power to put into the deconvolution model. Litvak and colleagues (2013) conducted simulations on this issue where they compared the model fits (R^{2}) for different measures of spectral power (raw power, log power, square root of power) and obtained the best results for the square root of power. Further simulations are needed to see which of these transformations is most suitable or whether the differences are negligible in practice.

### Improving the understanding of fixation-related brain activity

There are many ways to further improve the estimation of FRPs during free viewing. For example, the lambda response, the predominantly visually evoked P1 response following fixation onset, is not fully understood. Existing evidence suggests that it is itself a compound response, consisting of at least two separate subcomponents: a visual “off” response produced by the beginning of the saccade and a visual “on” response following the inflow of new visual information at saccade offset (Kazai & Yagi, 2003; Kurtzberg & Vaughan, 1982; Thickbroom et al. 1991). Potentially, deconvolution could be used to separate saccade onset- and saccade offset-related contributions to the lambda response. Another promising application is to isolate the possible neural correlates of the perisaccadic retinal stimulation—for example, due to gaze-contingent display changes (Chase & Kalil, 1972; Kleiser, Skrandies, & Anagnostou, 2000; Skrandies & Laschke, 1997). Finally, if eye blinks are also added as events to the data, then deconvolution offers an elegant way to analyze or to correct for blink-related potentials in the EEG (Bigdely-Shamlo, Touryan, Ojeda, Kothe, Mullen, & Robbins, 2020).

Another interesting feature of linear deconvolution is that it is possible to add temporally continuous signals, rather than only discrete event onsets, as predictors to the time-expanded design matrix (Gonçalves, Whelan, Foxe, & Lalor, 2014; Lalor, Pearlmutter, Reilly, McDarby, & Foxe, 2006). In the literature, this is typically referred to as the temporal response function approach (Crosse, Di Liberto, Bednar, & Lalor, 2016). This approach can be combined with the deconvolution approach summarized in the present paper (which uses discrete event onsets as regressors), and it is also implemented in the unfold toolbox. For example, to partially correct for corneoretinal artifacts, one could add a column to the time-expanded design matrix that contains the continuous gaze position signal of the eye tracker, which will then be regressed out from the EEG (as suggested by Dandekar, Privitera, et al. 2012). Yet another possibility is to add the pupil diameter as a time-continuous predictor. The idea would be that the momentary level of arousal and mental load, as indexed by pupil size, will correlate with the amplitude of the neural response. Other continuous signals that could be added as predictors include the luminance profile of a continuously changing stimulus (e.g. of a video watched by the participant) or the sound envelope of concurrent auditory stimuli (e.g. the sound channel of the movie). Finally, signals from accelerometers and other motion sensors could help to account for the head and body movements that characterize visual exploration behavior outside of the laboratory (Ehinger, Fischer, Gert, Kaufhold, Weber, Pipa, & König, 2014; Gramann, Jung, Ferris, Lin, & Makeig, 2014).

### Integrating deconvolution with linear mixed models

In the present work, we used the two-stage statistical approach that is also commonly used with mass univariate models (Pernet et al. 2011). Here, the regression ERPs (betas) are first computed individually for each participant and then entered into a second-level group analysis (e.g. an analysis of variance or a permutation test). Compared to this hierarchical approach, linear mixed-effects models (e.g. Gelman and Hill, 2007) provide a number of advantages (Baayen, Davidson, & Bates, 2008; Kliegl, Wei, Dambacher, Yan, & Zhou, 2011), such as the option to include crossed random effects for subjects and items. Mixed models are often used to analyze fixation durations (e.g. Ehinger, Kaufhold, & König, 2018; Kliegl, 2007; Nuthmann, 2017) and more recently also FRPs (Degno et al. 2019; Dimigen et al. 2011). In the long term, it will be promising to integrate deconvolution with mixed-effects modeling (Ehinger, 2019), but this will require large computational resources (because the EEG data of all participants have to be fitted simultaneously) as well as new algorithms for estimating sparse mixed-effects

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

models (Bates et al., 2020; Wood, Li, Shaddick, &amp; Augustin, 2017).

# Toward a full-analysis pipeline for free-viewing EEGs

In Figure 1, we summarized four challenges that have complicated combined eye-tracking/EEG research in the past. We believe that there are now adequate solutions to all four problems. For example, the unfold toolbox used for the current analyses is compatible with the existing EYE-EEG toolbox. In a first step, EYE-EEG can be used to synchronize the recordings, to add saccade and fixation events to the data, and to suppress eye movement artifacts with specialized ICA procedures. The artifact-corrected EEG can then be read into the unfold toolbox to model the fixation-related neural responses. Taken together, the two toolboxes provide one possible open-source pipeline that addresses the four problems.

# Conclusions

In this paper we have presented a framework for analyzing eye-movement-related brain responses and exemplified its advantages for three common paradigms. By controlling for overlapping potentials and low-level influences, the regression-based (non)linear deconvolution framework allows us to study new exciting phenomena that were previously difficult or impossible to investigate. In combination with existing approaches for data integration and artifact correction, this opens up new possibilities for investigating the electrophysiological correlates of natural vision without compromising data quality.

Keywords: EEG, eye-tracking, free viewing, eye-fixation-related potentials (EFRPs), rERP, general linear model (GLM), generalized additive model (GAM), face perception, microsaccades, scene viewing, reading

# Acknowledgments

The authors thank Linda Gerresheim and Anna Pajkert for their help with collecting some of the datasets used here, as well as Anna Lisa Gert, Peter König, and Lisa Spiering for feedback on this work.

Collection of the reading dataset was supported by a grant from Deutsche Forschungsgemeinschaft (DFG FG 868-A2). We also acknowledge support by

the DFG and the Open Access Publication Fund of Humboldt-Universität zu Berlin.

Commercial relationships: none.

Corresponding authors: Olaf Dimigen; Benedikt Ehinger.

Email: olaf.dimigen@hu-berlin.de; behinger@uos.de.

Address: Department of Psychology, Humboldt-Universität zu Berlin, Berlin, Germany; Institute of Cognitive Science, Universität Osnabrück, Osnabrück, Germany.

*OD and BVE contributed equally to this article.

# Footnotes

1. The number of splines that cover the range of the predictor determines how flexible the fit is. A larger number of splines allows us to model more complex relationships but also increases the risk of overfitting the data. See section "Modeling nonlinear effects" above and Ehinger and Dimigen (2019) for discussions.
2. The target word in the second sentence was also manipulated in terms of its contextual predictability and lexical frequency (Dambacher et al., 2012). Here we focus only on the factor preview.

# References

Altman, D. G., &amp; Royston, P. (2006). The cost of dichotomising continuous variables. *British Medical Journal*, 332(7549), 1080.
Amsel, B. D. (2011). Tracking real-time neural activation of conceptual knowledge using single-trial event-related potentials. *Neuropsychologia*, 49(5), 970–983.
Armington, J. C. (1978). Potentials that precede small saccades. In J. C. Armington, J. Krauskopf, &amp; B. R. Wooten (Eds.), *Visual psychophysics and physiology: A volume dedicated to Lorrin Riggs* (pp. 363–372). New York: Academic Press.
Armington, J. C., &amp; Bloom, M. B. (1974). Relations between the amplitudes of spontaneous saccades and visual responses. *Journal of the Optical Society of America*, 64(9), 1263–1271.
Armington, J. C., Gaarder, K., &amp; Schick, A. M. (1967). Variation of spontaneous ocular and occipital responses with stimulus patterns. *Journal of the Optical Society of America*, 57(12), 1534–1539.
Austin, P. C., &amp; Brunner, L. J. (2004). Inflation of the type I error rate when a continuous confounding variable is categorized in logistic regression analyses. *Statistics in Medicine*, 23(7), 1159–1178.
Baayen, R. H., Davidson, D. J., &amp; Bates, D. M. (2008). Mixed-effects modeling with crossed random effects

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

for subjects and items. Journal of Memory and Language, 59(4), 390-412.
Baccino, T. (2011). Eye movements and concurrent event-related potentials: Eye fixation-related potential investigations in reading. In S. P. Liversedge, I.D. Gilchrist, &amp; S. Everling (Eds.), The Oxford handbook of eye movements (pp. 857-870). Oxford, UK: Oxford University Press.
Baccino, T., &amp; Manunta, Y. (2005). Eye-fixation-related potentials: Insight into parafoveal processing. Journal of Psychophysiology, 19(3), 204-215.
Bach, M. (2006). The Freiburg Visual Acuity Test variability unchanged by post-hoc re-analysis. Graefe's Archive for Clinical and Experimental Ophthalmology, 245(7), 965-971.
Baekgaard, P., Petersen, M. K., &amp; Larsen, J. E. (2014). In the twinkling of an eye: Synchronization of EEG and eye-tracking based on blink signatures. In 2014 4th International Workshop on Cognitive Information Processing (CIP) (pp. 1-6). Piscataway, NJ: Institute of Electrical and Electronics Engineers.
Bates, D., Alday, P., Kleinschmidt, D., Calderon, J. B. S., Noack, A., &amp; Kelman, T., ...Baldassari, A. (2020). JuliaStats/MixedModels.jl: v2.3.0. Retrieved from https://zenodo.org/record/3727845#.X3szIx17lUM.
Becker, W., Hoehne, O., Iwase, K., &amp; Kornhuber, H. H. (1972). Readiness potential, pre-motor positivity and other changes of cortical potential in saccadic eye movements [article in German]. Vision Research, 12(3), 421-436.
Bennette, C., &amp; Vickers, A. (2012). Against quantiles: Categorization of continuous variables in epidemiologic research, and its discontents. BMC Medical Research Methodology, 12, 21.
Berg, P., &amp; Scherg, M. (1994). A multiple source approach to the correction of eye artifacts. Electroencephalography and Clinical Neurophysiology, 90(3), 229-241.
Bigdely-Shamlo, N., Touryan, J., Ojeda, A., Kothe, C., Mullen, T., &amp; Robbins, K. (2020). Automated EEG mega-analysis II: Cognitive aspects of event related features. NeuroImage, 207, 116054.
Blinn, K. A. (1955). Focal anterior temporal spikes from external rectus muscle. Electroencephalography and Clinical Neurophysiology, 7(2), 299-302.
Bodis-Wollner, I., Von Gizycki, H., Avitable, M., Hussain, Z., Javeid, A., &amp; Habib, A., ...Sabet, M. (2002). Perisaccadic occipital EEG changes quantified with wavelet analysis. Annals of the New York Academy of Sciences, 956, 464-467.
Boylan, C., &amp; Doig, H. R. (1989). Effect of saccade size on presaccadic spike potential amplitude.

Investigative Ophthalmology and Visual Science, 30(12), 2521-2527.
Brouwer, A.-M., Reuderink, B., Vincent, J., van Gerven, M. A. J., &amp; van Erp, J. B. F. (2013). Distinguishing between target and nontarget fixations in a visual search task using fixation-related potentials. Journal of Vision, 13(3):17, 1-10, https://doi.org/10.1167/13.3.17.
Buonocore, A., Dimigen, O., &amp; Melcher, D. (2020). Post-saccadic face processing is modulated by presaccadic preview: Evidence from fixation-related potentials. The Journal of Neuroscience, 40(11), 2305-2313.
Burns, M. D., Bigdely-Shamlo, N., Smith, N. J., Kreutz-Delgado, K., &amp; Makeig, S. (2013). Comparison of averaging and regression techniques for estimating event related potentials. In Conference Proceedings: Annual International Conference of the IEEE Engineering in Medicine and Biology Society (pp. 1680-1683). Piscataway, NJ: Institute of Electrical and Electronics Engineers.
Chase, R., &amp; Kalil, R. E. (1972). Suppression of visual evoked responses to flashes and pattern shifts during voluntary saccades. Vision Research, 12(2), 215-220.
Coco, M. I., Nuthmann, A., &amp; Dimigen, O. (2020). Fixation-related brain potentials during semantic integration of object-scene information. Journal of Cognitive Neuroscience, 32(4), 571-589.
Collins, G. S., Ogundimu, E. O., Cook, J. A., Le Manach, Y., &amp; Altman, D. G. (2016). Quantifying the impact of different approaches for handling continuous predictors on the performance of a prognostic model. Statistics in Medicine, 35(23), 4124-4135.
Cooper, R., McCallum, W. C., Newton, P., Papakostopoulos, D., Pocock, P. V., &amp; Warren, W. J. (1977). Cortical potentials associated with the detection of visual events. Science, 196(4285), 74-77.
Cornelissen, T., Sassenhagen, J., &amp; Vö, M. L.-H. (2019). Improving free-viewing fixation-related EEG potentials with continuous-time regression. Journal of Neuroscience Methods, 313, 77-94.
Craddock, M., Martinovic, J., &amp; Müller, M. M. (2016). Accounting for microsaccadic artifacts in the EEG using independent component analysis and beamforming. Psychophysiology, 53(4), 553-565.
Crosse, M. J., Di Liberto, G. M., Bednar, A., &amp; Lalor, E. C. (2016). The multivariate temporal response function (mTRF) toolbox: A MATLAB toolbox for relating neural signals to continuous stimuli. Frontiers in Human Neuroscience, 10, 604.

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

Dale, A. M., &amp; Buckner, R. L. (1997). Selective averaging of rapidly presented individual trials using fMRI. Human Brain Mapping, 5(5), 329-340.
Dambacher, M., Dimigen, O., Braun, M., Wille, K., Jacobs, A. M., &amp; Kliegl, R. (2012). Stimulus onset asynchrony and the timeline of word recognition: Event-related potentials during sentence reading. Neuropsychologia, 50(8), 1852-1870.
Dandekar, S., Ding, J., Privitera, C., Carney, T., &amp; Klein, S. A. (2012). The fixation and saccade P3. PLoS One, 7(11), e48761.
Dandekar, S., Privitera, C., Carney, T., &amp; Klein, S. A. (2012). Neural saccadic response estimation during natural viewing. Journal of Neurophysiology, 107(6), 1776-1790.
de Lissa, P., McArthur, G., Hawelka, S., Palermo, R., Mahajan, Y., Degno, F., ... Hutzler, F. (2019). Peripheral preview abolishes N170 face-sensitivity at fixation: Using fixation-related potentials to investigate dynamic face processing. Visual Cognition, 27(9-10), 740-759.
Degno, F., Loberg, O., Zang, C., Zhang, M., Donnelly, N., &amp; Liversedge, S. P. (2019). Parafoveal previews and lexical frequency in natural reading: Evidence from eye movements and fixation-related potentials. Journal of Experimental Psychology: General, 148(3), 453-474.
Delorme, A., &amp; Makeig, S. (2004). EEGLAB: An open source toolbox for analysis of single-trial EEG dynamics including independent component analysis. Journal of Neuroscience Methods, 134(1), 9-21.
Dias, J. C., Sajda, P., Dmochowski, J. P., &amp; Parra, L. C. (2013). EEG precursors of detected and missed targets during free-viewing search. Journal of Vision, 13(13):13, 1-19, https://doi.org/10.1167/13.13.13.
Dimigen, O. (2020). Optimizing the ICA-based removal of ocular EEG artifacts from free viewing experiments. NeuroImage, 207, 116117.
Dimigen, O., Kliegl, R., &amp; Sommer, W. (2012). Trans-saccadic parafoveal preview benefits in fluent reading: A study with fixation-related brain potentials. NeuroImage, 62(1), 381-393.
Dimigen, O., Sommer, W., Hohlfeld, A., Jacobs, A. M., &amp; Kliegl, R. (2011). Coregistration of eye movements and EEG in natural reading: Analyses and review. Journal of Experimental Psychology: General, 140(4), 552-572.
Dimigen, O., Sommer, W., &amp; Kliegl, R. (2013). Fixation-related potentials during scene perception. Journal of Eye Movement Research, 6(3).
Dimigen, O., Valsecchi, M., Sommer, W., &amp; Kliegl, R. (2009). Human microsaccade-related visual

brain responses. Journal of Neuroscience, 29(39), 12321-12331.
Ehinger, B. (2019). Unmixed: Linear mixed models combined with overlap correction for M/EEG analyses. An extension to the unfold Toolbox. In 2019 Conference on Cognitive Computational Neuroscience (pp. 867-870). College Station, TX: Conference Management Services.
Ehinger, B. V., &amp; Dimigen, O. (2019). Unfold: An integrated toolbox for overlap correction, non-linear modeling, and regression-based EEG analysis. PeerJ, 7, e7838.
Ehinger, B. V., Fischer, P., Gert, A. L., Kaufhold, L., Weber, F., Pipa, G., ... König, P. (2014). Kinesthetic and vestibular information modulate alpha activity during spatial navigation: A mobile EEG study. Frontiers in Human Neuroscience, 8, 71.
Ehinger, B. V., Kaufhold, L., &amp; König, P. (2018). Probing the temporal dynamics of the exploration-exploitation dilemma of eye movements. Journal of Vision, 18(3):6, 1-24, https://doi.org/10.1167/18.3.6.
Einhäuser, W., Kruse, W., Hoffmann, K. P., &amp; König, P. (2006). Differences of monkey and human overt attention under natural conditions. Vision Research, 46(8-9), 1194-1209.
Engbert, R., &amp; Kliegl, R. (2003). Microsaccades uncover the orientation of covert attention. Vision Research, 43(9), 1035-1045.
Everling, S., Krappmann, P., &amp; Flohr, H. (1997). Cortical potentials preceding pro- and antisaccades in man. Electroencephalography and Clinical Neurophysiology, 102(4), 356-362.
Eysholdt, U., &amp; Schreiner, C. (1982). Maximum length sequences—a fast method for measuring brain-stem-evoked responses. Audiology, 21(3), 242-250.
Fischer, T., Graupner, S.-T., Velichkovsky, B. M., &amp; Pannasch, S. (2013). Attentional dynamics during free picture viewing: Evidence from oculomotor behavior and electrocortical activity. Frontiers in Systems Neuroscience, 7, 17.
Gaarder, K., Koresko, R., &amp; Kropfl, W. (1966). The phasic relation of a component of alpha rhythm to fixation saccadic eye movements. Electroencephalography and Clinical Neurophysiology, 21(6), 544-551.
Gaarder, K., Krauskopf, J., Graf, V., Kropfl, W., &amp; Armington, J. C. (1964). Averaged brain activity following saccadic eye movement. Science, 146(3650), 1481-1483.
Gelman, A., &amp; Hill, J. L. (2007). Data analysis using regression and multilevel/hierarchical models. Cambridge, UK: Cambridge University Press.

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

Glover, G. H. (1999). Deconvolution of impulse response in event-related BOLD fMRI. NeuroImage, 9(4), 416-429.
Gonçalves, N. R., Whelan, R., Foxe, J. J., &amp; Lalor, E. C. (2014). Towards obtaining spatiotemporally precise responses to continuous sensory stimuli in humans: A general linear modeling approach to EEG. NeuroImage, 97, 196-205.
Gramann, K., Jung, T.-P., Ferris, D. P., Lin, C.-T., &amp; Makeig, S. (2014). Toward a new cognitive neuroscience: Modeling natural brain dynamics. Frontiers in Human Neuroscience, 8, 444.
Guérin-Dugué, A., Roy, R. N., Kristensen, E., Rivet, B., Vercueil, L., &amp; Tcherkassof, A. (2018). Temporal dynamics of natural static emotional facial expressions decoding: A study using event- and eye fixation-related potentials. Frontiers in Psychology, 9, 1190.
Hansen, J. C. (1983). Separation of overlapping waveforms having known temporal distributions. Journal of Neuroscience Methods, 9(2), 127-139.
Hauk, O., Davis, M. H., Ford, M., Pulvermüller, F., &amp; Marslen-Wilson, W. D. (2006). The time course of visual word recognition as revealed by linear regression analysis of ERP data. NeuroImage, 30(4), 1383-1400.
Henderson, J. M., Luke, S. G., Schmidt, J., &amp; Richards, J. E. (2013). Co-registration of eye movements and event-related potentials in connected-text paragraph reading. Frontiers in Systems Neuroscience, 7, 28.
Hendrix, P., Baayen, H., &amp; Bolger, P. (2017). Distinct ERP signatures of word frequency, phrase frequency, and prototypicality in speech production. Journal of Experimental Psychology: Learning, Memory, and Cognition, 43(1), 128-149.
Herdman, A. T., &amp; Ryan, J. D. (2007). Spatio-temporal brain dynamics underlying saccade execution, suppression, and error-related feedback. Journal of Cognitive Neuroscience, 19(3), 420-432.
Huber-Huber, C., Buonocore, A., Dimigen, O., Hickey, C., &amp; Melcher, D. (2019). The peripheral preview effect with faces: Combined EEG and eye-tracking suggests multiple stages of trans-saccadic predictive processes. NeuroImage, 200, 344-362.
Hutzler, F., Braun, M., Vô, M. L. H., Engl, V., Hofmann, M., &amp; Dambacher, M., ...Jacobs, A. M. (2007). Welcome to the real world: Validating fixation-related brain potentials for ecologically valid settings. *Brain Research*, 1172(1), 124-129.
Hutzler, F., Vignali, L., Hawelka, S., Himmelstoss, N. A., &amp; Richlan, F. (2016). Oscillatory brain dynamics during sentence reading: A fixation-related spectral perturbation analysis. Frontiers in Human Neuroscience, 10, 191.

Jung, T.-P., Humphries, C., Lee, T.-W., Makeig, S., McKeown, M. J., Iragui, V., ... Sejnowski, T. J. (1998). Extended ICA removes artifacts from electroencephalographic recordings. Advances in Neural Information Processing Systems, 10, 894-900.
Kaiser, V., Brunner, C., Leeb, R., Neuper, C., &amp; Pfurtscheller, G. (2009). Investigation of cue-based vertical and horizontal eye movements with electroencephalographic and eye-tracking data. Clinical Neurophysiology, 120(11), 1988-1993.
Kamienkowski, J. E., Ison, M. J., Quiroga, R. Q., &amp; Sigman, M. (2012). Fixation-related potentials in visual search: A combined EEG and eye-tracking study. Journal of Vision, 12(7):4, 1-20, https://doi.org/10.1167/12.7.4.
Kaunitz, L. N., Kamienkowski, J. E., Varatharajah, A., Sigman, M., Quiroga, R. Q., &amp; Ison, M. J. (2014). Looking for a face in the crowd: Fixation-related potentials in an eye-movement visual search task. NeuroImage, 89, 297-305.
Kazai, K., &amp; Yagi, A. (2003). Comparison between the lambda response of eye-fixation-related potentials and the P100 component of pattern-reversal visual evoked potentials. Cognitive, Affective and Behavioral Neuroscience, 3(1), 46-56.
Keren, A. S., Yuval-Greenberg, S., &amp; Deouell, L. Y. (2010). Saccadic spike potentials in gamma-band EEG: Characterization, detection and suppression. NeuroImage, 49(3), 2248-2263.
Kleiser, R., Skrandies, W., &amp; Anagnostou, E. (2000). Electrophysiological correlates of human intrasaccadic processing. Experimental Brain Research, 130(2), 177-187.
Kliegl, R. (2007). Toward a perceptual-span theory of distributed processing in reading: A reply to Rayner, Pollatsek, Drieghe, Slattery, and Reichle (2007). Journal of Experimental Psychology: General, 136(3), 530-537.
Kliegl, R., Dambacher, M., Dimigen, O., &amp; Sommer, W. (2014). Oculomotor control, brain potentials, and timelines of word recognition during natural reading. In M. Horsely, M. Eliot, B. Knight, &amp; R. Reilly (Eds.), Current trends in eye-tracking research (pp. 141-155). Basel, Switzerland: Springer International.
Kliegl, R., Wei, P., Dambacher, M., Yan, M., &amp; Zhou, X. (2011). Experimental effects and individual differences in linear mixed models: Estimating the relationship between spatial, object, and attraction effects in visual attention. Frontiers in Psychology, 1, 238.
Kornrumpf, B., Dimigen, O., &amp; Sommer, W. (2017). Lateralization of posterior alpha EEG reflects the

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

distribution of spatial attention during saccadic reading. Psychophysiology, 54(6), 809-823.
Kornrumpf, B., Niefind, F., Sommer, W., &amp; Dimigen, O. (2016). Neural correlates of word recognition: A systematic comparison of natural reading and rapid serial visual presentation. Journal of Cognitive Neuroscience, 28(9), 1374-1391.
Kristensen, E., Guerin-Dugué, A., &amp; Rivet, B. (2017). Regularization and a general linear model for event-related potential estimation. Behavior Research Methods, 49(6), 2255-2274.
Kristensen, E., Rivet, B., &amp; Guérin-Dugué, A. (2017). Estimation of overlapped eye fixation related potentials: The general linear model, a more flexible framework than the ADJAR algorithm. Journal of Eye Movement Research, 10(1), 1-27.
Kryuchkova, T., Tucker, B. V., Wurm, L. H., &amp; Baayen, R. H. (2012). Danger and usefulness are detected early in auditory lexical processing: Evidence from electroencephalography. *Brain and Language*, 122(2), 81-91.
Kurtzberg, D., &amp; Vaughan, H. G. (1982). Topographic analysis of human cortical potentials preceding self-initiated and visually triggered saccades. *Brain Research*, 243(1), 1-9.
Lalor, E. C., Pearlmutter, B. A., Reilly, R. B., McDarby, G., &amp; Foxe, J. J. (2006). The VESPA: A method for the rapid estimation of a visual evoked potential. NeuroImage, 32(4), 1549-1561.
Li, N., Niefind, F., Wang, S., Sommer, W., &amp; Dimigen, O. (2015). Parafoveal processing in reading Chinese sentences: Evidence from event-related brain potentials. Psychophysiology, 52(10), 1361-1374.
Lins, O. G., Picton, T. W., Berg, P., &amp; Scherg, M. (1993). Ocular artifacts in recording EEGs and event-related potentials II: Source dipoles and source components. *Brain Topography*, 6(1), 65-78.
Litvak, V., Jha, A., Flandin, G., &amp; Friston, K. (2013). Convolution models for induced electromagnetic responses. NeuroImage, 64(1), 388-398.
Luck, S. J. (2014). An introduction to the event-related potential technique. Cambridge, MA: MIT Press.
Luo, A., Parra, L., &amp; Sajda, P. (2009). We find before we look: Neural signatures of target detection preceding saccades during visual search. Journal of Vision, 9(8), 1207, https://doi.org/10.1167/9.8.1207.
Lütkenhöner, B. (2010). Baseline correction of overlapping event-related responses using a linear deconvolution technique. NeuroImage, 52(1), 86-96.
Matin, E. (1974). Saccadic suppression: A review and an analysis. Psychological Bulletin, 81(12), 899-917.

Meghanathan, R. N., van Leeuwen, C., Giannini, M., &amp; Nikolaev, A. R. (2020). Neural correlates of task-related refixation behavior. Vision Research, 175, 90-101.
Mensen, A., &amp; Khatami, R. (2013). Advanced EEG analysis using threshold-free cluster-enhancement and non-parametric statistics. NeuroImage, 67, 111-118.
Metzner, P., von der Malsburg, T., Vasishth, S., &amp; Rosler, F. (2015). Brain responses to world knowledge violations: A comparison of stimulus- and fixation-triggered event-related potentials and neural oscillations. Journal of Cognitive Neuroscience, 27(5), 1017-1028.
Meyberg, S., Sommer, W., &amp; Dimigen, O. (2017). How microsaccades relate to lateralized ERP components of spatial attention: A co-registration study. Neuropsychologia, 99, 64-80.
Meyberg, S., Werkle-Bergner, M., Sommer, W., &amp; Dimigen, O. (2015). Microsaccade-related brain potentials signal the focus of visuospatial attention. NeuroImage, 104, 79-88.
Nikolaev, A. R., Jurica, P., Nakatani, C., Plomp, G., &amp; van Leeuwen, C. (2013). Visual encoding and fixation target selection in free viewing: presaccadic brain potentials. Frontiers in Systems Neuroscience, 7, 26.
Nikolaev, A. R., Meghanathan, R. N., &amp; van Leeuwen, C. (2016). Combining EEG and eye movement recording in free viewing: Pitfalls and possibilities. *Brain and Cognition*, 107, 55-83.
Nunez, P. L., &amp; Srinivasan, R. (2006). Electric fields of the brain: The neurophysics of EEG. Oxford, UK: Oxford University Press.
Nuthmann, A. (2017). Fixation durations in scene viewing: Modeling the effects of local image features, oculomotor parameters, and task. Psychonomic Bulletin and Review, 24(2), 370-392.
Ossandón, J. P., Helo, A. V., Montefusco-Siegmund, R., &amp; Maldonado, P. E. (2010). Superposition model predicts EEG occipital activity during free viewing of natural scenes. Journal of Neuroscience, 30(13), 4787-4795.
Ossandon, J. P., Konig, P., &amp; Heed, T. (2019). Spatially modulated alpha-band activity does not mediate tactile remapping and fast overt orienting behavior [preprint]. BioRxiv, https://www.jneurosci.org/content/early/2020/10/21/JNEUROSCI.0581-19.2020.
Otten, L. J., &amp; Rugg, M. D. (2005). Interpreting event-related brain potentials. In T. C. Handy (Ed.), Event-related potentials: A methods handbook (pp. 3-16). Cambridge, MA: MIT Press.

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

Ouyang, G., Herzmann, G., Zhou, C., &amp; Sommer, W. (2011). Residue iteration decomposition (RIDE): A new method to separate ERP components on the basis of latency variability in single trials. *Psychophysiology*, 48(12), 1631-1647.
Pernet, C. R., Chauveau, N., Gaspar, C., &amp; Rousselet, G. A. (2011). LIMO EEG: a toolbox for hierarchical Linear Modeling of ElectroEncephaloGraphic data. Computational Intelligence and Neuroscience, 2011, 831409.
Plöchl, M., Ossandón, J. P., &amp; König, P. (2012). Combining EEG and eye-tracking: Identification, characterization, and correction of eye movement artifacts in electroencephalographic data. Frontiers in Human Neuroscience, 6, 278.
Rayner, K. (1975). The perceptual span and peripheral cues in reading. Cognitive Psychology, 7(1), 65-81.
Rayner, K. (2009). Eye movements and attention in reading, scene perception, and visual search. The Quarterly Journal of Experimental Psychology, 62(8), 1457-1506.
Richards, J. E. (2003). Cortical sources of event-related potentials in the prosaccade and antisaccade task. Psychophysiology, 40(6), 878-894.
Ries, A. J., Slayback, D., &amp; Touryan, J. (2018a). The fixation-related lambda response: Effects of saccade magnitude, spatial frequency, and ocular artifact removal. International Journal of Psychophysiology, 134, 1-8.
Rolfs, M. (2009). Microsaccades: Small steps on a long way. Vision Research, 49(20), 2415-2441.
Rossion, B., &amp; Jacques, C. (2012). The N170: Understanding the time course of face perception in the human brain. In S. J. Luck, &amp; E. S. Kappenman (Eds.), The Oxford handbook of event-related potential components (pp. 115-142). Oxford, UK: Oxford University Press.
Rousselet, G. A., Pernet, C. R., Bennett, P. J., &amp; Sekuler, A. B. (2008). Parametric study of EEG sensitivity to phase noise during face processing. BMC Neuroscience, 9, 98.
Royston, P., Altman, D. G., &amp; Sauerbrei, W. (2006). Dichotomizing continuous predictors in multiple regression: A bad idea. Statistics in Medicine, 25(1), 127-141.
Runge, C. (1901). Über empirische Funktionen und die Interpolation zwischen äquidistanten Ordinaten. Zeitschrift Für Mathematik Und Physik, 46, 224-243.
Sassenhagen, J. (2018). How to analyse electrophysiological responses to naturalistic language with time-resolved multiple regression. Language, Cognition and Neuroscience, 34(19), 1-17.

Sassenhagen, J., &amp; Alday, P. M. (2016). A common misapplication of statistical inference: Nuisance control with null-hypothesis significance tests. *Brain and Language*, 162, 42-45.
Sassenhagen, J., &amp; Draschkow, D. (2019). Cluster-based permutation tests of MEG/EEG data do not establish significance of effect latency or location. Psychophysiology, 56(6), e13335.
Schotter, E. R., Angele, B., &amp; Rayner, K. (2012). Parafoveal processing in reading. Attention, Perception &amp; Psychophysics, 74(1), 5-35.
Schweinberger, S. R., &amp; Neumann, M. F. (2016). Repetition effects in human ERPs to faces. Cortex, 80, 141-153.
Serences, J. T. (2004). A comparison of methods for characterizing the event-related BOLD timeseries in rapid fMRI. NeuroImage, 21(4), 1690-1700.
Sereno, S. C., &amp; Rayner, K. (2003). Measuring word recognition in reading: Eye movements and event-related potentials. Trends in Cognitive Sciences, 7(11), 489-493.
Simola, J., Le Fevre, K., Torniainen, J., &amp; Baccino, T. (2014). Affective processing in natural scene viewing: Valence and arousal interactions in eye-fixation-related potentials. NeuroImage, 106, 21-33.
Skrandies, W., &amp; Laschke, K. (1997). Topography of visually evoked brain activity during eye movements: lambda waves, saccadic suppression, and discrimination performance. International Journal of Psychophysiology, 27(1), 15-27.
Smith, N. J., &amp; Kutas, M. (2015a). Regression-based estimation of ERP waveforms: II. Nonlinear effects, overlap correction, and practical considerations. Psychophysiology, 52(2), 169-181.
Smith, N. J., &amp; Kutas, M. (2015b). Regression-based estimation of ERP waveforms: I. The rERP framework. Psychophysiology, 52(2), 157-168.
Smith, S. M., &amp; Nichols, T. E. (2009). Threshold-free cluster enhancement: Addressing problems of smoothing, threshold dependence and localisation in cluster inference. NeuroImage, 44(1), 83-98.
Spitzer, B., Blankenburg, F., &amp; Summerfield, C. (2016). Rhythmic gain control during supramodal integration of approximate number. NeuroImage, 129, 470-479.
Talsma, D., &amp; Woldorff, M. G. (2004). Methods for the estimation and removal of artifacts and overlap in ERP waveforms. In T. Handy (Ed.), Event-related potentials: A methods handbook. (pp. 115-148). Cambridge, MA: MIT Press.
Thickbroom, G. W., Knezevic, W., Carroll, W. M., &amp; Mastaglia, F. L. (1991). Saccade onset and offset

---

Journal of Vision (2021) 21(1):3, 1-30

Dimigen &amp; Ehinger

lambda waves: Relation to pattern movement visually evoked potentials. Brain Research, 551(1-2), 150-156.
Tremblay, A., &amp; Baayen, R. H. (2010). Holistic processing of regular four-word sequences: A behavioral and ERP study of the effects of structure, frequency, and probability on immediate free recall. In D. Wood (Ed.), Perspectives on formulaic language: Acquisition and communication (pp. 151-173). London: The Continuum International Publishing Group.
Tremblay, A., &amp; Newman, A. J. (2015). Modeling nonlinear relationships in ERP data using mixed-effects regression with R examples. Psychophysiology, 52(1), 124-139.
Van Humbeeck, N., Meghanathan, R. N., Wagemans, J., van Leeuwen, C., &amp; Nikolaev, A.R. (2018). Presaccadic EEG activity predicts visual saliency in free-viewing contour integration. Psychophysiology, 55(12), e13267.
Vasilev, M. R., &amp; Angele, B. (2017). Parafoveal preview effects from word  $\mathrm{N} + 1$  and word  $\mathrm{N} + 2$  during reading: A critical review and Bayesian meta-analysis. Psychonomic Bulletin and Review, 24(3), 666-689.
Velichkovsky, B. M., Cornelissen, F., Geusebroek, J. M., Graupner, S. T., Hari, R., &amp; Marsman, J. B., ... Pannasch, S. (2012). Measurement-related issues in the investigation of active vision. In L. R. Berglund, B. Rossi, G. B. Townsend, &amp; J. T. Pendrill (Eds.), Measurement with persons: Theory, methods, and implementation areas (pp. 281-300). New York: Psychology Press.
Weiss, B., Knakker, B., &amp; Vidnyanszky, Z. (2016). Visual processing during natural reading. Scientific Reports, 6, 26902.

Wilkinson, G. N., &amp; Rogers, C. E. (1973). Symbolic description of factorial models for analysis of variance. Applied Statistics, 22(3), 392.
Woldorff, M. G. (1993). Distortion of ERP averages due to overlap from temporally adjacent ERPs: Analysis and correction. *Psychophysiology*, 30(1), 98-119.
Wood, S. N. (2017). Generalized additive models: An introduction with  $R$  (2nd ed.). Boca Raton, FL: CRC Press.
Wood, S. N., Li, Z., Shaddick, G., &amp; Augustin, N. H. (2017). Generalized additive models for gigadata: Modeling the U.K. Black Smoke Network daily data. Journal of the American Statistical Association, 112(519), 1199-1210.
Xue, J., Quan, C., Li, C., Yue, J., &amp; Zhang, C. (2017). A crucial temporal accuracy test of combining EEG and Tobii eye tracker. *Medicine*, 96(13), e6444.
Yagi, A. (1979). Saccade size and lambda complex in man. Physiological Psychology, 7, 370-376.
Yagi, A., Ishida, K., &amp; Katayama, J. (1992). Contour effects on potentials associated with eye fixations. *Psychologia*, 35, 50-54.
Yamazaki, A. (1968). Electrophysiological study on "flick" eye movements during fixation [article in Japanese]. *Nippon Ganka Gakkai Zasshi*, 72(12), 2446-2459.
Yuval-Greenberg, S., &amp; Deouell, L. Y. (2009). The broadband-transient induced gamma-band response in scalp EEG reflects the execution of saccades. *Brain Topography*, 22(1), 3-6.
Yuval-Greenberg, S., Tomer, O., Keren, A. S., Nelken, I., &amp; Deouell, L. Y. (2008). Transient induced gamma-band response in EEG as a manifestation of miniature saccades. *Neuron*, 58(3), 429-441.

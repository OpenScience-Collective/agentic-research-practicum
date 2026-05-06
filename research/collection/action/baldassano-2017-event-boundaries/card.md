---
slug: baldassano-2017-event-boundaries
type: paper
strand: action
year: 2017
authors: [Baldassano, Chen, Zadbood, Pillow, Hasson, Norman]
venue: Neuron
doi: 10.1016/j.neuron.2017.06.041
url: https://doi.org/10.1016/j.neuron.2017.06.041
license: publisher-paywall
modalities: [fMRI, naturalistic, movie-viewing, hidden-Markov-model, hippocampus]
tags: [event-boundaries, hidden-Markov-model, naturalistic, movie-viewing, hippocampus, hierarchical-events, default-mode-network]
relevance: high
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

# Discovering event structure in continuous narrative perception and memory

## TL;DR
A hidden-Markov-model (HMM) applied to fMRI data while participants watch the BBC Sherlock pilot recovers a hierarchy of event boundaries from neural activity alone, with shorter events in early sensory cortex (~10 s) and longer events in default-mode regions (~30-60 s); event boundaries trigger hippocampal responses that predict subsequent free-recall accuracy.

## Summary
Baldassano and colleagues developed an HMM that segments fMRI activity into discrete event states by identifying timepoints where neural patterns shift abruptly. They applied it to data from participants watching a 50-minute Sherlock movie clip. The model recovered a hierarchy of event durations: early visual cortex showed events ~10 s long, while default-mode regions (mPFC, posterior cingulate, angular gyrus) showed events ~30-60 s long. Event boundaries identified by the HMM aligned closely with human-rated boundaries (when the same observers were asked behaviorally). Critically, hippocampal BOLD activity peaked at event boundaries, and the magnitude of these peaks predicted subsequent free recall: events with stronger hippocampal boundary signals were better remembered. The work introduces both a method (HMM event segmentation) and a substantive claim about hierarchical event representation in the brain.

## Relevance to the review
Direct dependency: provides the most explicit naturalistic-movie evidence that event boundaries are computed continuously from neural activity, with hierarchical timescales mapping onto cortical hierarchy. ThePresent ERSP analysis aligned to shot onsets is a fast-grained version of the same operation. The hippocampal boundary signal and its memory consequences validate event-boundary windows as functionally meaningful, supporting the choice of shot-onset as a valid epoch for ERSP. Also provides a methodological template: per-shot ERSP responses are the EEG analog of HMM event-state transitions.

## Notable details
- Stimulus: 50-minute clip of BBC Sherlock pilot.
- Method: HMM with K free states; cross-validated to choose K per region.
- Hierarchy: V1 ~10 s events; mPFC, posterior cingulate, angular gyrus ~30-60 s.
- Behavioral correspondence: HMM boundaries align with human-rated boundaries above chance.
- Hippocampal BOLD peaks at boundaries; magnitude predicts subsequent recall.
- Public dataset (Sherlock fMRI), available on OpenNeuro / Princeton.

## Open questions / limitations
- 50-minute movie is much longer than ThePresent (~3.5 min); event timescales may compress.
- fMRI temporal resolution (~1.5 s TR) cannot resolve sub-second EEG ERSP dynamics; methodological template is conceptual, not direct.
- Adult participants; pediatric movie (Pixar short) and HBN cohort not tested.
- HMM requires choosing K events per region; K = number of behavioral boundaries assumed; under-segmenting or over-segmenting is a hyperparameter sensitivity.

## Citations
Primary: `baldassano2017event`

Related:
- Chen, J. et al., 2017, shared memories reveal shared structure (cf. chen-2017-shared-memories).
- Hasson, U. et al., 2008, hierarchy of temporal receptive windows.
- Lerner, Y. et al., 2011, topographic mapping of TRWs (cf. lerner-2011-temporal-receptive-windows).
- Speer, N. K. et al., 2007, narrative event-boundary fMRI (cf. speer-2007-narrative-event-boundaries).
- Ben-Yakov, A. and Henson, R. N., 2018, hippocampal film editor.

# Source: Baldassano et al. 2017, Discovering Event Structure in Continuous Narrative Perception and Memory

- DOI: 10.1016/j.neuron.2017.06.041
- Journal: Neuron, 95(3), 709-721.e5
- Publisher: Cell Press / Elsevier
- License: publisher-paywall (Cell Press); some PMC author manuscripts available for older Cell-Press papers but not for this article.

## Abstract (verbatim)

How do we make sense of stories? While the brain has been shown to integrate information across timescales, we have a limited understanding of how this hierarchical processing is reflected in the segmentation of continuous experience into discrete events. Here, we present a hidden Markov model (HMM) that automatically identifies event boundaries in fMRI data, allowing for the discovery of a hierarchy of events nested within events, in different brain regions. The model accurately discovers temporal events that align with externally annotated boundaries when participants watched a one-hour movie. By comparing event structure in different brain areas, we found that high-level event representations during perception in default mode regions (e.g., posterior medial cortex) were re-instantiated during recall, and event boundary signals in the hippocampus during perception predicted subsequent memory.

## Methods (paraphrased)

- Stimulus: 48-minute BBC Sherlock pilot.
- Participants: 17 adults; whole-brain fMRI.
- HMM: each region modeled as a sequence of K discrete states; abrupt pattern changes mark event boundaries.
- K chosen per region by cross-validation; ranges from a few states (low-level cortex, short events) to dozens (default-mode, longer events).
- Behavioral comparison: separate participants annotated event boundaries via button press.
- Memory test: free recall of the movie story; reactivation of event-specific patterns during recall analyzed.

## Key results

- Hierarchy: early visual ~10 s events; mid-level cortex ~20 s; default mode ~30-60 s.
- Behavioral boundaries align with HMM-derived boundaries above chance, especially in default-mode regions.
- Hippocampal BOLD peaks at event boundaries; peak magnitude predicts which events are recalled.
- During recall, default-mode patterns reactivate in event-specific manner.

## Authors' conclusion

The brain segments naturalistic experience into hierarchical events; event boundaries are functional landmarks for memory encoding and retrieval, and the HMM provides a generative method to recover this structure from neural data.

## Retrieval notes

- Retrieved 2026-05-06; Cell Press paywall, opencite 403/text-html on both DOI and Cell article URL.
- source.md uses abstract + paraphrased methods/results.

## Pointer for full text

https://www.cell.com/neuron/fulltext/S0896-6273(17)30593-7. Sherlock fMRI dataset: https://openneuro.org/datasets/ds001131.

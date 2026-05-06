---
slug: lerner-2011-temporal-receptive-windows
type: paper
strand: action
year: 2011
authors: [Lerner, Honey, Silbert, Hasson]
venue: Journal of Neuroscience
doi: 10.1523/JNEUROSCI.3684-10.2011
url: https://doi.org/10.1523/JNEUROSCI.3684-10.2011
license: publisher-paywall
modalities: [fMRI, naturalistic, story-listening, temporal-receptive-windows]
tags: [temporal-receptive-windows, naturalistic, story-listening, hierarchical-processing, posterior-cortex, narrative-comprehension]
relevance: high
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

# Topographic mapping of a hierarchy of temporal receptive windows using a narrated story

## TL;DR
fMRI mapping of intersubject correlation while participants listen to a narrated story scrambled at four timescales (words, sentences, paragraphs, intact) reveals a topographic hierarchy of temporal receptive windows: early auditory cortex integrates over short timescales (~ms), while higher-order regions including angular gyrus, temporal-parietal junction, and precuneus integrate over tens of seconds.

## Summary
Lerner and colleagues asked 36 participants to listen to a 7-minute narrated story in four conditions: intact, paragraph-scrambled, sentence-scrambled, and word-scrambled. Intersubject correlation (ISC) of BOLD signal was computed for each condition. The logic: regions whose activity correlates only when the long-range temporal structure of the story is preserved have long temporal receptive windows; regions whose activity correlates even with word-scrambled input have short windows. The map shows a clear gradient: primary auditory cortex correlates across all conditions (short windows), middle temporal regions require sentence-level structure (intermediate windows), and angular gyrus/TPJ/precuneus only correlate when paragraph or full structure is preserved (long windows). Establishes that the cortex implements a hierarchy of temporal integration, with default-mode regions tuned to longest timescales of meaning.

## Relevance to the review
High relevance: the temporal-receptive-window (TRW) framework directly informs how to interpret early (0-500 ms) ERSP responses to shot onsets in ThePresent. Short-window regions (early visual, auditory) should respond to local stimulus features at every shot; long-window regions (default-mode, narrative) should integrate across multiple shots and thus produce smaller but more meaning-relevant differences in the boy-vs-puppy contrast. Predicts that the early ERSP window primarily indexes short-window cortex (occipital, central), with long-window contributions emerging only at later epoch times. Also a methodological precedent: ISC analysis is a standard naturalistic-movie tool that the EEG analog (intersubject phase-locking) builds upon.

## Notable details
- N=36 adult participants.
- Stimulus: 7-minute narrated story; 4 conditions (intact, paragraph, sentence, word scrambling).
- ISC computed per voxel and per condition.
- Hierarchy: early auditory ~ms; mid-temporal ~seconds; angular gyrus/TPJ/precuneus ~tens of seconds.
- Default-mode regions cluster at the long-window end.
- Public stimuli and analysis code available.

## Open questions / limitations
- Auditory only; visual analog (movie scrambling) was a separate later study (Hasson et al. 2008; the visual-version results are similar).
- Adult sample; HBN cohort developmental trajectory of TRW hierarchy is not directly tested.
- 7-minute scale; ThePresent at ~3.5 minutes is much shorter, may not engage the longest TRWs.
- BOLD timing; sub-second EEG dynamics not addressed.

## Citations
Primary: `lerner2011temporal`

Related:
- Hasson, U. et al., 2008, hierarchy of temporal receptive windows in human cortex.
- Hasson, U., Malach, R., and Heeger, D. J., 2010, reliability of cortical activity during natural stimulation (cf. hasson-2010-natural-stimulation).
- Baldassano, C. et al., 2017, HMM event structure (cf. baldassano-2017-event-boundaries).
- Honey, C. J. et al., 2012, slow cortical dynamics and the accumulation of information.
- Chen, J. et al., 2017, shared memories (cf. chen-2017-shared-memories).

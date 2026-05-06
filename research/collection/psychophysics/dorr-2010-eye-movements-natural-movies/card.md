---
slug: dorr-2010-eye-movements-natural-movies
type: paper
strand: psychophysics
year: 2010
authors: [Dorr, Martinetz, Gegenfurtner, Barth]
venue: Journal of Vision
doi: 10.1167/10.10.28
url: https://jov.arvojournals.org/article.aspx?articleid=2191779
license: unknown
modalities: [eye-tracking, dynamic-natural-scenes, free-viewing]
tags: [eye-movements, scanpath, normalized-scanpath-saliency, hollywood-trailers, stop-motion, scene-cuts, gaze-coherence]
relevance: medium
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR
Free-viewing eye movements on continuous natural videos are far more variable than on either static images or professionally edited Hollywood trailers, with Hollywood trailers showing the highest gaze coherence because cuts and camera work actively constrain attention.

## Summary
Dorr and colleagues recorded eye movements from 54 observers on 18 high-resolution outdoor videos plus three control conditions: stop-motion versions of the same scenes (semantic content preserved, continuous motion removed), Hollywood action trailers, and a repeated-viewing condition. They extended the Normalized Scanpath Saliency metric into the temporal domain and showed that gaze coherence is highest for Hollywood trailers (where cuts and camera work cue attention), intermediate for natural movies, and lowest for static images and stop-motion after the stimulus-onset transient. Saccade amplitudes and fixation durations also differ systematically across conditions. The study challenges the use of static images as a model for natural viewing and provides a public eye-tracking dataset still used as a benchmark for saliency models.

## Relevance to the review
Direct context for "The Present" pipeline. The animated short has scene cuts and camera moves engineered for narrative attention, so the Hollywood-trailer regime in this study is the closest free-viewing analogue. The paper quantifies how much shot cuts drive gaze coherence, which is exactly the bottom-up mechanism that the LLR regressor and shot-onset transients in `shot_events.tsv` are intended to capture. We are not gaze-tracking participants in HBN-EEG R3, but the gaze-coherence-at-cuts result motivates treating shot-onset transients as a strong shared driver across subjects regardless of the boy-versus-puppy condition contrast.

## Notable details
- 54 observers, 18 outdoor scenes, plus controls; Normalized Scanpath Saliency extended to time.
- Up to ~80% of observers fixate the same region at moments in some videos, but variability is normally much greater.
- Hollywood trailers maximally constrain gaze relative to both natural footage and stop-motion versions of the same scenes.
- Static-image gaze is dominated by an initial onset transient and then drifts to subject-specific idiosyncrasies.
- Stimuli and gaze data are public at https://www.inb.uni-luebeck.de/tools-demos/gaze.

## Open questions / limitations
- Stimuli are outdoor live-action, not animated film; whether the Hollywood-trailer-level coherence holds for short-form computer-animated content like "The Present" is not directly tested.
- No simultaneous EEG; the paper does not address whether gaze-coherent moments coincide with EEG inter-subject correlation peaks (this is what Dmochowski 2012 and Madsen-Parra address downstream).
- Eye-movement coherence is measured spatially via scanpath saliency, not at the level of individual saccade onset/offset events that would feed fixation-related potentials.

## Citations
Primary BibTeX key: `Dorr2010VariabilityOE` (in `psychophysics.bib`).

Related works:
- Goldstein, Woods, Peli (2007) Perception 36:1471 — eye movements on commercial videos; complementary scope.
- Mital, Smith, Hill, Henderson (2011) Cogn Comput 3:5 — gaze clustering on dynamic scenes; cited downstream.
- Dorr, Vig, Barth (2012) IEEE Trans Image Process — saliency model trained on this dataset.
- Carmi, Itti (2006) Vision Res 46:4333 — top-down vs bottom-up gaze allocation in natural movies.
- Smith, Mital (2013) J Eye Mov Res — attentional synchrony and film cuts.

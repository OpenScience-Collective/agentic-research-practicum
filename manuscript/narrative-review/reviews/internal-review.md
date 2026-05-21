# Internal peer review of v2 manuscript

**Skill:** `manuscript:paper-review` (research-skills marketplace, v0.5.0)
**Reviewer pass:** internal critique against the *Trends in Cognitive Sciences* (TiCS) Forum Review submission standard
**Date:** 2026-05-21 (v2 Phase 4)
**Source:** assembled from `manuscript/narrative-review/{highlights,abstract,sections/*,boxes/*,glossary,figures}.md` (3397 main-text words; 5619 words total)

## Synopsis

This Forum Review argues that per-shot EEG event-related spectral perturbation (ERSP) in a developmental cohort viewing silent character animation is an empty cell at the intersection of four research perspectives (psychophysics, action, language, emotion). The four-perspective scaffold is structurally coherent: psychophysics is the bottom-up covariate that must be partialled; action makes the most specific positive oscillatory prediction; language is structurally non-transferable for LM regressors but supplies positive silent-narrative correlates via its 5b sub-thread; emotion makes two latency-distinct predictions. Section 7 articulates a pre-registerable topographic-and-band rejection region (central-rolandic mu confirms action; frontal-asymmetric alpha confirms emotion; left-frontotemporal cluster falsifies; null at cluster-level alpha also falsifies via bottom-up exhaustion). The five F1-F5 critical findings from the prior v1 self-review are all addressed in prose. Headline assessment: **publishable Forum Review draft.** Zero critical issues. Six minor concerns are listed below for the Phase 5 copy-edit pass.

## Critical Issues

None. The manuscript has no methodological flaws, unsupported claims, or structural failures that would block submission.

## Major Concerns

None. The argument is internally consistent and the four-perspective scaffold cleanly maps to Sections 3-6 and to Figure 4's predictions table.

## Minor Concerns

### m1. Highlight #2 does not name the four perspectives

**Where:** `highlights.md`, bullet 2.
**Issue:** "Four perspectives diverge on per-shot EEG predictions of naturalistic film" does not name which four. A reader scanning Highlights without continuing to the abstract cannot identify the perspectives. Cell Press / TiCS Highlights typically name the key concepts so scanning readers can decide whether to read further.
**Suggestion:** Either expand to "Psychophysics, action, language, and emotion diverge on per-shot EEG predictions" (66 chars; fits the <=85 limit) or drop "Four perspectives" and lead with "Psychophysics, action, language, emotion diverge on per-shot EEG predictions" (78 chars).

### m2. Abstract pre-registration disclosure is opaque without body context

**Where:** `abstract.md`, final clause.
**Issue:** "...the 100 Hz local working set caps beta-band claims until a 500 Hz validation pass" assumes the reader already knows what the 100 Hz vs 500 Hz distinction means. In an abstract this disclosure is honest but cryptic.
**Suggestion:** Either tighten to "we acknowledge a sampling-rate constraint that caps beta-band claims" (no numbers; gain in clarity, loss in specificity) or expand by one clause to make the band-limit consequence explicit: "...HBN-EEG R3 sits at this empty intersection, although the local 100 Hz cohort caps beta-band and gamma-band claims pending a 500 Hz validation."

### m3. Section 4 Hickok-system critique is referenced but not characterised

**Where:** Section 4 paragraph 1 (last sentence).
**Issue:** "Hickok-style objections to one-to-one mirror-interpretations of mu suppression" names the critique tradition but does not say what the critique actually argues (i.e., that mu suppression also reflects general attention to motion, not a one-to-one mirror-system signature). A reader unfamiliar with the literature learns the critique exists but not its substance. The v1 self-review's I3 carry-forward asked for either elaboration or grounding via a corpus card; the current text does the former at minimum length.
**Suggestion:** Add one clause naming the substance: "Hickok-style objections that mu suppression also reflects general attention to moving stimuli rather than a one-to-one mirror-system signature". Adds ~15 words; tempers the action prediction more honestly.

### m4. Section 6 has four distinct beats; the fourth (social cognition) reads as rushed

**Where:** Section 6 paragraphs 3 and 4.
**Issue:** The section earns its 537-word budget by developing two predictions plus two EEG routes (early occipital alpha; later frontal asymmetry). The third paragraph adds a fourth beat (social cognition: Richardson-Saxe, Mar, Singer, Zaki-Ochsner, Nummenmaa, Schmaelzle-Grall, Kauttonen) in a single dense paragraph. Five citations in three sentences. Reads as a list rather than an argument.
**Suggestion:** Either compress the social-cognition beat to "Section 7's interpretation refers back to..." style (move detail to Section 7), or expand into a fourth paragraph that explicitly links each citation to a per-shot prediction. The current placement reads as a citation dump.

### m5. Section 1 paragraph 3 closing sentence is meta-narratorial

**Where:** Section 1 paragraph 3, last sentence.
**Issue:** "Section 2 begins with the four-perspective scaffold the rest of the review builds on" is a meta-tutorial signpost. TiCS readers do not need this; the next section heading does the work.
**Suggestion:** Delete the last sentence. Paragraph 3 ends naturally at "Box 1 anchors the argument to the HBN-EEG Release 3 cohort viewing *The Present* (Pixar 2014)."

### m6. Two-stage citation slug for Castelli (2000) is potentially confusing

**Where:** Section 5b first sentence; Section 2 paragraph 1.
**Issue:** The Castelli 2000 paper appears under two slugs in different places: `[Castelli2000MovementAM]` (line 102) and `[castelli2000heider]` (lines 49, 78). These are two distinct entries from two corpus strands (language and action) that point to the same primary paper. The v1 self-review's F3 stray-refs check applies. Phase 5 must verify both slugs resolve to the same DOI and consolidate to one BibTeX entry; if not, the duplication must be disclosed.
**Suggestion:** Phase 5 dedupe pass on the cited-key list; flag any same-DOI duplicates.

## Editor Note

**Recommendation: minor revision** (TiCS terminology equivalent). The four-perspective scaffold is publication-ready in argumentative substance. The falsifiability operationalisation (Section 7.3) is concrete enough to pre-register a topographic-and-band rejection region before group analysis on EEG IC clusters, which is the load-bearing methodological contribution of the Review. The remaining work is six low-severity polish items (m1-m6), all addressable in a single Phase 5 copy-edit pass without restructuring the argument.

**F1-F5 carry-forward audit:**

| Carry-forward | Status in v2 | Location |
|---|---|---|
| F1 (Category G cardinality 12 -> 7 + 12 corpus-wide) | Verbatim phrasing present | sections/05_language.md line 98 (5a closing) |
| F2 (Codispoti not Schubring) | Cited as "Codispoti and colleagues (2023)" | sections/06_emotion.md lines 115, 119 |
| F4 (anchor case: Petroni + pipeline, not feature conjunction) | Both anchor assertions named as independent | sections/07_synthesis.md 7.2 + boxes/box1_anchor.md |
| F5 (topographic-and-band rejection region) | Central-rolandic mu / frontal-asymmetric alpha / Lipkin negative control / null-at-alpha all named | sections/07_synthesis.md 7.3 |
| I3 (Hickok critique) | Named but thin (see m3) | sections/04_action.md paragraph 1 |
| I2 (narrative-position objection) | Named with covariate response | sections/07_synthesis.md 7.4 |
| I4 (cohesion) | Bridge sentences added | sections/01_introduction.md, sections/02_scaffold.md |
| I5 (5a + 5b split) | Clean split with parallel thesis sentences | sections/05_language.md |
| m8 (Klin autism in limitations) | Moved to 7.4 | sections/07_synthesis.md |
| m9 (explicit latency windows) | "80 to 300 ms" + "200 to 500 ms" in body | sections/06_emotion.md |

All v1 critical-and-important carry-forwards are addressed in prose.

## Carry-forward to Phase 4 humanizer pass

The m1-m6 items above are scoped for Phase 5 (final assembly), not Phase 4 (humanizer). Phase 4 should:

1. Run `manuscript:humanizer` on the per-section files to remove AI tells.
2. Verify the m1-m6 items remain candidates for Phase 5 fixes (the humanizer pass should not silently rewrite them away).

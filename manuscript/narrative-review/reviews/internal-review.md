# Internal peer review of `manuscript.md`

**Reviewer:** internal pass via `manuscript:paper-review` (Phase 4 of epic #46).
**Target:** *Trends in Cognitive Sciences* Forum Review.
**Date:** 2026-05-20.

## Synopsis

This Forum Review argues that per-shot EEG event-related spectral perturbation (ERSP) in a developmental cohort viewing silent character animation is an empty cell at the intersection of four research traditions (psychophysics, action, language, emotion). The four-perspective scaffold makes the argument operationally tractable, naming a regressor of no interest (psychophysics), a band-and-topography prediction with adult precedent (action), a method that structurally cannot transfer plus a positive sub-thread (language), and two latency-distinct predictions (emotion). Section 7 names a topographic-and-band rejection region that a pre-registered group analysis can adopt before opening the data, anchored externally on Petroni-Cohen 2018 and internally on a partly-validated EEGLAB-style pipeline (Box 1). The corpus underlying the synthesis is 94 cite-card-backed references from a four-strand collection. Headline assessment: this is a publishable Forum Review draft. The four-perspective scaffold is coherent; F1-F5 carry-forwards from the prior self-review are addressed in prose; the falsifiability section is concretely operationalisable. The most consequential remaining issues are (1) a quantitative caption error in Figure 3, (2) Section 2 still reads more as a theme catalogue than an integrated argument, (3) Section 7 runs ~175 words over its budget while Sections 1-2 sit ~390 words under, and (4) the abstract omits the 100 Hz sampling-rate constraint which is a load-bearing methodological qualifier in the body.

## Critical Issues

None. There are no methodological flaws, invalid statistics, or unsupported claims that would block submission of this Review. Notes below are major or minor concerns.

## Major Concerns

### M1. Figure 3 caption count is wrong: 13 no-coverage cells, not 12

**Where**: Figure 3 caption (line 178); referenced from Section 5b body and from the gap-matrix figure source SVG.

**Issue**: The caption states "twelve cells across the eight rows show no coverage in at least one column". Counting the no-coverage cells in `fig3_gap-matrix.svg`: Gap 1 (1), Gap 2 (1), Gap 3 (2), Gap 4 (1), Gap 5 (1), Gap 6 (2), Gap 7 (2), Gap 8 (3) = **13**. A peer reviewer who counts the dashed rectangles will find the mismatch immediately. This is the same class of factual error that the prior self-review flagged as F1 (Category G cardinality 12 vs 7), so addressing it preserves the rigor-checklist discipline.

**Fix**: Change "twelve" to "thirteen" in the Figure 3 caption. Verify against the SVG one more time before Phase 5.

### M2. Section 2 still reads as a theme catalogue rather than an argument

**Where**: Section 2 ("The four-perspective scaffold"), middle paragraph (line 49).

**Issue**: The prior self-review flagged I4 (Section 2 breaks the narrative arc). The current draft adds the bridge sentence at the open and forward-reference at the close, both of which are improvements. The middle paragraph still enumerates 15 themes back-to-back with a perspective tag per theme, which reads as an inventory rather than an argument. The 334-word section also sits under its 600-word budget; there is headroom to develop the perspective interactions more substantively. Compared to Section 4 (action), where multiple "beats" structure the argument, Section 2 has no structural rhythm beyond the enumeration.

**Fix**: Restructure the middle paragraph around the four perspectives, not the 15 themes. One paragraph per perspective summarising which themes carry the perspective's prediction, briefly. Or compress the theme enumeration to two sentences and use the freed budget to elaborate the four-perspective interaction (when do action and emotion compete, when do they reinforce, what is the relationship between language 5b and emotion social-cognition). Either path raises Section 2 from list to argument.

### M3. Section 7 over-runs its budget by ~175 words while Sections 1-2 sit ~390 words under

**Where**: Sections 1 (326 vs 450 target), 2 (334 vs 600 target), 7 (624 vs 450 target).

**Issue**: The body-text rebalancing in the PR description ("Sections 1-2 are under target by ~390 words combined; Section 7 is over by ~175") is true to the budgets but reflects a deeper structural skew. Section 7 is doing five sub-jobs (integration, anchor case, falsifiability, narrative-position objection, open questions and limitations) inside one section, while Sections 1 and 2 are doing under what their budgets would support. A peer reviewer will notice that the synthesis is heavier than the introduction, which inverts the usual Forum Review weighting.

**Fix**: Move Section 7.5 (open questions and limitations) content partly to Section 1 (limitations preview) and partly to the Outstanding Questions Box (where it already lives, redundantly). Move Section 7.4 (narrative-position objection) tightened to ~60 words inside 7.3 falsifiability, since it is in fact a falsification-region concern. Use the freed budget in Section 2 to do the perspective-interaction work flagged in M2.

### M4. Abstract omits the 100 Hz constraint, which the body names as load-bearing

**Where**: Abstract (lines 33-35).

**Issue**: The abstract claims that per-shot ERSP in a developmental cohort has no published precedent and that HBN-EEG R3 sits at the empty intersection. The body (Section 7.5; Box 1) names the 100 Hz local working set as a constraint that caps beta-band and gamma-band claims until the 500 Hz validation pass. A peer reviewer reading only the abstract would not learn that the empirical follow-on test is sampling-rate-limited at the dev tier, which a TiCS abstract should disclose at the level of one clause.

**Fix**: Add one clause to the abstract acknowledging the sampling-rate constraint: "...sits at this empty intersection, with the local 100 Hz working set capping beta-band claims until a 500 Hz validation pass." This makes the abstract honest at the abstract level. Word budget: the abstract is currently 125 words; this adds ~15 words, putting it ~10 words over its 110-120 target. Offset by tightening the sentence on "Most empirical evidence to date comes from...".

## Minor Concerns

### m1. Abstract is 125 words; TiCS target is ~80-120

**Where**: Abstract (line 35).

**Issue**: 125 words is 5 over the upper bound of the 110-120 target the scaffold set, and TiCS-published abstracts cluster at 80-120. Combined with M4 (add sampling-rate clause), aim for 110-120 net.

**Fix**: Trim "in two waves" filler and "Most empirical evidence to date" to one phrase each. Drop "We review the four-strand corpus that constrains this design space" in favour of "We review the corpus".

### m2. "stop-motion or stills" misnames Dorr 2010

**Where**: Section 3, paragraph 3 (line 59).

**Issue**: The sentence "Gaze coherence varies with stimulus class, highest on Hollywood trailers and lowest on stop-motion or stills" misrepresents Dorr and colleagues 2010, which compared Hollywood trailers, natural movie clips, and static images. Stop-motion is not a category in that study; stills is.

**Fix**: Replace "stop-motion or stills" with "natural movie clips and static images".

### m3. Section 4 paragraph 1 drops the Hickok critique in a single sentence

**Where**: Section 4, paragraph 1 (line 63), last sentence.

**Issue**: The Hickok-style mu-system critique is mentioned in a single half-sentence ("...not represented as cards in our corpus and which temper the weight that the action-perspective prediction can carry"). The prior self-review (I3) flagged this as a Phase 1 grounding gap: the corpus does not contain the strongest steelman objection to the deepest specific prediction. Treating the critique as a one-sentence hedge under-weights it.

**Fix**: Either add a sentence elaborating the substance of the Hickok objection (mu suppression also reflects general attention to motion, not a one-to-one mirror-system signature) so the reader knows what the critique actually says, or commit to a follow-up paragraph in Section 7.5 (limitations) that explicitly names the corpus gap. The current treatment is honest but thin.

### m4. "This Review" capitalisation is inconsistent with Cell Press house style

**Where**: Section 1, last paragraph (line 43): "This Review argues that..."; Section 5b last paragraph (line 83): "The language perspective therefore enters our Review twice."

**Issue**: Cell Press style typically uses lowercase "review" inside the article body and capitalises "Review" only when referring to the article type as a noun in metadata. The current capitalisation is inconsistent across sections.

**Fix**: Lowercase throughout the body. Reserve "Review" capitalisation for the YAML frontmatter / article-type-designation context.

### m5. Section 5b lacks a clear thesis sentence to mirror 5a

**Where**: Section 5b (lines 81-83).

**Issue**: Subsection 5a opens with "The contemporary methodological mainstream...", a clear thesis. Subsection 5b opens with "A second strand of language-strand cards documents what silent narrative engages independent of speech", which is descriptive rather than thesis-asserting. The 5a-vs-5b split is structurally valuable (per I5 carry-forward), but the asymmetry in opening rhetoric makes 5b read like a continuation rather than a counterpart.

**Fix**: Open 5b with "Silent-narrative neural correlates do transfer to scalp-EEG ERSP analysis even when language-model regressors cannot." Then proceed with Castelli, Vanderwal, Naci, Lankinen, Schroeder, default-mode-network synthesis.

### m6. Glossary entry "Naturalistic stimulus" risks being too narrow

**Where**: Glossary (line 166).

**Issue**: The definition reads "A continuous, ecologically valid stimulus (typically a film, audiobook, or video game) presented without trial-by-trial structuring." A TiCS reader from a non-cinematic-fMRI background may not understand why audiobooks and video games are listed alongside film. The naturalness-gradient framing of Section 3 and Figure 2 implies that the stimulus class is broader than examples given.

**Fix**: Add one sentence to the glossary entry: "Naturalness is a continuum from controlled gratings to live-action film, with character animation and abstract Heider-Simmel triangles as intermediate points (Figure 2)."

### m7. Outstanding Questions Box question 5 is dense

**Where**: Outstanding Questions Box, question 5 (line 136).

**Issue**: Question 5 ("Can a vision-side multimodal embedding regressor substitute for the language-model-surprisal regressor framework on silent stimuli, and what method bridges the syntactic and semantic granularity of the language-model framework into vision?") packs two distinct questions into one and asks the reader to track "vision-side multimodal embedding regressor" and "language-model-surprisal regressor framework" in the same sentence. The compound structure dilutes the question's force.

**Fix**: Split into two questions or shorten to "Can a multimodal vision-language embedding regressor substitute for language-model surprisal on silent stimuli?" Drop the second clause; the bridging question is a follow-up rather than a forward-looking adjudication target.

### m8. Section 4 paragraph 4 abruptly introduces the autism subsample

**Where**: Section 4, last paragraph (line 69), starting "A third action beat concerns single-agent versus two-agent shots".

**Issue**: This paragraph compresses three different topics: macaque two-agent network (Sliwa), single-agent contrast design rationale, and the autism-spectrum subsample of HBN. The autism topic appears here in two sentences without prior setup. It belongs either with Section 7.5 (limitations as moderator) or as its own short paragraph.

**Fix**: Move the autism sentences to Section 7.5 limitations. Section 4 paragraph 4 then reads as a tight macaque-to-design-rationale argument.

### m9. Figure 4 caption mentions "occipital alpha desynchronisation" without naming the latency window in the text

**Where**: Figure 4 caption (line 180); Section 6 body (line 87).

**Issue**: Figure 4 caption gives "80 to 300 ms (occipital)" and "200 to 500 ms (frontal)". Section 6 body does not give explicit latency windows. A reader inspecting the figure first and then the body will notice the latency-window precision in the figure that is absent in the body.

**Fix**: Add the latency windows to Section 6 body: "early occipital alpha desynchronisation (80 to 300 ms post-shot-onset)" and "later frontal-asymmetric alpha (200 to 500 ms)". Citation precedent for the windows: the Codispoti review for occipital, and the Davidson tradition (seconds-to-minutes) extrapolated downward for frontal. The body should be explicit about the extrapolation since the frontal latency is not directly precedented.

### m10. "ECoG" is introduced inside a parenthetical without being defined

**Where**: Section 5a (line 75): "shared between word-by-word intracranial cortical recording (ECoG) and autoregressive LMs".

**Issue**: ECoG (electrocorticography) is introduced as an apposition to "intracranial cortical recording" but the acronym is not actually defined here; the parenthetical reads as defining "intracranial cortical recording" with the acronym ECoG, but ECoG specifically means electrocorticography. A non-EEG reader (TiCS audience is cognitive-science-broad) may be confused.

**Fix**: Either expand to "electrocorticography (ECoG)" or remove the acronym since it is used only once more (Section 5a, in the Schrimpf citation). Defining-on-first-use convention from the project style guide.

## Editor Note

Recommendation: minor revision (TiCS terminology). The four-perspective scaffold and the falsifiability operationalisation are publication-ready in argumentative substance. The remaining work is rebalancing (Sections 1, 2, 7 word counts), one factual caption error (M1), and polish (minor concerns). All flagged items are addressable in a single Phase 4 revision pass without restructuring the argument. The 5a/5b split (per prior self-review I5) is well-executed and the falsifiability rejection region (per prior self-review F5) is concrete enough to pre-register before group analysis.

## Carry-forward to Phase 5

- M1 (caption count): correct before Phase 5 assembly.
- M2 (Section 2 restructure): apply in Phase 4 humanizer / copy-edit pass.
- M3 (word-count rebalance): apply in Phase 4 copy-edit pass.
- M4 (abstract sampling-rate clause): apply in Phase 4 copy-edit pass.
- m1-m10: apply opportunistically in Phase 4 humanizer pass; verify in Phase 5 final assembly.

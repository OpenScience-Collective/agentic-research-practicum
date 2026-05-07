# Peer review of `movie-ersp-direction.md`

**Reviewer**: self-review (manuscript:paper-review)
**Date**: 2026-05-06

## Summary verdict

This is a defensible direction paper. The four-perspective scaffold is coherent, the gap statement is grounded, and the design choices (LLR partialling, mutually exclusive boy-only vs puppy-only, ICA-only artifact rejection given no eye tracker) are properly argued. Headline weaknesses: (1) at least one verifiable factual error in a quantitative claim about the corpus ("all 12 cards in language Category G"), (2) an authorship/citation mismatch between a body card-link and the BibTeX key carried into References, (3) the "anchor case" section reads as circular in places ("our dataset proves our thesis") and needs sharper framing, and (4) the falsifiability discussion is asymmetric: a positive result has clear band/topography predictions, but the failure-mode for the central thesis (action and emotion are strongest condition-level signals) is under-specified. The Counterarguments section is the strongest part of the paper.

## Critical findings (must address before submission)

### F1. Wrong cardinality on a load-bearing corpus claim

**Where**: Section 1.2 (Gap statement); Section 3.3 (Language as comparator), final sentence; also Section 7.2.
**Issue**: Three times the paper states "all 12 cards in language ontology Category G land at `transfer-to-silent: no`". The synthesis is explicit that Category G has **seven** entries (`language-ontology.md`, "Structural note on category G: all seven entries land at `transfer-to-silent: no`"). The number 12 is the *global* count of `transfer-to-silent: no` cards across the language ontology, not the Category G count. This is a verifiable, reviewer-detectable factual error on a claim the paper repeats as load-bearing for the language-as-non-transfer thesis.
**Fix**: Replace "all 12 cards in language ontology Category G" with "all seven Category G cards (and 12 cards corpus-wide) land at `transfer-to-silent: no`" or pick one denominator and use it consistently. Update all three occurrences.

### F2. Authorship mismatch between cite-card and BibTeX in References

**Where**: References section, last entry under Emotion strand; Section 3.4 and Section 7.3 (alpha-emotion claims).
**Issue**: The body cites `schubring-schupp-2023-alpha-emotion` (card authored, per its own front matter, by "Schubring, Schupp"), but the BibTeX entry that actually appears in References is `Codispoti2023AlphabandOA` whose authors are Codispoti, De Cesarei, and Ferrari, with the same DOI 10.1111/psyp.14438. Either the card has the wrong authors and the slug is misleading, or the BibTeX entry imported into References is the wrong one. A reviewer who checks DOI 10.1111/psyp.14438 will land on the actual paper and notice that the slug name does not match the authors of the cited work. This is a reference integrity failure.
**Fix**: Pull the canonical author list from the DOI (this paper exists; verify Codispoti vs. Schubring) and correct either the slug, the card front matter, or the BibTeX key as appropriate. Then make the body's natural-language citation ("Schubring and colleagues") match the actual authors. Loop back to Phase 1 to fix the card.

### F3. Stray references that never cite-link to the body

**Where**: References section.
**Issue**: At least four BibTeX keys appear in References but are not cited via any card link in the body: `Pessoa2010EmotionPA`, `Lerner2011TopographicMO`, `Chen2016SharedMR`, `Nelson2017NeurophysiologicalDO`. The rigor checklist requires References to mirror what is cited. (`Lerner2011TemporalRR`-style key is fine because the action-strand `lerner2011temporal` is cited; the language-strand `Lerner2011TopographicMO` is a different paper and is uncited.)
**Fix**: Remove the four keys above from the References list, or add a cite-card link for any of them that genuinely belongs in the argument. Sample 5-10 more BibTeX keys against body cite-card links to catch any other strays before submission.

### F4. Anchor case is partly circular

**Where**: Section 4 ("Anchor case: HBN-EEG R3 ThePresent itself").
**Issue**: The section closes with a six-feature list of what makes ThePresent unique, then concludes "No card in the four-strand corpus combines all six features." This is the dataset proving its own thesis: any single dataset can be defined as unique by enumerating enough conjunctive features. The template's intent for an anchor case is an *external* existence proof (a study that already shows the proposed direction is tractable in adjacent territory), not a feature-conjunction tautology. The paper does correctly cite Petroni and colleagues as the closest neighbour, but it never commits to whether Petroni alone is the existence proof, or whether the existence proof is the partly-validated Phase 1 pipeline (an internal artifact, not external evidence).
**Fix**: Restructure Section 4 around two assertions: (a) Petroni-Cohen 2018 is the closest external precedent and demonstrates that scalp-EEG signal exists during developmental naturalistic viewing, and (b) the partly validated Phase 1 pipeline is the internal feasibility proof. Drop the six-feature uniqueness list or move it to an appendix; it is rhetorical, not evidential.

### F5. Falsifiability of the central thesis is asymmetric

**Where**: Section 1.3 (Thesis); Section 7.1 (Interpretation); Section 7.3 (Counterarguments, response).
**Issue**: The thesis predicts "action and emotion supply the strongest condition-specific predictions". The paper articulates positive predictions (mu-band ERD over central electrodes for action; cuteness or alpha-desynchronisation for emotion) but the *failure mode* is named only via the broadest possible null ("a null result on all three predictions, combined with a strong LLR effect, would itself be informative"). What does it mean for the thesis to be wrong if mu-band ERD survives but cuteness does not, or vice versa? What if a previously unspecified frontal theta survives instead? The thesis is currently structured so that any positive band-by-topography signal can be retroactively claimed for action or emotion, and any null can be claimed as informative-about-bottom-up. That is non-falsifiable as written.
**Fix**: In Section 1.3, name a concrete failure: e.g., "the thesis is falsified if the surviving condition-level signal in the LLR-partialled GLM is in language-network IC clusters (left frontotemporal) rather than central-rolandic (action) or frontal-asymmetric (emotion), or if no condition-level signal survives at the pre-registered cluster-level alpha". Pin a topographic-and-band rejection region before Phase 5, not after.

## Important findings

### I1. Gap-to-commitment mapping is one-to-one but several commitments are wishlist, not gap-tied promise

**Where**: Section 5 (Roadmap), Commitments 5, 6, 8.
**Issue**: Commitments 1-4 and 7 each map cleanly to a single gap and produce a named artifact. Commitment 5 ("optional Phase 6 extensions add behavioural-boundary alignment...") is hedged with "optional"; Commitment 6 promises a "methodological position paper acknowledging that per-shot deconvolution... is not possible", which is documentation, not a research artifact closing a gap; Commitment 8 says the asymmetry analysis is "exploratory rather than confirmatory" and is "negative-result-tolerant". A peer reviewer will read these as the paper hedging on three of its eight gap-closures.
**Fix**: Either commit firmly (drop "optional", define what triggers running the extension, name the cluster-level alpha for the asymmetry test) or move the soft commitments to a "Future work" section and stop calling them gap closures. The current framing inflates the apparent gap-closure rate.

### I2. Counterarguments names one strong objection but not the strongest

**Where**: Section 7.3 (Counterarguments).
**Issue**: The "bottom-up exhaustion" objection (LLR plus motion plus cuts may exhaust per-shot variance) is well-stated and well-rebutted. But a stronger objection is missing: that boy-only and puppy-only conditions differ on *narrative-position* confounds (early-act boy-only shots cluster in the setup, late-act puppy-only shots cluster in the resolution), which means any condition difference may be confounded with prediction-error or arousal trajectories driven by the three-act structure. This is a corpus-grounded concern (see the predictive-processing theme, [zacks-2007-event-segmentation], [baldassano-2017-event-boundaries], [chen-2017-shared-memories] on event-state reactivation), not an external one. The paper currently has no rebuttal because it never names this as an objection.
**Fix**: Add the narrative-position objection to Section 7.3 and respond. The corpus supports adding shot-index-in-narrative as an additional covariate or doing a within-act analysis; both are tractable from `shot_events.tsv`.

### I3. "Adversarial" engagement is asymmetric

**Where**: Section 7.2 (Limitations); throughout.
**Issue**: The rigor checklist asks whether the paper engages with cards that argue *against* its thesis. Section 7.2 lists adult-only emotion cards as a sample-mismatch caveat, which is a generic methodological caveat, not an adversarial engagement. The corpus does contain potentially adversarial entries: [reznik-allen-2018-frontal-asymmetry] is engaged (good), but the mu-rhythm-mirror-system tradition has well-known critiques (Hickok 2009 and others) that the paper acknowledges are *outside* the corpus ("the corpus does not contain strong critiques such as Hickok 2009"). That acknowledgement is honest, but if mu-band ERD is the deepest specific prediction in the paper (as Section 7.1 says), then a critique tradition not being in the corpus is a Phase 1 grounding gap, not just a footnote.
**Fix**: Either add a Hickok-style mu-system critique card to the corpus (loop back to Phase 1) or rebalance Section 3.2 to weight the action-perspective prediction less heavily, since the steelman objection cannot be cited from within the corpus.

### I4. Storyline cohesion: Section 2 breaks the narrative arc

**Where**: Section 2 ("Background, the 15 themes").
**Issue**: Reading section openings in order (1.1, 1.2, 1.3, 2, 3, 4.1, 4.2, 4.3, 4.4, 5, 6, 7.1, 7.2, 7.3, 8), Sections 1.1-1.3 and 3.x narrate a coherent argument; Section 2 reads as a standalone catalogue with no opening sentence that connects to Section 1.3 (the thesis) or sets up Section 3 (the argument body). It is a 15-theme inventory delivered between two argumentative passes.
**Fix**: Add one paragraph at the top of Section 2 that says, in effect: "the four-perspective thesis cuts across 15 corpus themes; this section indexes the themes and locates each thesis perspective in the appropriate themes, before Section 3 develops the perspective-by-perspective argument." Or move Section 2 to an appendix and let Section 3 cite themes inline.

### I5. "Comparator-of-non-transfer" is a strained framing

**Where**: Section 1.3 (Thesis, third claim); Section 3.3 title and body.
**Issue**: Including the language strand "as comparator-of-non-transfer" structurally means the paper uses 28 language-strand cards plus 12 themes worth of synthesis to say "this entire perspective does not transfer". That is a lot of corpus to spend on a structural negative. A reviewer may ask why the language strand was scoped into the corpus at all if the paper's conclusion about it was knowable from the silent-stimulus framing on day one. The Castelli-Vanderwal-Naci-Lankinen sub-thread *does* transfer (silent stimuli engage social-cognition networks), but the paper buries this inside the non-transfer framing.
**Fix**: Split Section 3.3 into two subsections: 3.3a "Language-model regressors are structurally non-transferable" (the negative result, briefly), and 3.3b "Silent-narrative neural correlates" (the positive transfer-yes findings: Castelli, Vanderwal, Naci, Lankinen, Schroeder). The current single section conflates the two and undersells the positive sub-thread.

## Suggestions (optional polish)

### S1. Three-act narrative position is mentioned but never operationalised

**Where**: Section 2, Theme 15 (Predictive processing); also implied in Section 7.1.
**Issue**: The paper says "ThePresent's three-act narrative makes prediction error a candidate driver", but never connects this to a regressor in the planned GLM. Given that Baldassano 2017 and Chen 2017 are cited as motivations, an event-state regressor derived from a Baldassano-style HMM on the stimulus video is a natural extension and the paper hints at it (Commitment 5) but does not promise it.
**Fix**: Either commit (move from "optional" to "scheduled") or drop the framing.

### S2. Defining "ThePresent" as a proper noun

**Where**: Throughout.
**Issue**: The convention "ThePresent" as a single token is non-standard; submission-quality writing typically uses "*The Present*" (italicised film title) or "The Present (Pixar 2014)". This is house-style nitpicking, not substance, but a copy-editor will flag it.
**Fix**: Replace with italicised title or quoted title throughout, defining it once at first mention.

### S3. Long sentences in Sections 3.3 and 3.4

**Where**: Section 3.3 (paragraph beginning "Goldstein and colleagues..."); Section 3.4 (paragraph beginning "The crucial framing...").
**Issue**: Several sentences exceed 80 words and chain four to seven cite-card links. Readability suffers; the rigor checklist's prose-discipline gate is descriptive voice, not exhortatory, but density also matters.
**Fix**: Split into shorter sentences; one cite per sentence where possible.

### S4. Redundant "the planned analysis" and "the corpus contains" phrasing

**Where**: Throughout, especially Sections 5 and 7.
**Issue**: Phrases like "the planned analysis can adjudicate", "the corpus contains no card that...", "the artifact is the first..." recur dozens of times. Each is fine; together they form a tic.
**Fix**: Vary phrasing in revision.

## Positive observations

- The four-perspective scaffold (psychophysics, action, language, emotion) is genuinely structural, not decorative; each perspective makes a different and partly testable prediction, and the paper preserves their differences.
- LLR-as-regressor is properly framed as "the minimum partialling that the corpus supports", with motion-energy as a named follow-up. This is exactly the right level of methodological humility.
- Counterarguments (Section 7.3) names the steelman bottom-up-exhaustion objection and rebuts it with corpus-grounded reasoning rather than hand-waving. Best section in the paper.
- The "developmental-justification rule" is honored: emotion-strand adult-only cards are explicitly named in Section 7.2 as not transferring cleanly.
- Section 7.1's null-result framing ("a null result on all three predictions, combined with a strong LLR effect, would itself be informative") is a publishable framing for a high-bar review section, not a hedge.
- No em-dashes detected in the body (CLAUDE.md prose discipline holds).
- Abbreviations defined on first use, including the dense block at the top of Section 1.

## Loop-back recommendations (per rigor checklist Phase 4)

| Finding | Disposition | Target |
|---------|-------------|--------|
| F1 (Category G cardinality) | restructure | Phase 3 paper edit; correct number in three locations |
| F2 (Schubring vs Codispoti) | ground | Phase 1 card fix; verify DOI authorship and update slug, card front matter, or BibTeX key |
| F3 (stray references) | restructure | Phase 3 paper edit; remove uncited keys from References, or add cite-card links |
| F4 (anchor case circular) | restructure | Phase 3 paper edit; reframe Section 4 around Petroni 2018 and Phase 1 feasibility |
| F5 (falsifiability) | restructure | Phase 3 paper edit; add a topographic-and-band rejection region to Section 1.3 |
| I1 (wishlist commitments) | restructure | Phase 3 paper edit; firm up or relocate Commitments 5, 6, 8 |
| I2 (narrative-position objection) | restructure | Phase 3 paper edit; add objection to Section 7.3 |
| I3 (mu-system critique missing) | ground | Phase 1 add a Hickok-style mu-mirror critique card, then Phase 3 cite it in Section 3.2 |
| I4 (Section 2 cohesion) | restructure | Phase 3 paper edit; bridging paragraph or appendix relocation |
| I5 (comparator-of-non-transfer framing) | restructure | Phase 3 paper edit; split Section 3.3 |
| S1 (event-state regressor) | restructure | Phase 3 paper edit; commit or drop |
| S2 (ThePresent as token) | restructure | Phase 3 paper edit; copy-edit pass |
| S3 (long sentences) | restructure | Phase 3 paper edit; copy-edit pass |
| S4 (phrasing repetition) | restructure | Phase 3 paper edit; copy-edit pass |

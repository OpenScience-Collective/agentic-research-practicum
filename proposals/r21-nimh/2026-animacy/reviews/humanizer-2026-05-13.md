# Humanizer Pass, R21 Animacy

Pattern check against the AI-style writing patterns documented in the `manuscript:humanizer` skill. The goal is to strip patterns that read as "AI-written" while preserving evidence-backed claims and appropriate uncertainty in Approach risks. Findings are organized per pattern, with locations.

## Pattern 1, significance inflation (filler that reads as importance-padding)

Tracked phrases: "pivotal moment", "evolving landscape", "transformative", "foundational", "central". The R21 uses "foundational" twice in Significance Paragraph 1; this is borderline acceptable when paired with the specific evidence ("alteration in autism spectrum, social anxiety, and conduct disorder is well documented"). Considered acceptable.

Other flagged phrases:

- "Naturalistic stimuli are the right probe" (Significance Paragraph 1). Slightly assertive; the field has not settled on this. Soften to "Naturalistic stimuli probe the integrated machinery that controlled paradigms fractionate." (omits "are the right probe")
- "The barrier is methodological" (Significance Paragraph 3, lead sentence). Acceptable; reads as analysis rather than inflation.

**Action**: light tighten of Paragraph 1 lead. No structural change.

## Pattern 4, promotional language (red flags in Innovation)

Tracked phrases: "groundbreaking", "transformative", "paradigm-shifting", "novel", "innovative".

Hits in Innovation:

- "novel at the group level" (Technical paragraph): acceptable because immediately followed by the citation evidence ("Cinematic-fMRI uses LLR; iEEG uses cut and motion-energy regressors; scalp EEG does neither.")
- "an enabling rather than rhetorical innovation" (Methodological last sentence): borderline. The sentence is self-aware about the pattern, which mitigates, but a strict humanizer pass would still flag it. **Consider tightening to**: "deposited as a community resource for the next generation of pediatric naturalistic-EEG analyses".

Hits in Significance:

- None notable. The Significance avoids "novel" and "transformative" entirely, which is the right tone for the section.

Hits in Approach:

- None notable. The Approach prose is methodical and avoids promotional language by design.

**Action**: light edit of Innovation Methodological closing sentence. No other changes needed.

## Pattern 24, excessive hedging (stacked hedges weaken claims)

Tracked phrases: "may potentially", "could possibly", "might suggest", "appears to potentially".

Hits across the proposal:

- Significance Paragraph 3: "...could not be done with existing approaches." (Innovation, slight overlap). Single hedge, defensible.
- Approach 2.F: "Second alternative: shot-onset transients may include saccade-locked artifact in the 0-150 ms window..." Single hedge ("may include"), appropriate for an alternatives section.
- Approach 1.F: "Linear age does not capture non-monotonic trajectories" (categorical, not hedged) followed by "we pre-register the GAM smooth-on-age as the primary developmental statistic, with linear age as a sensitivity check". Good balance.

**Action**: no changes. The hedging is well-calibrated: confident in primary claims, properly cautious in alternatives.

## Pattern 17 and 19, title case and curly quotes

NIH submission formatting is sentence case for section headings and straight ASCII quotes. The Markdown sources mostly use sentence case (good); a few section headings are title-case-leaning.

Hits:

- "Approach" section headings like "**Aim 1. Map the developmental trajectory of animacy-locked oscillatory responses.**" use sentence case after the first capital, but the structure is mixed. Acceptable for a draft.
- All quotes in the source are ASCII straight quotes. Markdown rendering does not insert curly quotes. Good.

**Action**: no changes at Phase 5. The Phase 5 LaTeX rendering preserves the source casing and quote style.

## Pattern 8, list-of-three abuse

Tracked structure: "X, Y, and Z" patterns used as rhetorical filler ("efficient, robust, and scalable"). Reviewers see this as AI-style.

Hits:

- Aims: "(1) the first scalp-EEG developmental map..., (2) a BIDS / HED compliant pipeline..., (3) a developmentally calibrated baseline..." Numbered list, three items. Acceptable because each item is specific and verifiable, not rhetorical.
- Significance: "the integrated perceptual, inferential, and affective machinery". Three-item list, but each word is a substantive theoretical term. Acceptable.
- Innovation: "shares visual style, narrative arc, and continuous luminance distribution". Three concrete properties. Acceptable.

**Action**: no changes. The lists-of-three are substantive, not rhetorical.

## Pattern 12, redundant qualifiers

Tracked: "in order to" (use "to"), "due to the fact that" (use "because"), "at this point in time" (use "now"). Quick grep.

Hits across the four scientific markdowns:

- None of the redundant qualifier patterns appear. The drafting is already economical.

## Summary of recommended edits

None of the patterns require structural rewrites. The proposal is in good humanizer shape on first pass. Specific edits:

1. **Innovation Methodological closing sentence**: tighten "an enabling rather than rhetorical innovation" to "deposited as a community resource". One-sentence change.
2. **Significance Paragraph 1**: tighten "Naturalistic stimuli are the right probe" to "Naturalistic stimuli probe the integrated machinery". Drop "are the right".

That is the complete humanizer pass set. Apply at the user's discretion before submission.

<!-- References. Numbered Cell Press style.
Sources: refs.bib (94 entries).
Built in Phase 5 by extracting cited keys from the assembled manuscript in order of first appearance, then formatting per Cell Press house style.
-->

# References

[Cell Press numbered references go here in Phase 5 final assembly. Format per Cell Press house style (numbered, Vancouver-like).

Build process:
1. Concatenate per-section files plus boxes plus glossary into a single body text.
2. Extract `[CiteKey]` references in order of first appearance.
3. Map each key to its `refs.bib` entry.
4. Emit a numbered list using Cell Press format.
5. Replace `[CiteKey]` and `[Key1; Key2]` in the body with `[N]` and `[N,M]` respectively.

The `refs.bib` file (94 entries) is the source of truth.]

## Note on F2 carry-forward (Schubring vs Codispoti)

The body cites the alpha-band-and-emotion review under "Codispoti and colleagues (2023), Psychophysiology, DOI 10.1111/psyp.14438". The BibTeX key is `Codispoti2023AlphabandOA`. The internal corpus slug `schubring-schupp-2023-alpha-emotion` is retained inside `research/collection/emotion/` for stable cross-references and does not appear in published prose.

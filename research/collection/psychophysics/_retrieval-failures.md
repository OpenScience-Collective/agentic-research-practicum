# Psychophysics Strand: Retrieval Failures

High-relevance entries where PDF retrieval failed or licensing forbids redistribution. These feed a manual-retrieval issue.

| slug | doi | title | failure_reason | license | source_url |
|---|---|---|---|---|---|
| bartels-zeki-2008-natural-vision-mt | 10.1093/cercor/bhm107 | Natural vision reveals regional specialization to local motion and to contrast-invariant, global flow in the human brain | Oxford Academic / Cerebral Cortex paywall (HTTP 403 to opencite on doi.org and academic.oup.com PDF endpoint). Direct dependency for "The Present" because of the motion vs cut decomposition the paper validates. | publisher-paywall (Oxford Academic, Cerebral Cortex) | https://academic.oup.com/cercor/article/18/3/705/305478 |
| nishimoto-2011-movie-reconstruction | 10.1016/j.cub.2011.08.031 | Reconstructing visual experiences from brain activity evoked by natural movies | Cell Press paywall; PMC archive (PMC3326357) marked not Open Access via PMC OAI. Europe PMC PDF render returned an error. | publisher-paywall (Cell Press / Current Biology) | https://www.cell.com/current-biology/fulltext/S0960-9822(11)00937-7 |
| hasson-2004-isc-natural-vision | 10.1126/science.1089506 | Intersubject Synchronization of Cortical Activity During Natural Vision | AAAS Science paywall (HTTP 403 to opencite on doi.org). Foundational ISC reference. | publisher-paywall (AAAS Science) | https://www.science.org/doi/10.1126/science.1089506 |
| adelson-bergen-1985-spatiotemporal-energy | 10.1364/JOSAA.2.000284 | Spatiotemporal energy models for the perception of motion | OSA / Optica paywall (text/html landing instead of PDF). The historical MIT Persci mirror cited by opencite timed out at retrieval. Foundational motion-energy reference. | publisher-paywall (OSA / Optica, JOSA A) | https://opg.optica.org/josaa/abstract.cfm?uri=josaa-2-2-284 |
| lalor-foxe-2010-natural-speech-trf | 10.1111/j.1460-9568.2009.07055.x | Neural responses to uninterrupted natural speech can be extracted with precise temporal resolution | Wiley paywall (HTTP 403 to opencite on doi.org). No PMC archive. Methodological precedent for naturalistic-EEG TRF. | publisher-paywall (Wiley, European Journal of Neuroscience) | https://onlinelibrary.wiley.com/doi/10.1111/j.1460-9568.2009.07055.x |
| dimigen-2011-frp-natural-reading | 10.1037/a0023885 | Coregistration of eye movements and EEG in natural reading: analyses and review | APA paywall (HTTP 403 to opencite on doi.org). Canonical FRP-methodology review. | publisher-paywall (APA) | https://psycnet.apa.org/doi/10.1037/a0023885 |
| carandini-heeger-2011-normalization | 10.1038/nrn3136 | Normalization as a canonical neural computation | Nature Reviews paywall; PMC archive (PMC3273486) marked not Open Access via PMC OAI; opencite tried doi.org and Europe PMC PDF render and both failed (HTTP 406 / HTTP 500). Important context for LLR x ERSP interpretation. | publisher-paywall (Nature Reviews Neuroscience) | https://www.nature.com/articles/nrn3136 |
| simoncelli-olshausen-2001-natural-image-stats | 10.1146/annurev.neuro.24.1.1193 | Natural image statistics and neural representation | Annual Reviews paywall (HTTP 403 to opencite). Author institutional repository did not host a redistributable preprint at retrieval time. | publisher-paywall (Annual Reviews) | https://www.annualreviews.org/doi/10.1146/annurev.neuro.24.1.1193 |
| born-bradley-2005-mt-mst | 10.1146/annurev.neuro.26.041002.131052 | Structure and function of visual area MT | Annual Reviews paywall (HTTP 403 to opencite). | publisher-paywall (Annual Reviews) | https://www.annualreviews.org/doi/10.1146/annurev.neuro.26.041002.131052 |
| dorr-2010-eye-movements-natural-movies | 10.1167/10.10.28 | Variability of eye movements when viewing dynamic natural scenes | Journal of Vision (ARVO) PDF behind a Cloudflare anti-bot challenge; license terms for the typeset PDF were not verifiable through opencite at retrieval. | unknown | https://jov.arvojournals.org/article.aspx?articleid=2191779 |
| tobimatsu-celesia-2006-vep-pathophysiology | 10.1016/j.clinph.2006.01.004 | Studies of human visual pathophysiology with visual evoked potentials | Elsevier paywall; opencite request to doi.org returned text/html landing page. | publisher-paywall (Elsevier, Clinical Neurophysiology) | https://doi.org/10.1016/j.clinph.2006.01.004 |
| riesenhuber-poggio-1999-hmax | 10.1038/14819 | Hierarchical models of object recognition in cortex | Nature Neuroscience paywall (HTTP 406 to opencite on doi.org). | publisher-paywall (Nature Neuroscience) | https://www.nature.com/articles/nn1199_1019 |
| hubel-wiesel-1962-receptive-fields-cat-v1 | 10.1113/jphysiol.1962.sp006837 | Receptive fields, binocular interaction and functional architecture in the cat's visual cortex | PMC archive (PMC1359523) blocked by reCAPTCHA at retrieval; opencite, Europe PMC, and direct PMC fetches all failed. Public domain status by age depends on jurisdiction; not committed without verification. | unknown | https://physoc.onlinelibrary.wiley.com/doi/10.1113/jphysiol.1962.sp006837 |
| kaneshiro-2021-music-eeg-isc | 10.1101/2021.04.14.439913 | Inter-Subject EEG Correlation Reflects Time-Varying Engagement with Natural Music | bioRxiv preprint; biorxiv.org PDF endpoint blocked by anti-bot at retrieval; bioRxiv default license CC BY-NC-ND does not permit redistribution. | preprint-cc-biorxiv (CC BY-NC-ND default) | https://www.biorxiv.org/content/10.1101/2021.04.14.439913v3 |

## Top high-relevance items for the manual-retrieval issue

These have `relevance: high` and would benefit most from a manual fetch:

1. `bartels-zeki-2008-natural-vision-mt` — direct dependency for the motion vs cut decomposition framing in "The Present" Phase 5.
2. `nishimoto-2011-movie-reconstruction` — foundational motion-energy encoding model for naturalistic-movie BOLD.
3. `hasson-2004-isc-natural-vision` — foundational ISC paradigm reference.
4. `adelson-bergen-1985-spatiotemporal-energy` — implicit substrate of every motion-energy regressor.
5. `dimigen-ehinger-2021-deconvolution-eye-eeg` — already archived, listed for completeness only (PDF retrieved via Europe PMC).

(items 1-4 are paywalled; item 5 was successfully retrieved through Europe PMC and is included only to document that the methodological reference is already in the corpus.)

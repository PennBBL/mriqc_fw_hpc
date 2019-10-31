Build context for a Flywheel Gear which runs mriqc.


MRIQC (v0.15.1) extracts no-reference IQMs (image quality metrics) from structural (T1w and T2w) and functional MRI (magnetic resonance imaging) data.

MRIQC is an open-source project, developed under the following software engineering principles:

Modularity and integrability: MRIQC implements a nipype workflow to integrate modular sub-workflows that rely upon third party software toolboxes such as FSL, ANTs and AFNI.
Minimal preprocessing: the MRIQC workflows should be as minimal as possible to estimate the IQMs on the original data or their minimally processed derivatives.
Interoperability and standards: MRIQC follows the the brain imaging data structure (BIDS), and it adopts the BIDS-App standard.
Reliability and robustness: the software undergoes frequent vetting sprints by testing its robustness against data variability (acquisition parameters, physiological differences, etc.) using images from OpenfMRI. Its reliability is permanently checked and maintained with CircleCI.
MRIQC is part of the MRI image analysis and reproducibility platform offered by the CRN. This pipeline derives from, and is heavily influenced by, the PCP Quality Assessment Protocol.

For more info, please refer to: https://mriqc.readthedocs.io/

Citation: Esteban O, Birman D, Schaer M, Koyejo OO, Poldrack RA, Gorgolewski KJ; MRIQC: Advancing the Automatic Prediction of Image Quality in MRI from Unseen Sites; PLOS ONE 12(9):e0184661; doi:10.1371/journal.pone.0184661.

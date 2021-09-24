#' Author: Benjamin K Schneider
#' Date: 09/24/2021
#' Contact: schnebeni@gmail.com
#' Notes =========================================================

Using a model previously published in the The Journal of Pharmacology and Experimental Therapeutics by Antari 
Khot, et al. as a basis for parameter estimates and model structure, I created a freely available simulation 
engine for exogenously administered CAR-T cells in mice.

Link: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6382992/

#;---- Citation ----;#
Khot A, Matsueda S, Thomas VA, Koya RC, Shah DK. Measurement and Quantitative Characterization of Whole-Body
Pharmacokinetics of Exogenously Administered T Cells in Mice. J Pharmacol Exp Ther. 2019;368(3):503-513. 
doi:10.1124/jpet.118.252858

The paper lacked enough documentation and detail to be able to actually fully reproduce the simulations from the
manuscript. So, I thought it would be much more useful to reproduce the model myself and make the code freely
available! That way, others could use my code as a basis to innovate on these scientist's contribution to the
modeling community. I have tried reaching out to the authors to get clarification, but I was never able to get
in touch.
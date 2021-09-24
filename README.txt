#' Author: Benjamin K Schneider
#' Date: 09/24/2021
#' Contact: schnebeni@gmail.com
#' R Version 4.0.2
#' deSolve 1.2.8
#' Notes =========================================================

Using a model previously published in the The Journal of Pharmacology and Experimental Therapeutics by Antari 
Khot, et al. as a basis for parameter estimates and model structure, I created a freely available simulation 
engine for exogenously administered CAR-T cells in mice.

Link: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6382992/

#;---- Citation ----;#
Khot A, Matsueda S, Thomas VA, Koya RC, Shah DK. Measurement and Quantitative Characterization of Whole-Body
Pharmacokinetics of Exogenously Administered T Cells in Mice. J Pharmacol Exp Ther. 2019;368(3):503-513. 
doi:10.1124/jpet.118.252858

The paper lacked enough documentation and detail to be able to actually fully reproduce the simulations from 
the manuscript. So, I thought it would be much more useful to reproduce the model myself and make the code 
freely available! That way, others could use my code as a basis to innovate on these scientist's contribution 
to the modeling community. I have tried reaching out to the authors to get clarification, but I was never able
to get in touch. Most of the problems with the model as detailed in the original compartment are related to
lymph fluid dynamics.

To get started, simply open the newest build of the model - mod_build5.R - and run the script! The ode solver 
used to simulated the model is deSolve. The call is at the bottom of the script. The paper that the model is 
built from is also included in the primary directory. A second paper frequently referenced by the authors for 
parameter values is Physiologically Based Pharmacokinetic Model for Specific and Nonspecific Monoclonal 
Antibodies and Fragments in Normal Tissues and Human Tumor Xenografts in Nude Mice by Laurence T. Baxter, et 
al. It's also included in the primary directory.

Link: https://cancerres.aacrjournals.org/content/54/6/1517.full-text.pdf

#;---- Citation ----;#
Physiologically Based Pharmacokinetic Model for Specific and Nonspecific Monoclonal Antibodies and Fragments
in Normal Tissues and Human Tumor Xenografts in Nude Mice. Laurence T. Baxter, Hui Zhu, Daniel G. Mackensen
and Rakesh K. Jain. Cancer Res March 15 1994 (54) (6) 1517-1528

The parameters are in the R script parameters.R. Following the paper exactly, I wasn't able to make a stable
model, so there are two parameterizations. The first "parameters" is simply the parameters as reported in the
original manuscript. The second is a modification I made on the reported parameters that actually works 
produces a stable model. Since the modification is on the lymph compartment, I called it 
"parameters_mod_lymph." ini.R contains the dataframes used to initialize the simulation and the initial 
administration event. The example plot is for your reference, to make sure the simulation engine is working 
correctly.
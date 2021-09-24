#The tumor parameters have to be specifically rethought as the documentation is insufficient
#See https://cancerres.aacrjournals.org/content/54/6/1517.long
#and ctrl+F tumor in the shah and betts paper to see how they arrived at various values

parameters  <- c(
  J_lungs = 1843.0,
  J_heart = 34.9,
  J_kidney = 87.3,
  J_brain = 1.4,
  J_muscle = 0.5,
  J_bone = 82.6,
  J_skin = 0.6,
  J_adipose = 1.6,
  J_si = 12.9,
  J_li = 5.2,
  J_spleen = 114.0,
  J_liver = 126.9,
  J_pancreas = 10.0,
  J_others = 86.8,

# Q from Shah and Betts 2012, plasma + blood cell flow
  Q_lungs = 373 + 305,
  Q_heart = 36.5 + 29.9,
  Q_kidney = 68.5 + 56.1,
  Q_brain = 11.8 + 9.64,
  Q_muscle = 86.1 + 70.5,
  Q_bone = 15.2 + 12.4,
  Q_skin = 27.8 + 22.8,
  Q_adipose = 13.4 + 11.0,
  Q_si = 58.1 + 47.5,
  Q_li = 17.3 + 14.1,
  Q_spleen = 8.18 + 6.70,
  Q_liver = 10.3 + 8.40,
  Q_pancreas = 6.24 + 5.10,
  Q_others = 10.9 + 8.91,

#' Shah and Betts 2012, total Lymph flow was .2% of plasma flow, so this is an estimate of what the
#' parameters might be
  L_lungs = 373/500,
  L_heart = 36.5/500,
  L_kidney = 68.5/500,
  L_brain = 11.8/500,
  L_muscle = 86.1/500,
  L_bone = 15.2/500,
  L_skin = 27.8/500,
  L_adipose = 13.4/500,
  L_si = 58.1/500,
  L_li = 17.3/500,
  L_spleen = 8.18/500,
  L_liver = 10.3/500,
  L_pancreas = 6.24/500,
  L_others = 10.9/500,

#' assumed here that plasma vol + blood cell vol = V_vascular
#' no documentation on whether that assumption is correct
  V_v_lungs = 0.0295 + 0.0241,
  V_v_heart = 0.00585 + 0.00479,
  V_v_kidney = 0.0289 + 0.0236,
  V_v_brain = 0.0107 + 0.00873,
  V_v_muscle = 0.249 + 0.204,
  V_v_bone = 0.0621 + 0.0508,
  V_v_skin = 0.188 + 0.154,
  V_v_adipose = 0.0218 + 0.0178,
  V_v_si = 0.0116 + 0.00950,
  V_v_li = 0.0050 + 0.00409,
  V_v_spleen = 0.0154 + 0.0126,
  V_v_liver = 0.164 + 0.134,
  V_v_pancreas = 0.00534 + 0.00437,
  V_v_others = 0.0195 + 0.0160,

#' never explicitely indicated by the paper what V_ev is
#' used interestitial + endosomal + cellular because that neatly subdivides
#' the tissue volume from shah/betts into two compartments
#' on 2/13/2020, I tried just using the interstitial space, but it did not
#' improve model performance
  V_ev_lungs = 0.0384 + 0.00102 + 0.111,
  V_ev_heart = 0.0217 + 0.000760 + 0.119,
  V_ev_kidney = 0.0788 + 0.00263 + 0.391,
  V_ev_brain = 0.0873 + 0.00243 + 0.376,
  V_ev_muscle = 1.47 + 0.0566 + 9.34,
  V_ev_bone = 0.525 + 0.0141 + 2.17,
  V_ev_skin = 1.66 + 0.0251 + 3.00,
  V_ev_adipose = 0.337 + 0.00991 + 1.60,
  V_ev_si = 0.127 + 0.00364 + 0.577,
  V_ev_li = 0.0545 + 0.00157 + 0.248,
  V_ev_spleen = 0.0254 + 0.000635 + 0.0730,
  V_ev_liver = 0.385 + 0.00963 + 1.23,
  V_ev_pancreas = 0.0169 + 0.000485 + 0.0699,
  V_ev_others = 0.0797 + 0.00233 + 0.348,
  
  F_lungs = 1,
  F_heart = 1,
  F_kidney = 1,
  F_brain = 1,
  F_muscle = 1,
  F_bone = 1,
  F_tumor = 1,
  F_skin = 1,
  F_adipose = 1,
  F_si = 1,
  F_li = 1,
  F_spleen = 1,
  F_liver = 1,
  F_pancreas = 1,
  F_others = 1,
  
  R_kidney = 3.9,
  R_spleen = 9.8,
  R_liver = 2.5,
  
  E_lungs = 0.84,

#' This isn't very well explained in either 2012 or 2019 paper, so there is a bit of guessing going on
#' Shah and Betts' model only uses a single lymph node with volume = 0.133
#' All lymph node volumes are arbitrarily set to 1/3 the volume of the single lymph node from 
#' shah and betts's parameterization because it produces a stable simulation
  V_lymph_node = 0.113/3,
  V_IGLN = 0.113/3,
  V_TDLN = 0.113/3,

#' Adding the plasma and blood cells volumes together
  V_whole_blood = 0.944 + 0.773,

#' Lymph flow was .2% of plasma flow
  L_lymph_node = 1.65/500,
  L_IGLN  = 1.65/500,
  L_TDLN  = 1.65/500,

  J_tumor = 0.6, # pulled directly from Khot et. al
  Q_tumor = 6,   # pulled directly from Khot et. al

#' 12.7 l/h/l tumor plasma flow
#' volume of tumor is 0.45 ml i.e. 0.45e-3 liters
#' 12.7*4.5E-4 = 0.005715 l/h
#' 0.005715*1E3 = 5.7... ml/h
#' finally, divide by 500 - i.e. 0.2% of plasma - to get lymph flow
  L_tumor = 12.7*(4.5E-1)/500,
  V_v_tumor = 0.45,

#' In shah/betts they claim that vascular volume is 7% of toal volume
#' working backward, I can then get total volume = 0.45/0.07
#' Then from total volume I can get interstitial and endosomal volume, 55% and 0.5%
#' of the total respectively. Unfortunately, no estimates on cellular volume for
#' tumors in shah/betts
  V_ev_tumor = (0.45/0.07)*(.55+.005)
)

#' This parameterization is the same as the previous except for index 94, 95, and 96
#' There, the lymph flow to the various nodes are modified
#'  Lymph flow was .2% of plasma flow in the paper, however
#' the CAR-T cells accumulate at an astonishingly high rate in the lymph compartments
#' unless the lymph flow is dramatically increased

parameters_mod_lymph  <- c(
  J_lungs = 1843.0,
  J_heart = 34.9,
  J_kidney = 87.3,
  J_brain = 1.4,
  J_muscle = 0.5,
  J_bone = 82.6,
  J_skin = 0.6,
  J_adipose = 1.6,
  J_si = 12.9,
  J_li = 5.2,
  J_spleen = 114.0,
  J_liver = 126.9,
  J_pancreas = 10.0,
  J_others = 86.8,
  
  # Q from Shah and Betts 2012, plasma + blood cell flow
  Q_lungs = 373 + 305,
  Q_heart = 36.5 + 29.9,
  Q_kidney = 68.5 + 56.1,
  Q_brain = 11.8 + 9.64,
  Q_muscle = 86.1 + 70.5,
  Q_bone = 15.2 + 12.4,
  Q_skin = 27.8 + 22.8,
  Q_adipose = 13.4 + 11.0,
  Q_si = 58.1 + 47.5,
  Q_li = 17.3 + 14.1,
  Q_spleen = 8.18 + 6.70,
  Q_liver = 10.3 + 8.40,
  Q_pancreas = 6.24 + 5.10,
  Q_others = 10.9 + 8.91,
  
  #' Shah and Betts 2012, total Lymph flow was .2% of plasma flow
  L_lungs = 373/500,
  L_heart = 36.5/500,
  L_kidney = 68.5/500,
  L_brain = 11.8/500,
  L_muscle = 86.1/500,
  L_bone = 15.2/500,
  L_skin = 27.8/500,
  L_adipose = 13.4/500,
  L_si = 58.1/500,
  L_li = 17.3/500,
  L_spleen = 8.18/500,
  L_liver = 10.3/500,
  L_pancreas = 6.24/500,
  L_others = 10.9/500,
  
  #' assumed here that plasma vol + blood cell vol = V_vascular
  V_v_lungs = 0.0295 + 0.0241,
  V_v_heart = 0.00585 + 0.00479,
  V_v_kidney = 0.0289 + 0.0236,
  V_v_brain = 0.0107 + 0.00873,
  V_v_muscle = 0.249 + 0.204,
  V_v_bone = 0.0621 + 0.0508,
  V_v_skin = 0.188 + 0.154,
  V_v_adipose = 0.0218 + 0.0178,
  V_v_si = 0.0116 + 0.00950,
  V_v_li = 0.0050 + 0.00409,
  V_v_spleen = 0.0154 + 0.0126,
  V_v_liver = 0.164 + 0.134,
  V_v_pancreas = 0.00534 + 0.00437,
  V_v_others = 0.0195 + 0.0160,
  
  #' never explicitely indicated by the paper what V_ev is
  #' used interestitial + endosomal + cellular because that neatly subdivides
  #' the tissue volume from shah/betts into two compartments
  #' on 2/13/2020, I tried just using the interstitial space, but it did not
  #' improve model performance
  V_ev_lungs = 0.0384 + 0.00102 + 0.111,
  V_ev_heart = 0.0217 + 0.000760 + 0.119,
  V_ev_kidney = 0.0788 + 0.00263 + 0.391,
  V_ev_brain = 0.0873 + 0.00243 + 0.376,
  V_ev_muscle = 1.47 + 0.0566 + 9.34,
  V_ev_bone = 0.525 + 0.0141 + 2.17,
  V_ev_skin = 1.66 + 0.0251 + 3.00,
  V_ev_adipose = 0.337 + 0.00991 + 1.60,
  V_ev_si = 0.127 + 0.00364 + 0.577,
  V_ev_li = 0.0545 + 0.00157 + 0.248,
  V_ev_spleen = 0.0254 + 0.000635 + 0.0730,
  V_ev_liver = 0.385 + 0.00963 + 1.23,
  V_ev_pancreas = 0.0169 + 0.000485 + 0.0699,
  V_ev_others = 0.0797 + 0.00233 + 0.348,
  
  F_lungs = 1,
  F_heart = 1,
  F_kidney = 1,
  F_brain = 1,
  F_muscle = 1,
  F_bone = 1,
  F_tumor = 1,
  F_skin = 1,
  F_adipose = 1,
  F_si = 1,
  F_li = 1,
  F_spleen = 1,
  F_liver = 1,
  F_pancreas = 1,
  F_others = 1,
  
  R_kidney = 3.9,
  R_spleen = 9.8,
  R_liver = 2.5,
  
  E_lungs = 0.84,
  
  #' This isn't very well explained in either 2012 or 2019 paper, so there is a bit of guessing going on
  #' Shah and Betts' model only uses a single lymph node with volume = 0.133
  #' All lymph node volumes are arbitrarily set to 1/3 the volume of the single lymph node from 
  #' shah and betts's parameterization
  V_lymph_node = 0.113/3,
  V_IGLN = 0.113/3,
  V_TDLN = 0.113/3,
  
  #' Adding the plasma and blood cells volumes together
  V_whole_blood = 0.944 + 0.773,
  
  #' Lymph flow was .2% of plasma flow in the paper, however
  #' the CAR-T cells accumulate at an astonishingly high rate in the lymph compartments
  #' unless the lymph flow is dramatically increased
  L_lymph_node = 1.65,
  L_IGLN  = 1.65,
  L_TDLN  = 1.65,
  
  J_tumor = 0.6, # pulled directly from Khot et. al
  Q_tumor = 6,   # pulled directly from Khot et. al
  
  #' 12.7 l/h/l tumor plasma flow
  #' volume of tumor is 0.45 ml i.e. 0.45e-3 liters
  #' 12.7*4.5E-4 = 0.005715 l/h
  #' 0.005715*1E3 = 5.7... ml/h
  #' finally, divide by 500 - i.e. 0.2% of plasma - to get lymph flow

  L_tumor = 12.7*(4.5E-1)/500,
  V_v_tumor = 0.45,
  #' In shah/betts they claim that vascular volume is 7% of toal volume
  #' working backward, I can then get total volume = 0.45/0.07
  #' Then from total volume I can get interstitial and endosomal volume, 55% and 0.5%
  #' of the total respectively. Unfortunately, no estimates on cellular volume for
  #' tumors in shah/betts
  V_ev_tumor = (0.45/0.07)*(.55+.005)
)

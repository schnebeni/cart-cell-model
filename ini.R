#just assuming that initial state is zero except for the bolus to the blood

state <- c(
  # initial injection via IV ========================================================                 
  C_whole_blood = 0, 
  C_lymph_node  = 0, C_v_tumor    = 0, C_v_liver  = 0, C_v_lungs    = 0, C_v_adipose = 0, 
  C_v_heart     = 0, C_v_kidney   = 0, C_v_brain  = 0, C_v_others   = 0, C_v_skin    = 0, 
  C_v_si        = 0, C_v_li       = 0, C_v_spleen = 0, C_v_pancreas = 0, C_v_muscle  = 0, 
  C_v_bone      = 0, C_TDLN       = 0, C_IGLN     = 0, C_ev_tumor   = 0, C_ev_liver  = 0, 
  C_ev_lungs    = 0, C_ev_adipose = 0, C_ev_heart = 0, C_ev_kidney  = 0, C_ev_brain  = 0, 
  C_ev_others   = 0, C_ev_skin    = 0, C_ev_si    = 0, C_ev_li      = 0, C_ev_spleen = 0, 
  C_ev_pancreas = 0, C_ev_muscle  = 0, C_ev_bone  = 0, elimination  = 0)


events <- data.frame(var = c("C_whole_blood"), time = c(1), value = c(1000000), method = c("add"))
events <- list(data = events)

state_mod_lymph <- c(
  # initial injection via IV ========================================================      
  C_lymph_node  = 0, 
  C_whole_blood = 0, C_v_tumor    = 0, C_v_liver  = 0, C_v_lungs    = 0, C_v_adipose = 0, 
  C_v_heart     = 0, C_v_kidney   = 0, C_v_brain  = 0, C_v_others   = 0, C_v_skin    = 0, 
  C_v_si        = 0, C_v_li       = 0, C_v_spleen = 0, C_v_pancreas = 0, C_v_muscle  = 0, 
  C_v_bone      = 0, C_TDLN       = 0, C_IGLN     = 0, C_ev_tumor   = 0, C_ev_liver  = 0, 
  C_ev_lungs    = 0, C_ev_adipose = 0, C_ev_heart = 0, C_ev_kidney  = 0, C_ev_brain  = 0, 
  C_ev_others   = 0, C_ev_skin    = 0, C_ev_si    = 0, C_ev_li      = 0, C_ev_spleen = 0, 
  C_ev_pancreas = 0, C_ev_muscle  = 0, C_ev_bone  = 0, elimination  = 0)
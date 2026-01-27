# Initiation file

## Package upload
if (TRUE) {rm(list = ls() )}
if (TRUE) {
  suppressWarnings(suppressMessages({
    ### PASSWORD
    library(rstudioapi)
    ### DATA: obtain, wrangle and explore
    library(RJDBC)
    library(readxl)
    library(tidyverse)
    library(posterior)
    library(lubridate)
    library(stringi)
    library(janitor)
    ### TABLES: create and modify
    library(gtsummary)
    library(flextable)
    library(kableExtra)
    library(sjPlot)
    ### PLOTS
    library(ggpubr)
    library(cowplot)
    library(ggdist)
    ### STATS
    library(glmmTMB)
    library(rms)
    library(rmsb)
    library(brms)
    library(emmeans)
    library(car)
    library(arm)
    library(pROC)
    library(parallel)
    library(survival)
    library(UpSetR)
    library(ComplexUpset)
    library(scales)
  }))
}


## Functions

### set functions clashes
select <- dplyr::select
rename <- dplyr::rename
mutate <- dplyr::mutate
recode <- dplyr::recode
summarise <- dplyr::summarise
count <- dplyr::count

## Set directory
path <- '/home/ticf/secured_data/GitRepo/ticf/736_ZAHI_CKD'
setwd(path)

### loading custom functions
invisible(
  lapply(
    list.files(
      'r/functions', pattern = "\\.R$", full.names = TRUE), 
    source)
)


## Create folders
folders <- c("data", 
             "data/db_history",
             "gitignore",
             "gitignore/run",
             "gitignore/figures",
             "gitignore/data",
             "gitignore/html_reports")

invisible(
  lapply(
    folders, function(x) if (!dir.exists(x)) 
      dir.create(x, recursive = TRUE)
  )
)


## Set seed
seeding <- 736
set.seed(seeding)

## Upload data
if(!file.exists('data/data_ckd.rds')){
  data_ckd <- readxl::read_excel(
    "~/1_ticf_sec/736_ZAHI_CKD/gitignore/data/mastertable 14_11.xlsx"
    ) %>% 
    dplyr::rename(
      patient_id = PatientAmb,
      organ = organ,
      age = age,
      sex = sex,
      BMI_last = BMIlast,
      consent = consent,
      date_sampling = `datum odberu`,
      uACR_value = uACRValue,
      eGFR_value = eGFRValue,
      ACR_quant = `ACR...10`,
      GFR_quant = `GFR...11`,
      classification = klasifikace,
      transplant = Tx,
      nephrology_disp = `nephro disp`,
      FU_DM = FU_DM,
      FU_DM1 = FU_DM1,
      FU_DM2 = FU_DM2,
      FU_atherosclerosis = `FU_ateroskleroza`,
      ischemic_heart_disease = `Ischemická choroba srdeční`,
      FU_steatosis = FU_steatoza,
      FU_hypertension = `FU_hypertenze`,
      FU_atrial_fibrillation = FU_FIS,
      FU_heart_failure = FU_SS,
      FU_charlson_index = FU_CCI,
      FU_GLP1 = FU_GLP1,
      FU_SGLT2 = FU_SGLT2,
      FU_RAASi = FU_RAASi,
      FU_finerenone = FU_finerenon,
      previous_ACR_positive = `Previous ACR positive`,
      previous_low_GFR = `Previous low GFR`,
      CKD_record = `CKD zaznam`,
      identified_CKD_by_lab = `Identified CKD by lab`,
      CKD_previous = `Previous CKD`,
      total_CKD = `Total CKD`,
      elig_RAASi_all = `Elig_RAASi all`,
      elig_RAASi_ACR_pos = `Elig_RAASi ACR+`,
      elig_SGLT2i_HF = `Elig_SGLT2i HF`,
      elig_SGLT2i_nonDM = `Elig_SGLT2i non-DM`,
      elig_SGLT2i_DM = `Elig_SGLT2i DM`,
      elig_SGLT2i_nephro = `Elig_SGLT2i nephro`,
      elig_SGLT2i_total = `Elig_SGLT_22i total`,
      elig_GLP1_RA = `Elig_GLP1 RA`,
      elig_finerenone = `Elig_Finerenone`,
      age_cat = age_cat,
      ACR_text = `ACR...45`,
      eGFR_text = `GFR...46`,
      comb = comb,
      ACR_in_past_2y = `ACR in past 2 years`,
      total_CKD2 = `Total CKD2`,
      new_cases = `New cases`,
      FU_CCI_CKD = `FU_CCI+CKD`,
      FU_stroke = FU_iktus,
      FU_PAD = FU_ICHDK
    ) %>% 
    dplyr::mutate(
      patient_id = factor(patient_id),
      organ = factor(organ),
      sex = factor(sex),
      ACR_quant = factor(ACR_quant, ordered = TRUE),
      GFR_quant = factor(GFR_quant, ordered = TRUE),
      classification = factor(classification),
      age_cat = factor(age_cat, ordered = TRUE),
      ACR_text = factor(ACR_text),
      GFR_text = factor(eGFR_text),
      comb = factor(comb),
      date_sampling = as.Date(date_sampling),
      previous_ACR_positive = if_else(
        is.na(previous_ACR_positive), 0, previous_ACR_positive
        ),
      previous_low_GFR = if_else(
        is.na(previous_low_GFR), 0, previous_low_GFR
      ),
      elig_SGLT2i_nonDM = if_else(
        is.na(elig_SGLT2i_nonDM), 0, elig_SGLT2i_nonDM
      ),
      elig_SGLT2i_DM = if_else(
        is.na(elig_SGLT2i_DM), 0, elig_SGLT2i_DM
      )
    ) %>% 
    dplyr::select(
      date_sampling, consent, age, sex,
      uACR_value, ACR_text, eGFR_value, eGFR_text, identified_CKD_by_lab,
      CKD_record, 
      new_cases,
      transplant, 
      BMI_last, FU_stroke:FU_PAD,
      FU_DM:FU_finerenone,
      elig_RAASi_all, elig_SGLT2i_total, 
      elig_GLP1_RA, elig_finerenone
    )
  
  saveRDS(data_ckd, 'data/data_ckd.rds')
  write_csv(data_ckd, 'data/data_ckd.csv')
}

data_ckd <- readRDS('data/data_ckd.rds')
data_survival <- readRDS('data/data_survival.rds')




























































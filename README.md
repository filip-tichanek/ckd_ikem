**Authors and affiliations**

<div style="font-size: larger;">
Ivan Zahradka<sup>1</sup>, Vojtech Petr<sup>1</sup>, Filip Tichanek<sup>3</sup>, Adriana Chroma<sup>1</sup>, Tomas Neskudla<sup>2</sup>, Michal Kahle<sup>2</sup>, Robert Bem<sup>3</sup>, Pavel Trunecka<sup>4</sup>, Vera Adamkova<sup>5</sup>, Petra Hruba<sup>6</sup>, Ivo Hlavac<sup>7</sup>, Ondrej Viklicky<sup>1,6</sup>
</div>

<br>
 
<sup>1</sup> Department of Nephrology, Institute for Clinical and Experimental Medicine, Prague, Czech Republic           
<sup>2</sup> Department of Data Science, Institute for Clinical and Experimental Medicine, Prague, Czech Republic             
<sup>3</sup> Diabetes Centre, Institute for Clinical and Experimental Medicine, Prague, Czech Republic              
<sup>4</sup> Department of Hepatogastroenterology, Institute for Clinical and Experimental Medicine, Prague, Czech Republic              
<sup>5</sup> Center of Preventive Medicine, Institute for Clinical and Experimental Medicine, Prague, Czech Republic             
<sup>6</sup> Transplantation Laboratory, Institute for Clinical and Experimental Medicine, Prague, Czech Republic             
<sup>7</sup> Department of Epidemiology and Public Health, Faculty of Medicine, University of Ostrava, Ostrava, Czech Republic      
          
---------------------------------------------------------------------------------------------------

This is a statistical report of the study of Zahradka et al., *Chronic Kidney Disease Among Outpatients in a Central European Tertiary Care Centre: High Prevalence and Inadequate Treatment*.

When using this code or data, cite the original publication:

> TO BE ADDED

---------------------------------------------------------------------------------------------------

Original [GitHub repository](https://github.com/filip-tichanek/ckd_ikem): https://github.com/filip-tichanek/ckd_ikem

Statistical **reports** can be found [here](https://filip-tichanek.github.io/ckd_ikem/): https://filip-tichanek.github.io/ckd_ikem/

----------------------------------------------------------------------------------------------------

# Introduction

This repository contains the R code and data wrangling for our study on CKD screening in specialized internal medicine outpatient departments, investigating whether tertiary care centres are effective settings for CKD screening and evaluating how renoprotective drugs are prescribed in practice

## Research Questions:

1/ What is the prevalence of CKD within non-nephrology internal medicine outpatient clinics?

2/ How does CKD prevalence vary across age?

3/ To address potential overestimation in older populations due to physiological eGFR decline, what is the prevalence when using an age-calibrated CKD definition?

4/ What are the primary clinical risk factors associated with CKD in this setting?

5/ What is the prevalence of previously undetected CKD, and which factors are associated with being undiagnosed?

6/ What proportion of eligible CKD patients are currently not receiving indicated renoprotective therapies (the treatment gap)?

7/ What is the estimated clinical benefit, in terms of dialysis-free months saved per patient, if all eligible individuals were treated according to current guidelines?

## Datasets 

All data needed for the analysis are available in the `.rds` format in Zenodo as well as GitHub repository. There are two datasets:

1/ `data_ckd.rds` are primarily data needed to asnwer the questions #1 to #6. This includes the data of 2903 patients, with each row representing one patient. 

2/ `data_survival.rds` are data that help to solve the question #7, specifically historical data of patient in our institutaion that are needed for predictinng remaining survival to estimate a possible prolongation of dialysis-free survival when eligible (but not currently used) medication is taken. 

### `data_ckd.rds` data dictionary

| Variable | Type | Description | Values / Units |
| :--- | :--- | :--- | :--- |
| `date_sampling` | Date | Date of laboratory sample collection | YYYY-MM-DD |
| `consent` | Numeric (Binary) | Informed consent obtained from the participant | 0: No (unscreened patient), 1: Yes (patient from screening cohort) |
| `age` | Numeric | Patient age at the time of sampling | Years |
| `sex` | Factor | Biological sex | F: Female, M: Male |
| `uACR_value` | Numeric | Urinary Albumin-to-Creatinine Ratio | mg/g |
| `eGFR_value` | Numeric | Estimated Glomerular Filtration Rate | mL/s/1.73m² |
| `identified_CKD_by_lab` | Numeric (Binary) | CKD status based on laboratory threshold criteria | 0: No, 1: Yes |
| `CKD_record` | Numeric (Binary) | CKD diagnosis present in official medical records | 0: No, 1: Yes |
| `new_cases` | Numeric (Binary) | Incident CKD cases newly identified during the study | 0: No, 1: Yes |
| `transplant` | Numeric (Binary) | History of non-renal transplantation | 0: No, 1: Yes |
| `BMI_last` | Numeric | Last recorded Body Mass Index | kg/m² |
| `FU_stroke` | Numeric (Binary) | History of Stroke | 0: No, 1: Yes |
| `FU_PAD` | Numeric (Binary) | History of Peripheral Artery Disease | 0: No, 1: Yes |
| `FU_DM` | Numeric (Binary) | Diabetes Mellitus (any type) | 0: No, 1: Yes |
| `FU_DM1` | Numeric (Binary) | Type 1 Diabetes Mellitus | 0: No, 1: Yes |
| `FU_DM2` | Numeric (Binary) | Type 2 Diabetes Mellitus | 0: No, 1: Yes |
| `FU_atherosclerosis` | Numeric (Binary) | Presence of Atherosclerosis | 0: No, 1: Yes |
| `ischemic_heart_disease` | Numeric (Binary) | Presence of Ischemic Heart Disease | 0: No, 1: Yes |
| `FU_steatosis` | Numeric (Binary) | Presence of Hepatic Steatosis | 0: No, 1: Yes |
| `FU_hypertension` | Numeric (Binary) | Presence of Hypertension | 0: No, 1: Yes |
| `FU_atrial_fibrillation` | Numeric (Binary) | Presence of Atrial Fibrillation | 0: No, 1: Yes |
| `FU_heart_failure` | Numeric (Binary) | Presence of Heart Failure | 0: No, 1: Yes |
| `FU_charlson_index` | Numeric | Charlson Comorbidity Index score | Range: 0–14 |
| `FU_GLP1` | Numeric (Binary) | Current use of GLP-1 Receptor Agonists | 0: No, 1: Yes |
| `FU_SGLT2` | Numeric (Binary) | Current use of SGLT2 Inhibitors | 0: No, 1: Yes |
| `FU_RAASi` | Numeric (Binary) | Current use of RAAS Inhibitors (ACEi/ARB) | 0: No, 1: Yes |
| `FU_finerenone` | Numeric (Binary) | Current use of Finerenone | 0: No, 1: Yes |
| `elig_RAASi_all` | Numeric (Binary) | Eligible for RAASi treatment based on guidelines | 0: No, 1: Yes |
| `elig_SGLT2i_total` | Numeric (Binary) | Eligible for SGLT2i treatment based on guidelines | 0: No, 1: Yes |
| `elig_GLP1_RA` | Numeric (Binary) | Eligible for GLP-1 RA treatment based on guidelines | 0: No, 1: Yes |
| `elig_finerenone` | Numeric (Binary) | Eligible for Finerenone treatment based on guidelines | 0: No, 1: Yes |


### `data_survival.rds` data dictionary

| Variable | Type | Description | Values / Units |
| :--- | :--- | :--- | :--- |
| `EntryDate` | Date | Date of entry into the study | YYYY-MM-DD |
| `Sex` | Factor | Biological sex | F: Female, M: Male |
| `age` | Numeric | Age at the time of entry | Years |
| `BMI` | Numeric | Body Mass Index | kg/m² |
| `eGFR_ckd_epi` | Numeric | Estimated Glomerular Filtration Rate | mL/s/1.73m² |
| `ACR` | Numeric | Urinary Albumin-to-Creatinine Ratio | mg/g |
| `transplant` | Numeric (Binary) | History of non-renal transplantation | 0: No, 1: Yes |
| `CKD_record` | Numeric (Binary) | CKD diagnosis present in medical records | 0: No, 1: Yes |
| `FU_DM` | Numeric (Binary) | Presence of Diabetes Mellitus | 0: No, 1: Yes |
| `FU_hypertension` | Numeric (Binary) | Presence of Hypertension | 0: No, 1: Yes |
| `FU_heart_failure` | Numeric (Binary) | Presence of Heart Failure | 0: No, 1: Yes |
| `FU_atrial_fibrillation` | Numeric (Binary) | Presence of Atrial Fibrillation | 0: No, 1: Yes |
| `ischemic_heart_disease` | Numeric (Binary) | Presence of Ischemic Heart Disease | 0: No, 1: Yes |
| `FU_atherosclerosis_PAD` | Numeric (Binary) | Presence of Peripheral Artery Disease | 0: No, 1: Yes |
| `FU_stroke` | Numeric (Binary) | History of Stroke | 0: No, 1: Yes |
| `FU_steatosis` | Numeric (Binary) | Presence of Hepatic Steatosis | 0: No, 1: Yes |
| `time` | Numeric | Follow-up time (years) from entry to event or censoring | Years |
| `event` | Numeric (Binary) | Mortality indicator (status) | 0: Alive/Censored, 1: Dead |


# Statistical methods

Statistical modelling is described in detail in [this section](https://filip-tichanek.github.io/ckd_ikem/#statistical-modelling-description) of the statistical report. 


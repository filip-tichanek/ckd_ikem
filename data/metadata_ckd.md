# Metadata: Chronic Kidney Disease Study (data_ckd)

This document provides the data dictionary for the `data_ckd.rds` dataset. The data is intended for reproducible analysis of the study by Zahradka et al., *Chronic Kidney Disease Among Outpatients in a Central European Tertiary Care Centre: High Prevalence and Inadequate Treatment*. 

## File Information
* **Filename:** `data_ckd.rds`
* **Format:** R Serialization Object (RDS)
* **Description:** Patient-level clinical and laboratory data.

---

## Data Dictionary

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

---

### Notes
* **Binary Variables:** All clinical indicators and eligibility flags are stored as numeric values (0/1)
* **eGFR Units:** Values are recorded in **mL/s/1.73m²**. To convert to the conventional mL/min/1.73m², multiply by 60.
* **Missing Values:** `BMI_over30` contain 30 missing observations (NAs).


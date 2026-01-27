# Metadata: CKD Survival Analysis (data_survival)

This document provides the data dictionary for the `data_survival.rds` dataset. The data is intended for reproducible analysis of the study by Zahradka et al., *Chronic Kidney Disease Among Outpatients in a Central European Tertiary Care Centre: High Prevalence and Inadequate Treatment*

## File Information
* **Filename:** `data_survival.rds`
* **Format:** R Serialization Object (RDS)
* **Description:** Longitudinal dataset containing survival times, mortality events, and baseline clinical characteristics.

---

## Data Dictionary

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

---

### Notes
* **Binary Variables:** All clinical indicators, mortality events, and sex indicators are stored as numeric values (0/1) for statistical modeling.
* **eGFR Units:** Values are recorded in **mL/s/1.73m²**. To convert to the conventional mL/min/1.73m², multiply by 60.


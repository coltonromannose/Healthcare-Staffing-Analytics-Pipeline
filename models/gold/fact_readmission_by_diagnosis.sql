{{ config(materialized = 'table', schema = 'GOLD') }}

SELECT 
  'MISSING_DATA' AS diagnosis_category,
  NULL::NUMBER(5,2) AS avg_30day_readmission_rate,
  NULL::NUMBER(8,2) AS avg_hosp_per_1000_longstay;

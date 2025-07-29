{{ config(materialized = 'table', schema = 'GOLD') }}

SELECT
  CORR(staffing_hours_per_bed_per_day, occupancy_rate) AS corr_nurse_hours_vs_occupancy
FROM {{ ref('fact_staffing_occupancy') }}

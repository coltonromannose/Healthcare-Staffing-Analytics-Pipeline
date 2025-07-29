{{ config(materialized = 'table', schema = 'GOLD') }}

SELECT
  state,
  provider_type,
  AVG(reported_rn_staffing_hours_per_resident_per_day) AS avg_rn_hppd,
  AVG(reported_total_nurse_staffing_hours_per_resident_per_day) AS avg_total_hppd
FROM {{ ref('provider_info') }}
GROUP BY
  state,
  provider_type

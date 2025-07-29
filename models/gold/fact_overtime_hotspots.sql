{{ config(materialized = 'table', schema = 'GOLD') }}

SELECT
  provider_id,
  state,
  DATE_TRUNC('month', staffing_date) AS year_month,
  SUM(
    COALESCE(hrs_rndon_ctr, 0)
    + COALESCE(hrs_rn_admin_ctr, 0)
    + COALESCE(hrs_rn_ctr, 0)
    + COALESCE(hrs_lpn_admin_ctr, 0)
    + COALESCE(hrs_lpn_ctr, 0)
    + COALESCE(hrs_cna_ctr, 0)
    + COALESCE(hrs_natrn_ctr, 0)
    + COALESCE(hrs_medaide_ctr, 0)
  ) AS total_contract_hours
FROM {{ ref('pbj_daily_nurse_staffing') }}
GROUP BY
  provider_id,
  state,
  DATE_TRUNC('month', staffing_date)

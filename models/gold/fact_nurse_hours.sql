{{ config(materialized = 'table', schema = 'GOLD') }}

SELECT
  provider_id,
  state,
  DATE_TRUNC('month', staffing_date) AS year_month,
  SUM(
    COALESCE(hrs_rndon, 0)
    + COALESCE(hrs_rn_admin, 0)
    + COALESCE(hrs_rn, 0)
    + COALESCE(hrs_lpn_admin, 0)
    + COALESCE(hrs_lpn, 0)
    + COALESCE(hrs_cna, 0)
    + COALESCE(hrs_natrn, 0)
    + COALESCE(hrs_medaide, 0)
  ) AS total_nursing_hours
FROM {{ ref('pbj_daily_nurse_staffing') }}
GROUP BY
  provider_id,
  state,
  DATE_TRUNC('month', staffing_date) 
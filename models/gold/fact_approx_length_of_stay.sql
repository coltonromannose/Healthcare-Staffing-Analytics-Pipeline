{{ config(materialized = 'table', schema = 'GOLD') }}

SELECT
  state,
  DATE_TRUNC('month', staffing_date) AS year_month,
  SUM(avg_census) / COUNT(DISTINCT staffing_date) AS approx_avg_length_of_stay_days
FROM {{ ref('pbj_daily_nurse_staffing') }}
GROUP BY
  state,
  DATE_TRUNC('month', staffing_date)

{{ config(materialized = 'table', schema = 'GOLD') }}

SELECT
  state,
  year_month,
  SUM(total_nursing_hours) AS state_monthly_nursing_hours
FROM {{ ref('fact_nurse_hours') }}
GROUP BY
  state,
  year_month;
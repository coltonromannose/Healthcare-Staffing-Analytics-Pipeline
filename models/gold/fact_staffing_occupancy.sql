{{ config(materialized = 'table', schema = 'GOLD') }}

SELECT
  fnh.provider_id,
  fnh.state,
  fnh.year_month,
  fnh.total_nursing_hours
    / NULLIF(
        pi.number_of_certified_beds * DATEDIFF('day', fnh.year_month, DATEADD('month', 1, fnh.year_month)),
        0
      ) AS staffing_hours_per_bed_per_day,
  pi.avg_residents_per_day / NULLIF(pi.number_of_certified_beds, 0) AS occupancy_rate
FROM {{ ref('fact_nurse_hours') }} fnh
JOIN {{ ref('provider_info') }} pi
  ON fnh.provider_id = pi.provider_id
WHERE pi.number_of_certified_beds > 0

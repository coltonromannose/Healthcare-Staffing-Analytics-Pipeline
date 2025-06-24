{{ config(materialized='table') }}

SELECT
    LOWER("CMS Certification Number (CCN)") AS federal_provider_number,
    LOWER("Provider Name") AS provider_name,
    LOWER("Provider Address") AS provider_address,
    LOWER("City/Town") AS city_town,
    LOWER("State") AS state,
    LOWER("ZIP Code") AS zip_code,
    LOWER("Measure Code") AS measure_code,
    LOWER("Measure Description") AS measure_description,
    LOWER("Resident type") AS resident_type,
    CAST("Q1 Measure Score" AS FLOAT) AS q1_measure_score,
    CAST("Q2 Measure Score" AS FLOAT) AS q2_measure_score,
    CAST("Q3 Measure Score" AS FLOAT) AS q3_measure_score,
    CAST("Q4 Measure Score" AS FLOAT) AS q4_measure_score,
    CAST("Four Quarter Average Score" AS FLOAT) AS four_qtr_avg_score,
    LOWER("Used in Quality Measure Five Star Rating") AS used_in_five_star_rating,
    LOWER("Measure Period") AS measure_period,
    LOWER("Location") AS location,
    TO_VARCHAR(TRY_TO_DATE("Processing Date", 'YYYY-MM-DD'), 'MM/DD/YYYY') AS processing_date
FROM HEALTHSTAFFDB.BRONZE.QUALITY_MDS_RAW


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
    CAST("Adjusted Score" AS FLOAT) AS adjusted_score,
    CAST("Observed Score" AS FLOAT) AS observed_score,
    CAST("Expected Score" AS FLOAT) AS expected_score,
    LOWER("Footnote for Score") AS score_footnote,
    LOWER("Used in Quality Measure Five Star Rating") AS used_in_five_star_rating,
    LOWER("Measure Period") AS measure_period,
    LOWER("Location") AS location,
    TO_VARCHAR(TRY_TO_DATE("Processing Date", 'YYYY-MM-DD'), 'MM/DD/YYYY') AS processing_date
FROM HEALTHSTAFFDB.BRONZE.QUALITY_CLAIMS_RAW

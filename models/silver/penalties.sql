{{ config(materialized='table') }}
SELECT
    LOWER("CMS Certification Number (CCN)") AS federal_provider_number,
    LOWER("Provider Name") AS provider_name,
    LOWER("Provider Address") AS provider_address,
    LOWER("City/Town") AS city_town,
    LOWER("State") AS state,
    LOWER("ZIP Code") AS zip_code,
    TO_VARCHAR(TRY_TO_DATE("Penalty Date", 'YYYY-MM-DD'), 'MM/DD/YYYY') AS fine_date,
    LOWER("Penalty Type") AS penalty_type,
    CAST("Fine Amount" AS FLOAT) AS fine_amount,
    TO_VARCHAR(TRY_TO_DATE("Payment Denial Start Date", 'YYYY-MM-DD'), 'MM/DD/YYYY') AS payment_denial_start_date,
    CAST("Payment Denial Length in Days" AS INTEGER) AS payment_denial_length_days,
    LOWER("Location") AS location,
    TO_VARCHAR(TRY_TO_DATE("Processing Date", 'YYYY-MM-DD'), 'MM/DD/YYYY') AS processing_date
FROM HEALTHSTAFFDB.BRONZE.PENALTIES_RAW

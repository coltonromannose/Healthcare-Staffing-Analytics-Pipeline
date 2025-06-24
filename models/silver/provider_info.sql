
{{ config(materialized='table') }}


SELECT
    LOWER("CMS Certification Number (CCN)") AS provider_id,
    LOWER("Provider Name") AS provider_name,
    LOWER("State") AS state,
    LOWER("Ownership Type") AS ownership_type,
    LOWER("Provider Type") AS provider_type,
    CAST("Overall Rating" AS INTEGER) AS overall_rating,
    CAST("Number of Certified Beds" AS INTEGER) AS number_of_certified_beds,
    CAST("Average Number of Residents per Day" AS FLOAT) AS avg_residents_per_day,
    LOWER("County/Parish") AS provider_ssa_county_name,
    CAST("Reported RN Staffing Hours per Resident per Day" AS FLOAT) AS reported_rn_staffing_hours_per_resident_per_day,
    CAST("Reported Total Nurse Staffing Hours per Resident per Day" AS FLOAT) AS reported_total_nurse_staffing_hours_per_resident_per_day,
    CAST("Total nursing staff turnover" AS FLOAT) AS total_nursing_staff_turnover,
    CAST("Number of Fines" AS INTEGER) AS number_of_fines,
    CAST("Total Amount of Fines in Dollars" AS FLOAT) AS total_amount_of_fines_in_dollars
FROM HEALTHSTAFFDB.BRONZE.PROVIDER_INFO_RAW

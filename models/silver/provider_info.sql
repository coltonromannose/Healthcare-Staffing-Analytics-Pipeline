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

    -- All detailed staffing hours (skill mix)
    CAST("Reported Nurse Aide Staffing Hours per Resident per Day" AS FLOAT) AS reported_nurse_aide_staffing_hours_per_resident_per_day,
    CAST("Reported LPN Staffing Hours per Resident per Day" AS FLOAT) AS reported_lpn_staffing_hours_per_resident_per_day,
    CAST("Reported RN Staffing Hours per Resident per Day" AS FLOAT) AS reported_rn_staffing_hours_per_resident_per_day,
    CAST("Reported Licensed Staffing Hours per Resident per Day" AS FLOAT) AS reported_licensed_staffing_hours_per_resident_per_day,
    CAST("Reported Total Nurse Staffing Hours per Resident per Day" AS FLOAT) AS reported_total_nurse_staffing_hours_per_resident_per_day,

    -- Weekend staffing hours
    CAST("Total number of nurse staff hours per resident per day on the weekend" AS FLOAT) AS weekend_total_nurse_staffing_hours_per_resident_per_day,
    CAST("Registered Nurse hours per resident per day on the weekend" AS FLOAT) AS weekend_rn_staffing_hours_per_resident_per_day,

    -- Turnover and admin fields
    CAST("Total nursing staff turnover" AS FLOAT) AS total_nursing_staff_turnover,
    CAST("Registered Nurse turnover" AS FLOAT) AS registered_nurse_turnover,
    CAST("Number of administrators who have left the nursing home" AS INTEGER) AS administrator_turnover,

    -- Case-mix and adjusted staffing
    CAST("Nursing Case-Mix Index" AS FLOAT) AS nursing_case_mix_index,
    CAST("Adjusted Nurse Aide Staffing Hours per Resident per Day" AS FLOAT) AS adjusted_nurse_aide_staffing_hours_per_resident_per_day,
    CAST("Adjusted LPN Staffing Hours per Resident per Day" AS FLOAT) AS adjusted_lpn_staffing_hours_per_resident_per_day,
    CAST("Adjusted RN Staffing Hours per Resident per Day" AS FLOAT) AS adjusted_rn_staffing_hours_per_resident_per_day,
    CAST("Adjusted Total Nurse Staffing Hours per Resident per Day" AS FLOAT) AS adjusted_total_nurse_staffing_hours_per_resident_per_day,
    CAST("Adjusted Weekend Total Nurse Staffing Hours per Resident per Day" AS FLOAT) AS adjusted_weekend_total_nurse_staffing_hours_per_resident_per_day,

    -- Facility status flags (for reference)
    LOWER("Special Focus Status") AS special_focus_status,
    LOWER("With a Resident and Family Council") AS has_resident_family_council,

    -- Fines
    CAST("Number of Fines" AS INTEGER) AS number_of_fines,
    CAST("Total Amount of Fines in Dollars" AS FLOAT) AS total_amount_of_fines_in_dollars,

    -- date
    TO_DATE("Processing Date", 'YYYY-MM-DD') AS processing_date



FROM HEALTHSTAFFDB.BRONZE.PROVIDER_INFO_RAW

{{ config(materialized='table') }}

SELECT
    LOWER("State or Nation") AS state_or_nation,
    CAST("Average Number of Residents per Day" AS FLOAT) AS average_number_of_residents_per_day,
    CAST("Reported Nurse Aide Staffing Hours per Resident per Day" AS FLOAT) AS reported_nurse_aide_staffing_hours_per_resident_per_day,
    CAST("Reported LPN Staffing Hours per Resident per Day" AS FLOAT) AS reported_lpn_staffing_hours_per_resident_per_day,
    CAST("Reported RN Staffing Hours per Resident per Day" AS FLOAT) AS reported_rn_staffing_hours_per_resident_per_day,
    CAST("Reported Licensed Staffing Hours per Resident per Day" AS FLOAT) AS reported_licensed_staffing_hours_per_resident_per_day,
    CAST("Reported Total Nurse Staffing Hours per Resident per Day" AS FLOAT) AS reported_total_nurse_staffing_hours_per_resident_per_day,
    CAST("Total nursing staff turnover" AS FLOAT) AS total_nursing_staff_turnover,
    CAST("Registered Nurse turnover" AS FLOAT) AS registered_nurse_turnover,
    CAST("Number of administrators who have left the nursing home" AS INTEGER) AS number_of_administrators_who_have_left_the_nursing_home,
    CAST("Number of Fines" AS INTEGER) AS number_of_fines,
    CAST("Fine Amount in Dollars" AS FLOAT) AS fine_amount_in_dollars,
    CAST("Percentage of long stay residents whose need for help with daily activities has increased" AS FLOAT) AS pct_long_stay_increased_help,
    CAST("Percentage of long stay residents who lose too much weight" AS FLOAT) AS pct_long_stay_weight_loss,
    CAST("Percentage of long stay residents who have depressive symptoms" AS FLOAT) AS pct_long_stay_depressive_symptoms,
    CAST("Percentage of long stay residents assessed and appropriately given the pneumococcal vaccine" AS FLOAT) AS pct_long_stay_vax_pneumococcal,
    CAST("Number of hospitalizations per 1000 long-stay resident days" AS FLOAT) AS hospitalizations_per_1000_days,
    CAST("Number of outpatient emergency department visits per 1000 long-stay resident days" AS FLOAT) AS ed_visits_per_1000_days,
    TO_VARCHAR(TRY_TO_DATE("Processing Date", 'YYYY-MM-DD'), 'MM/DD/YYYY') AS processing_date
FROM HEALTHSTAFFDB.BRONZE.STATE_AVERAGES_RAW

{% macro load_pbj_daily_nurse_staffing() %}
COPY INTO {{ var('rawhist_db') }}.{{ var('wrk_schema') }}.PBJ_DAILY_NURSE_STAFFING_RAW
FROM (
    SELECT
        $1 AS PROVNUM,
        $2 AS PROVNAME,
        $3 AS CITY,
        $4 AS STATE,
        $5 AS COUNTY_NAME,
        $6 AS COUNTY_FIPS,
        $7 AS CY_Qtr,
        $8::DATE AS WorkDate,
        $9 AS MDScensus,
        $10 AS Hrs_RNDON,
        $11 AS Hrs_RNDON_emp,
        $12 AS Hrs_RNDON_ctr,
        $13 AS Hrs_RNadmin,
        $14 AS Hrs_RNadmin_emp,
        $15 AS Hrs_RNadmin_ctr,
        $16 AS Hrs_RN,
        $17 AS Hrs_RN_emp,
        $18 AS Hrs_RN_ctr,
        $19 AS Hrs_LPNadmin,
        $20 AS Hrs_LPNadmin_emp,
        $21 AS Hrs_LPNadmin_ctr,
        $22 AS Hrs_LPN,
        $23 AS Hrs_LPN_emp,
        $24 AS Hrs_LPN_ctr,
        $25 AS Hrs_CNA,
        $26 AS Hrs_CNA_emp,
        $27 AS Hrs_CNA_ctr,
        $28 AS Hrs_NAtrn,
        $29 AS Hrs_NAtrn_emp,
        $30 AS Hrs_NAtrn_ctr,
        $31 AS Hrs_MedAide,
        $32 AS Hrs_MedAide_emp,
        $33 AS Hrs_MedAide_ctr

    FROM @{{ var('stage_name') }}/PBJ_Daily_Nurse_Staffing_Q2_2024.csv
)
FILE_FORMAT = (FORMAT_NAME = '{{ var("file_format_csv") }}')
PATTERN = '.*PBJ_Daily_Nurse_Staffing_Q2_2024.csv'
ON_ERROR = 'CONTINUE'
PURGE = {{ var('purge_status') }};
{% endmacro %}

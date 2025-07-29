{{ config(materialized='table') }}

SELECT
    PROVNUM,
    PROVNAME,
    CITY,
    STATE,
    COUNTY_NAME,
    COUNTY_FIPS,
    CY_Qtr,
    CAST(WorkDate AS DATE) AS WorkDate,
    TRY_CAST(MDScensus AS FLOAT) AS MDScensus,

    -- RN DON (Director of Nursing)
    TRY_CAST(Hrs_RNDON AS FLOAT) AS Hrs_RNDON,
    TRY_CAST(Hrs_RNDON_emp AS FLOAT) AS Hrs_RNDON_emp,
    TRY_CAST(Hrs_RNDON_ctr AS FLOAT) AS Hrs_RNDON_ctr,

    -- RN Admin
    TRY_CAST(Hrs_RNadmin AS FLOAT) AS Hrs_RNadmin,
    TRY_CAST(Hrs_RNadmin_emp AS FLOAT) AS Hrs_RNadmin_emp,
    TRY_CAST(Hrs_RNadmin_ctr AS FLOAT) AS Hrs_RNadmin_ctr,

    -- RN Direct
    TRY_CAST(Hrs_RN AS FLOAT) AS Hrs_RN,
    TRY_CAST(Hrs_RN_emp AS FLOAT) AS Hrs_RN_emp,
    TRY_CAST(Hrs_RN_ctr AS FLOAT) AS Hrs_RN_ctr,

    -- LPN Admin
    TRY_CAST(Hrs_LPNadmin AS FLOAT) AS Hrs_LPNadmin,
    TRY_CAST(Hrs_LPNadmin_emp AS FLOAT) AS Hrs_LPNadmin_emp,
    TRY_CAST(Hrs_LPNadmin_ctr AS FLOAT) AS Hrs_LPNadmin_ctr,

    -- LPN Direct
    TRY_CAST(Hrs_LPN AS FLOAT) AS Hrs_LPN,
    TRY_CAST(Hrs_LPN_emp AS FLOAT) AS Hrs_LPN_emp,
    TRY_CAST(Hrs_LPN_ctr AS FLOAT) AS Hrs_LPN_ctr,

    -- CNA
    TRY_CAST(Hrs_CNA AS FLOAT) AS Hrs_CNA,
    TRY_CAST(Hrs_CNA_emp AS FLOAT) AS Hrs_CNA_emp,
    TRY_CAST(Hrs_CNA_ctr AS FLOAT) AS Hrs_CNA_ctr,

    -- Nurse Aide in Training
    TRY_CAST(Hrs_NAtrn AS FLOAT) AS Hrs_NAtrn,
    TRY_CAST(Hrs_NAtrn_emp AS FLOAT) AS Hrs_NAtrn_emp,
    TRY_CAST(Hrs_NAtrn_ctr AS FLOAT) AS Hrs_NAtrn_ctr,

    -- Med Aide
    TRY_CAST(Hrs_MedAide AS FLOAT) AS Hrs_MedAide,
    TRY_CAST(Hrs_MedAide_emp AS FLOAT) AS Hrs_MedAide_emp,
    TRY_CAST(Hrs_MedAide_ctr AS FLOAT) AS Hrs_MedAide_ctr

FROM HEALTHSTAFFDB.BRONZE.PBJ_DAILY_NURSE_STAFFING_RAW

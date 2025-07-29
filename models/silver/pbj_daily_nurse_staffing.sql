{{ config(materialized = 'table', schema = 'SILVER') }}

SELECT
  PROVNUM::VARCHAR                               AS provider_id,
  STATE::VARCHAR                                 AS state,
  WorkDate                                       AS staffing_date,
  TRY_CAST(MDScensus   AS NUMBER(8,2))           AS avg_census,

  -- Standard hours
  TRY_CAST(Hrs_RNDON         AS NUMBER(10,2))    AS hrs_rndon,
  TRY_CAST(Hrs_RNadmin       AS NUMBER(10,2))    AS hrs_rn_admin,
  TRY_CAST(Hrs_RN            AS NUMBER(10,2))    AS hrs_rn,
  TRY_CAST(Hrs_LPNadmin      AS NUMBER(10,2))    AS hrs_lpn_admin,
  TRY_CAST(Hrs_LPN           AS NUMBER(10,2))    AS hrs_lpn,
  TRY_CAST(Hrs_CNA           AS NUMBER(10,2))    AS hrs_cna,
  TRY_CAST(Hrs_NAtrn         AS NUMBER(10,2))    AS hrs_natrn,
  TRY_CAST(Hrs_MedAide       AS NUMBER(10,2))    AS hrs_medaide,

  -- Overtime / contract hours
  TRY_CAST(Hrs_RNDON_ctr     AS NUMBER(10,2))    AS hrs_rndon_ctr,
  TRY_CAST(Hrs_RNadmin_ctr   AS NUMBER(10,2))    AS hrs_rn_admin_ctr,
  TRY_CAST(Hrs_RN_ctr        AS NUMBER(10,2))    AS hrs_rn_ctr,
  TRY_CAST(Hrs_LPNadmin_ctr  AS NUMBER(10,2))    AS hrs_lpn_admin_ctr,
  TRY_CAST(Hrs_LPN_ctr       AS NUMBER(10,2))    AS hrs_lpn_ctr,
  TRY_CAST(Hrs_CNA_ctr       AS NUMBER(10,2))    AS hrs_cna_ctr,
  TRY_CAST(Hrs_NAtrn_ctr     AS NUMBER(10,2))    AS hrs_natrn_ctr,
  TRY_CAST(Hrs_MedAide_ctr   AS NUMBER(10,2))    AS hrs_medaide_ctr,

  CY_Qtr::VARCHAR                                AS quarter

FROM HEALTHSTAFFDB.BRONZE.PBJ_DAILY_NURSE_STAFFING_RAW
WHERE PROVNUM IS NOT NULL

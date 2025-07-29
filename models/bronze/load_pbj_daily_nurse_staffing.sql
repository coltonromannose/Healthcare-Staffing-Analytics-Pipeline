{{ config(
    materialized = 'view',
    schema = 'BRONZE',
    alias = 'LOAD_PBJ_DAILY_NURSE_STAFFING',
    pre_hook = load_pbj_daily_nurse_staffing()
) }}

SELECT 1 AS dummy_col

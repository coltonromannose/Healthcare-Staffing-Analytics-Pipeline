{{ config(
    materialized = 'view',
    schema = 'bronze',
    alias = 'DUMMY_LOAD_QUALITY_CLAIMS',
    pre_hook = "{{ load_quality_claims_raw() }}"
) }}

SELECT 1 AS dummy_col

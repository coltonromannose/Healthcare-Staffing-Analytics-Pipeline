{{ config(
    materialized = 'view',
    schema = 'bronze',
    alias = 'DUMMY_LOAD_QUALITY_MDS',
    pre_hook = "{{ load_quality_mds_raw() }}"
) }}

SELECT 1 AS dummy_col

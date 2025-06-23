{{ config(
    materialized = 'view',
    schema = 'bronze',
    alias = 'DUMMY_LOAD_PENALTIES',
    pre_hook = "{{ load_penalties_raw() }}"
) }}

SELECT 1 AS dummy_col

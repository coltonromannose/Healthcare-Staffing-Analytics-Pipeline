{{ config(
    materialized = 'view',
    schema = 'bronze',
    alias = 'DUMMY_LOAD_PROVIDER_INFO',
    pre_hook = "{{ load_provider_info_raw() }}"
) }}

SELECT 1 AS dummy_col

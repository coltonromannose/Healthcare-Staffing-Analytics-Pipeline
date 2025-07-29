{{ config(
    materialized = 'view',
    schema = 'BRONZE',
    alias = 'LOAD_PROVIDER_INFO',
    pre_hook = load_provider_info()
) }}

SELECT 1 AS dummy_col

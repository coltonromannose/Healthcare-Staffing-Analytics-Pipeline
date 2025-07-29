{{ config(
    materialized = 'view',
    schema = 'BRONZE',
    alias = 'LOAD_STATE_AVERAGES',
    pre_hook = load_state_averages()
) }}

SELECT 1 AS dummy_col

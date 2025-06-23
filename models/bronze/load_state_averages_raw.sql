{{ config(
    materialized = 'view',
    schema = 'bronze',
    alias = 'DUMMY_LOAD_STATE_AVERAGES',
    pre_hook = "{{ load_state_averages_raw() }}"
) }}

SELECT 1 AS dummy_col

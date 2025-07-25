
{{ config(
    materialized = 'table',
    pre_hook = "{{ create_provider_info_raw('bronze.provider_info_raw') }}",
    post_hook = "COPY INTO bronze.provider_info_raw FROM @healthcare_raw_stage/NH_ProviderInfo_Oct2024.csv FILE_FORMAT = (FORMAT_NAME = 'healthcare_csv_format')"
) }}

-- dummy select to keep dbt happy
SELECT 1 AS placeholder;

-- including incremental logic to only load new data
{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='hashkey'
    )
}}

select * from {{ source('btc', 'btc') }}

{% if is_incremental() %}

    where block_timestamp > (select max(block_timestamp) from {{ this }})

{% endif %}
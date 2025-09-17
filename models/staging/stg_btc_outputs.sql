-- including incremental logic to only load new data
{{
    config(
        materialized='incremental',
        incremental_strategy='append',
        unique_key='hashkey'
    )
}}

with flattened as (
select
    t.hashkey,
    t.block_number,
    t.block_timestamp,
    t.is_coinbase,
    op.value:value::FLOAT as output_value,
    op.value:address::STRING as output_address 

from {{ ref("stg_btc") }} as t,
lateral flatten(input => t.outputs) as op
where op.value is not null


{% if is_incremental() %}
    and t.block_timestamp > (select max(block_timestamp) from {{ this }})

{% endif %}
)

select hashkey,
    block_number,
    block_timestamp,
    is_coinbase,
    output_value,
    output_address
from flattened 
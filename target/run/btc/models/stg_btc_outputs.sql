
  
    

create or replace transient table btc.btc_schema.stg_btc_outputs
    
    
    
    as (-- including incremental logic to only load new data


with flattened as (
select
    t.hashkey,
    t.block_number,
    t.block_timestamp,
    t.is_coinbase,
    op.value:value::FLOAT as output_value,
    op.value:address::STRING as output_address 

from btc.btc_schema.stg_btc as t,
lateral flatten(input => t.outputs) as op
where op.value is not null



)

select hashkey,
    block_number,
    block_timestamp,
    is_coinbase,
    output_value,
    output_address
from flattened
    )
;


  
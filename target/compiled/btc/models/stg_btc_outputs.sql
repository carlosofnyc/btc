select
    t.hashkey,
    t.block_number,
    t.block_timestamp,
    t.is_coinbase,
    op.value:value::FLOAT as output_value,
    op.value:address::STRING as out_address 

from btc.btc_schema.stg_btc as t,
lateral flatten(input => t.outputs) as op
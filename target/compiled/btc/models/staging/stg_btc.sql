-- including incremental logic to only load new data


select * from btc.btc_schema.btc



    where block_timestamp > (select max(block_timestamp) from btc.btc_prod.stg_btc)


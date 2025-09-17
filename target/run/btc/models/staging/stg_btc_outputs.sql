begin;
    insert into btc.btc_schema.stg_btc_outputs ("HASHKEY", "BLOCK_NUMBER", "BLOCK_TIMESTAMP", "IS_COINBASE", "OUTPUT_VALUE", "OUTPUT_ADDRESS")
    (
        select "HASHKEY", "BLOCK_NUMBER", "BLOCK_TIMESTAMP", "IS_COINBASE", "OUTPUT_VALUE", "OUTPUT_ADDRESS"
        from btc.btc_schema.stg_btc_outputs__dbt_tmp
    )

;
    commit;
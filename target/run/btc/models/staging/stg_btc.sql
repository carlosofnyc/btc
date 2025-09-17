-- back compat for old kwarg name
  
  begin;
    
        
            
	    
	    
            
        
    

    

    merge into btc.btc_schema.stg_btc as DBT_INTERNAL_DEST
        using btc.btc_schema.stg_btc__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.hashkey = DBT_INTERNAL_DEST.hashkey))

    
    when matched then update set
        "HASHKEY" = DBT_INTERNAL_SOURCE."HASHKEY","BLOCK_HASH" = DBT_INTERNAL_SOURCE."BLOCK_HASH","BLOCK_NUMBER" = DBT_INTERNAL_SOURCE."BLOCK_NUMBER","BLOCK_TIMESTAMP" = DBT_INTERNAL_SOURCE."BLOCK_TIMESTAMP","FEE" = DBT_INTERNAL_SOURCE."FEE","INPUT_VALUE" = DBT_INTERNAL_SOURCE."INPUT_VALUE","OUTPUT_BTC" = DBT_INTERNAL_SOURCE."OUTPUT_BTC","FEE_PER_BYTE" = DBT_INTERNAL_SOURCE."FEE_PER_BYTE","IS_COINBASE" = DBT_INTERNAL_SOURCE."IS_COINBASE","OUTPUTS" = DBT_INTERNAL_SOURCE."OUTPUTS"
    

    when not matched then insert
        ("HASHKEY", "BLOCK_HASH", "BLOCK_NUMBER", "BLOCK_TIMESTAMP", "FEE", "INPUT_VALUE", "OUTPUT_BTC", "FEE_PER_BYTE", "IS_COINBASE", "OUTPUTS")
    values
        ("HASHKEY", "BLOCK_HASH", "BLOCK_NUMBER", "BLOCK_TIMESTAMP", "FEE", "INPUT_VALUE", "OUTPUT_BTC", "FEE_PER_BYTE", "IS_COINBASE", "OUTPUTS")

;
    commit;
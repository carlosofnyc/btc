
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select HASHKEY
from btc.btc_schema.stg_btc
where HASHKEY is null



  
  
      
    ) dbt_internal_test
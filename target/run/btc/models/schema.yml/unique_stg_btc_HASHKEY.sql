
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    HASHKEY as unique_field,
    count(*) as n_records

from btc.btc_schema.stg_btc
where HASHKEY is not null
group by HASHKEY
having count(*) > 1



  
  
      
    ) dbt_internal_test
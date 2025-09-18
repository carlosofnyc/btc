
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

    select *
    from btc.btc_schema.whale_alerts
    where NOT (
        OUTPUT_ADDRESS LIKE '1%'
        OR OUTPUT_ADDRESS LIKE '3%'
        OR OUTPUT_ADDRESS LIKE 'bc1%'
    )


  
  
      
    ) dbt_internal_test
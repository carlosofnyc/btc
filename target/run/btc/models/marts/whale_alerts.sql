
  
    

create or replace transient table btc.btc_schema.whale_alerts
    
  (
    OUTPUT_ADDRESS TEXT,
    TOTAL_SENT float,
    TRANSACTION_COUNT integer,
    USD_VALUE DOUBLE
    
    )

    
    
    
    as (
    select OUTPUT_ADDRESS, TOTAL_SENT, TRANSACTION_COUNT, USD_VALUE
    from (
        with  __dbt__cte__stg_btc_transactions as (


select * 
from btc.btc_schema.stg_btc_outputs 
where is_coinbase = false
), whales as (
    select
    output_address,
    sum(output_value) as total_sent,
    count(*) as transaction_count

from __dbt__cte__stg_btc_transactions

where output_value > 10

group by output_address
order by total_sent desc

),
latest_price as (
    select price
    from btc.btc_schema.btc_usd_max
    where to_date(replace(snapped_at, ' UTC', '')) = current_date()
)

select wh.output_address,
wh.total_sent,
wh.transaction_count,


wh.total_sent * (
    select price
    from btc.btc_schema.btc_usd_max
    where to_date(replace(snapped_at, ' UTC', '')) >= current_date()
)

 as usd_value
from whales wh
cross join latest_price lp
order by wh.total_sent desc
    ) as model_subq
    )
;


  
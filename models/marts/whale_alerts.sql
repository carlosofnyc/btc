with whales as (
    select
    output_address,
    sum(output_value) as total_sent,
    count(*) as transaction_count

from {{ ref('stg_btc_transactions') }}

where output_value > 10

group by output_address
order by total_sent desc

),
latest_price as (
    select price
    from {{ref ('btc_usd_max')}}
    where to_date(replace(snapped_at, ' UTC', '')) = current_date()
)

select wh.output_address,
wh.total_sent,
wh.transaction_count,
{{convert_to_usc('wh.total_sent')}} as usd_value
from whales wh
cross join latest_price lp
order by wh.total_sent desc
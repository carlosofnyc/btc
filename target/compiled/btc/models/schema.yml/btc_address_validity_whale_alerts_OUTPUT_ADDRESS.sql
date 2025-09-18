

    select *
    from btc.btc_schema.whale_alerts
    where NOT (
        OUTPUT_ADDRESS LIKE '1%'
        OR OUTPUT_ADDRESS LIKE '3%'
        OR OUTPUT_ADDRESS LIKE 'bc1%'
    )


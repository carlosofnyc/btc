
  create or replace   view btc.btc_schema.stg_btc
  
  
  
  
  as (
    select top 1 *
from btc.btc_schema.btc
  );


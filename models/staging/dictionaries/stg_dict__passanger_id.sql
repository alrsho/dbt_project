{{
  config(
    materialized = 'table',
    )
}}
select
    passanger_id
from 
    {{ ref('passanger_id') }}
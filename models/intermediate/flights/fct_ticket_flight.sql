{{
  config(
        materialized = 'table',
        static_analysis='off'
    )
}}

select
  ticket_no,
  flight_id,
  fare_conditions,
  amount
from
    {{ ref('stg_flights__ticket_flights') }}
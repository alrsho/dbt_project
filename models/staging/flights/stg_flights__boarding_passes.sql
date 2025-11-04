{{
    config(
        materialized = 'table',
        static_analysis='off'
    )
}}
select
  ticket_no,
  flight_id,
  boarding_no,
  seat_no
from {{ source('demo_src', 'boarding_passes') }}

    
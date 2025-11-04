{{
    config(
        materialized = 'table',
        static_analysis='off'
    )
}}

select
    aircraft_code,
    model, 
    "range"
from
    {{ source('demo_src', 'aircrafts') }}
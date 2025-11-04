{{
    config(
        materialized = 'table',
        static_analysis='off'
    )
}}
select
  airport_code,
  airport_name,
  city,
  coordinates,
  timezone
from {{ source('demo_src', 'airports') }}

    
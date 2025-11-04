
{# IF #}

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
from {{ source('demo_src', 'ticket_flights') }}
{%- if target.name == 'dev' %}
limit 100000  
{%- endif %}






{# IF NOT #}


{% set important_aircrufts = ['CN1','CN2','CN3']%}

select distinct
    {% for aircraft in important_aircrufts%}
    SUM(CASE WHEN aircraft_code = '{{aircraft}}' THEN 1 ELSE 0 END) as flights_{{aircraft}} {% if not loop.last %} , {% endif %}
    {% endfor%}
from
{{ ref('fct_flight_shedule') }}
{{
  config(
        static_analysis='off'
    )
}}


{% set aircraft_query%}
SELECT distinct
    aircraft_code
from
    {{ ref('fct_flight_shedule')}}
{% endset%}

{% set aircraft_query_result = run_query(aircraft_query) %}

{% if execute %}
    {% set important_aircrufts = aircraft_query_result.columns[0].values()%}
{% else%}
    {% set important_aircrufts = []%}
{% endif %}

select distinct
    {% for aircraft in important_aircrufts%}
    SUM(CASE WHEN aircraft_code = '{{aircraft}}' THEN 1 ELSE 0 END) as flights_{{aircraft}} 
    {% if not loop.last -%} , {% endif %}
    {% endfor%}
from
{{ ref('fct_flight_shedule') }}
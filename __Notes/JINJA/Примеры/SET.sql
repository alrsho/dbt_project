{# СПИСОК В ПЕРЕМЕННУЮ #}

{% set important_aircrufts = ['CN1','CN2','CN3']%}

select distinct
    {% for aircraft in important_aircrufts%}
    SUM(CASE WHEN aircraft_code = '{{aircraft}}' THEN 1 ELSE 0 END) as flights_{{aircraft}} {% if not loop.last %} , {% endif %}
    {% endfor%}
from
{{ ref('fct_flight_shedule') }}



{# ДРУГОЙ ЗАПРОС В ПЕРЕМЕННУЮ #}

{% set aircraft_query%}
SELECT distinct
    aircraft_code
from
    {{ ref('fct_flight_shedule')}}
{% endset%}
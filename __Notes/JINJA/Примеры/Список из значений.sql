{# Получаем список значений колонки #}


{% if execute %}
    {% set important_aircrufts = aircraft_query_result.columns[0].values()%}
{% else%}
    {% set important_aircrufts = []%}
{% endif %}
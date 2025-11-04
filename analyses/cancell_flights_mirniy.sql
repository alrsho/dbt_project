select
*
from
    {{ ref('fct_flight_shedule') }}
where
departure_airport = 'MJZ'



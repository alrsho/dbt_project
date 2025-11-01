{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'merge',
        unique_key = ['book_ref'],    
        tags = ['bookings']        
    )                                               
}}                                              -- unique_key - kлюч Список, через запятую можно еще поля указать
select
book_ref,
book_date,
total_amount
from {{ source('demo_src', 'bookings') }}
{% if is_incremental() %}
  where 
    book_date > (select max(book_date) from {{ source('demo_src', 'bookings') }}) - interval '97 day'  --отсечка, для merge за какой период смотреть строки
{% endif %}
    
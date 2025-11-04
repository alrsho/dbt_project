{{
    config(
        materialized = 'incremental',
        static_analysis='off',
        incremental_strategy = 'append',
        tags = ['bookings']
    )
}}
select
book_ref,
book_date,
total_amount
from {{ source('demo_src', 'bookings') }}
{% if is_incremental() %}  -- При первом запуске вернет False и произоойдет обычная загрузка. При остальных запусках вернет True и выполнится условие
  where 
    ('0x'||book_ref)::bigint > (select max(('0x'||book_ref)::bigint) from {{ this}})  --{{this}} - способ сослаться на экземпляр этой таблицы в бд. 
{% endif %}



 -- ('0x'||book_ref)::bigint    - преобразуем из строки в число для корректного сравнения   
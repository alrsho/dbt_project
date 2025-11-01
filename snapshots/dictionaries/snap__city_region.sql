{% snapshot snap__city_region %}            -- обявляем начало снепшота

{{
   config(
       target_schema='snapshot',          
       unique_key='city',              

       strategy='timestamp',              
       updated_at='updated_at',             
   )
}}

-- Ну и сам запрос (лучше не добавлять сюда никакой логики)
-- Если нужна логика, лучше сделать промежуточную эфимерную таблицу

SELECT
    city,
    region,
    updated_at
FROM
    {{ ref('city_region') }}



{% endsnapshot %}                       -- объявляем завершение снепшота
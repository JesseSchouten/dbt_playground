{% test is_positive_integer(model, column_name) %}

with validation as (
    SELECT  {{ column_name }} as positive_integer_field

    FROM  {{ model }}
),

validation_errors as (
    SELECT
        positive_integer_field
    FROM validation
    WHERE positive_integer_field < 0
)

SELECT * FROM validation_errors
{% endtest %}

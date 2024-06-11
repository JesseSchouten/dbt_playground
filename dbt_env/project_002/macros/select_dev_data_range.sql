{%- macro select_dev_data_range(date_column_name, nr_days=3, is_first_where_statement=true) -%}
{%- if target.name == "dev" -%}
    {% if is_first_where_statement %}
        WHERE 
    {% else %}
        AND
    {% endif %}
    {{ date_column_name }} >= (CURRENT_DATE() - {{ nr_days }})
{%- endif -%}
{%- endmacro -%}
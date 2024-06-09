{%- macro apply_default_rounding(value) -%}
    ROUND({{value}}, 2)
{%- endmacro -%}
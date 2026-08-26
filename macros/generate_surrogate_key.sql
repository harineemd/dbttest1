{% macro generate_surrogate_key(field_list) %}
    md5(concat({% for field in field_list %}coalesce(cast({{ field }} as string), ''){% if not loop.last %} || '-' || {% endif %}{% endfor %}))
{% endmacro %}
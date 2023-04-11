# VC Revoke(폐기)

- VC의 발급에 따라 만료일 이전에 발급된 VC를 무효화 하기 위해서 발급자인 서비스 제공자는 콘솔이나 API를 이용하여 해당 VC를 폐기 할 수 있습니다.
- 폐기된 VC는 더이상 유효하지 않게 되어 검증 등에 사용할 수 없습니다.

{% swagger src=".gitbook/assets/sample_2.json" path="/v1/vcs/revoke/{id}" method="post" %}
[sample_2.json](.gitbook/assets/sample_2.json)
{% endswagger %}

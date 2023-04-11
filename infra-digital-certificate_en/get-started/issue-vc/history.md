# 발급 내역 조회

- 발급된 VC에 대한 내역은 아래 API로 조회할 수 있습니다.
- 제출된 DID에 따라 다른 내역을 보여줍니다.
   - Holder의 DID라면 자신이 발급받은 VC의 내역과 상세 입니다.
   - Issuer의 DID라면 자신이 발급한 VC의 내역과 상세 입니다.

{% swagger src="../.gitbook/assets/sample_2.json" path="/v1/vcs" method="get" %} [sample_2.json](../.gitbook/assets/sample_2.json) {% endswagger %}

{% swagger src="../.gitbook/assets/sample_2.json" path="/v1/vcs/{id}" method="get" %} [sample_2.json](../.gitbook/assets/sample_2.json) {% endswagger %}

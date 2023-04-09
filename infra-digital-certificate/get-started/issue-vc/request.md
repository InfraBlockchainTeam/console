# VC 발급 요청

- 서비스 사용자가 서비스 제공 앱을 통해 서비스 제공자에게 VC 발급을 요청합니다.
  {발급 요청 시퀀스}
- 먼저 서비스 제공앱에는 발급 요청을 할 VC의 템플릿을 조회하고 이를 발급요청을 하는 API 통신 로직이 구현되어야 합니다.

{% swagger src="../.gitbook/assets/sample_2.json" path="/v1/vcs/requests" method="post" %}
[sample_2.json](../.gitbook/assets/sample_2.json)
{% endswagger %}

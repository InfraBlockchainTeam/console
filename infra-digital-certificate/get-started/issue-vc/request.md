# VC 발급 요청

## 사전 준비 사항

- VC 발급을 진행 하기 전 발급하려는 VC 템플릿이 등록되어 있어야 합니다.
- 먼저 서비스 제공앱에는 발급 요청을 할 VC의 템플릿을 조회하고 이를 발급요청을 하는 API 통신 로직이 구현되어야 합니다.
- 아직 사용제 제공 앱이 준비 되지 않았다면 우선 SDK{링크}를 통해 사용자의 DID를 발급 받고 아래 Rest API를 통해 테스트 해볼 수 있습니다.

1.  {% swagger src="../../.gitbook/assets/sample_2.json" path="/v1/settings/templates/vcs" method="get" %}
    [sample_2.json](../../.gitbook/assets/sample_2.json)
    {% endswagger %}

2.  {% swagger src="../../.gitbook/assets/sample_2.json" path="/v1/settings/templates/vcs/{id}" method="get" %}
    [sample_2.json](../../.gitbook/assets/sample_2.json)
    {% endswagger %}

3.  {% swagger src="../../.gitbook/assets/sample_2.json" path="/v1/vcs/requests" method="post" %}
    [sample_2.json](../../.gitbook/assets/sample_2.json)
    {% endswagger %}

## 발급 요청

- 서비스 사용자가 서비스 제공 앱을 통해 Cert서버와 통신함으로써 서비스 제공자에게 VC 발급을 요청합니다.
  {발급 요청 시퀀스}

- 요청된 내용은 콘솔 혹은 아래 API를 통해 조회 할 수 있습니다.
  {% swagger src="../../.gitbook/assets/sample_2.json" path="/v1/vcs/requests" method="get" %}
  [sample_2.json](../../.gitbook/assets/sample_2.json)
  {% endswagger %}

  {% swagger src="../../.gitbook/assets/sample_2.json" path="/v1/vcs/requests/{id}" method="get" %}
  [sample_2.json](../../.gitbook/assets/sample_2.json)
  {% endswagger %}

다음으로, VC 발급 요청을 서비스 서버에서 확인하고 발급해 보겠습니다.

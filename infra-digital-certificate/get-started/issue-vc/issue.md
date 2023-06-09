# VC 발급 처리

## 사전 준비 사항

- 사용자DID를 이용하여 Cert 서버에 VC 발급 요청 API를 요청한 상태여야 합니다.

- IWS Cert 서비스에서 [VC 콜백](../setting/callbacks.md) 정보가 입력된 상태여야 합니다.

## 요청 내용 확인 / 발급

- 사용자로부터 Cert 서버에 전달된 VC 발급 요청은 Cert서버에서 관리하고 서비스 제공자는 이를 확인, 결정(발급 처리 혹은 거절)할 수 있습니다.

- 콘솔에서 매번 확인도 가능하지만 VC 콜백을 등록한 경우 Cert서버는 전달된 요청을 해당 콜백 URL로 전달하여 위 과정을 자동화 할 수 있습니다.

- 서비스 제공자는 자신의 서버에 아래 예시 **API**를 구현하여 처리하거나 **콘솔**이나 **조회 API**를 통해 VC 발급 요청을 한 사용자를 확인하고, 발급 결정을 합니다.

### 콜백 샘플

- Cert 서버는 아래와 같은 request data를 전달하며, 서버는 이를 확인 한 후 response data 에 맞도록 응답을 전달합니다.
  {% swagger src="../../.gitbook/assets/sample_2.json" path="/v1/vcs/requests/callback" method="post" %}
  [sample_2.json](../../.gitbook/assets/sample_2.json)
  {% endswagger %}

- 콜백에 의한 서비스 제공자의 발급 결정은 발급/거절/보류(pendding)이 있습니다.
  - 보류인 경우 자동 발급/거절이 되지 않고 이후 콘솔이나 API를 이용하여 서비스 제공자가 발급결정을 합니다.
  - 콜백이 정상적으로 요청/응답되지 않으면 Cert 서버는 Holder에게 보류 응답을 전달합니다.

### 콘솔에서 조회 / 결정

{화면 설명}

### API를 이용한 조회 / 결정

- 요청 받은 전체 내역
  {% swagger src="../../.gitbook/assets/sample_2.json" path="/v1/vcs/requests" method="get" %}
  [sample_2.json](../../.gitbook/assets/sample_2.json)
  {% endswagger %}

- 요청 식별자를 통한 상세 조회
  {% swagger src="../../.gitbook/assets/sample_2.json" path="/v1/vcs/requests/{id}" method="get" %}
  [sample_2.json](../../.gitbook/assets/sample_2.json)
  {% endswagger %}

- Cert 서버에 VC 발급 결정 전달
  {% swagger src="../../.gitbook/assets/sample_2.json" path="/v1/vcs/requests/{id}" method="post" %}
  [sample_2.json](../../.gitbook/assets/sample_2.json)
  {% endswagger %}

### 주의점

- Cert 서버는 DID 식별자 외에 Holder에 대한 어떤 정보도 가지고 있지 않습니다. 요청자의 확인과 발급에 필요한 정보 제공은 발급자(Issuer)인 서비스 제공자의 책임입니다.
  - Holder가 제출한 meta 데이터는 서비스에 전달될 뿐 VC 발급에 이용되지 않습니다.
- 콜백 혹은 조회 후 발급 결정 전달 전 이에 대한 프로세스를 구현하시기 바랍니다.

### 발급 결정 이후

- 콜백/콘솔/API를 통해 Cert 서버에게 발급 결정이 이루어지면 Cert 서버는 전달받은 Claim Data를 기반으로 VC를 생성합니다.
- 콜백에 의한 경우 Holder에게 앱에 저장할 수 있도록 VC 데이터를 전달합니다. Holder앱은 이를 저장하여 활용할 수 있습니다.
- 콘솔/API에 의한 경우 Holder 앱에서 발급 내역을 조회하여 1회에 한해 VC데이터를 전달 받을 수 있습니다.
  - 이를 위해 서비스 서버에서 사용자에게 푸쉬 등 알람을 전달하는 프로세스를 구축할 수 있습니다.
- VC 발급 내역은 아래의 API를 통해 목록과 상세 내용을 확인 할 수 있습니다.
  - {not Fixed} VC 전체 데이터는 기본적으로 1회만 전달 받을 수 있습니다. 다시 제공하거나 반복 제공하기 위해서 설정을 변경 할 수 있습니다???

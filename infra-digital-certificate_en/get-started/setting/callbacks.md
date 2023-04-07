# Callback URL 설정

- VC 발급 요청과 VP 검증 결과를 수신할 서비스 서버의 URL을 등록합니다.

## VC Request Callback

- 서비스 사용자(Holder)가 서비스 앱에서 SDK를 통해 VC 발급 요청을 하면 Cert Server는 VC 발급 요청에 대하여 서비스 서버에 사용자 확인 및 발급 여부를 확인합니다.
- 이를 위해 Cert Server가 전달할 콜백 URL을 설정합니다.
- {콘솔 설정화면 + 설정 방법 안내}

## VP Response Callback

- 서비스 검증자가 서비스 사용자에게 VP 제출을 요청하는경우, 경우에 따라 사용자는 이후 제출(Submit-Later)할 수 있습니다.
- 이 경우 서비스 사용자가 Cert Server에게 VP를 제출 하는 경우 VP와 검증 결과를 서비스 서버에 전달합니다.
- 이를 위해 Cert Server가 전달할 콜백 URL을 설정합니다.
- {콘솔 설정화면 + 설정 방법 안내}

다음으로 서비스 사용자에게 발급할 VC와 제출을 요구할 VP의 양식(Template)를 설정합니다.

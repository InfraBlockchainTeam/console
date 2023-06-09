# VP 제출

사용자가 요청받은 내용을 확인하여 해당 템플릿에 맞는 VC로 VP를 구성하여 제출합니다.

혹은, 해당 요청에 대해 제출 거부(Reject)할 수 있습니다.

## WS 연결

사용자는 `Submit-VC Message`를 전달하여 제출/거절하며, 검증자 측에서는 메시지 수신에 대한 응답으로 `Submit-VC-Res Message`를 전달합니다.

사용자가 제출할 VC를 아직 보유하지 않아 발급받은 후 제출하거나 제출에 대한 별도의 추가 작업이 필요한 경우 `Submit-VC-Later Message`를 전달하고 검증자는 제출을 위한 REST API를 포함한 `Submit-VC-Later-Res Message` 전달합니다.

{각 메시지에 대한 링크 추후 작성(ICP 작성 후 )}

## REST API

검증자로부터 생성된 VP 제출 요청에 대해 서비스의 선택에 따라 QR이나 기타 방법으로 사용자에게 전달합니다.
사용자는 전달된 요청에 대하여 검증자를 확인하는 로직을 수행하고, 사용자는 제출/거절을 선택하여 REST API Call을 수행합니다.

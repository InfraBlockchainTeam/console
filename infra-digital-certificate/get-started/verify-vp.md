# VP 검증

- VP 검증은 아래와 같은 [절차](../introduction/verify-flow.md)로 진행됩니다.
  1. 검증자(Verifier)와 서비스 사용자(Holder)의 연결(DID Connection) 및 VP 제출 요청
  2. 서비스 사용자가 VP를 제출
  3. 검증자가 VP를 검증 및 이력 저장
- 기본적으로 검증자와 사용자의 연결과 VP 제출 요청과 VP제출은 SDK를 이용한 Websocket 채널을 이용하여 이루어집니다.
- 또한 VP 검증이력에 대해서는 Cert 서버에 저장하여 상세 이력을 조회할 수 있습니다.

먼저 검증자와 서비스 사용자의 DID 연결을 살펴봅니다.

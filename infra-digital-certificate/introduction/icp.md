# InfraDID Communication Protocol (ICP)

- InfraDID Communication Protocol(ICP)는 infrablockchain에서 Holder-Verifier DID 간 비동기 양방향 비밀 통신 채널 생성 및 상호 DID 인증 위한 프로토콜 입니다.

- Diffie-Hellman 알고리즘을 통한 키 교환 과정을 포함하며, DID Connection이 이루어진 이후 DID간 메세지들은 공유된 비밀키(DID-Shared-Secret-Key)를 사용하여 상호 암호화 통신을 하도록 합니다.

- Holder, Verifier 간 통신채널을 제공하는 Websocket Channel (Message Forwarder)은 어떤 DID가 통신 중인지 DID간 어떤 메세지를 전송하는지 원천적으로 알수 없습니다.

- DID Connection 단계를 완료한 이후, 비밀 통신 웹소켓 채널을 통해 이후의 로직들을 수행하도록 합니다.

- DID Connection은 쌍방 중 누구나 먼저 시작할 수 있습니다.

  - Holder가 웹소켓 채널을 생성하는 경우
    - Holder의 디바이스에서 Dynamic Connection Information(QR 등)을 생성하고 Verifier 디바이스에서 이를 스캔하여 채널 연결
    - Verifier가 생성한 Static Connection Information(QR 등)을 Holder 디바이스가 받아 Verifier Cloud Agent의 initiateDIDConnection REST API를 호출하여 DID 채널 연결
  - Verifier가 웹소켓 채널을 생성하는 경우
    - Verifier 측에서 생성한 Dynamic Connection Information(QR 등)을 Holder 디바이스에서 받아 채널 연결

- 자세한 정보는 [링크필요](#infradid-communication-protocol-icp) 에서 확인할 수 있습니다.

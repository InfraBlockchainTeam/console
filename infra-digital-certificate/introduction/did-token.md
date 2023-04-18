# DID Token (In progress)

Cert 서버와 통신하기 위해서 요청자는 자신의 DID로 JSON Web Token(JWT)을 생성하여 전달합니다.

- _(TBD) 모든 통신을 DID 토큰으로 할지(Access) / DID token으로 access token 발행해서(Auth) 처리할지 결정해야 함._

### Header

Header에는 토큰의 타입과 토큰에 사용된 서명 알고리즘을 기술합니다.

- `alg`: 서명 알고리즘입니다. DID Token은 `"EdDSA"`를 사용합니다.
- `typ`: 토큰의 타입입니다. DID Token은 `"JWT"`를 사용합니다.

아래는 header의 예시입니다.

```json
"header": {
    "alg": "EdDSA",
    "typ": "JWT"
},
```

### Payload

Payload에는 인증에 필요한 정보를 포함합니다.

- `iss`: 요청자의 infra DID입니다.
- `iat`: JWT의 생성 일시의 (timestamp)
- `exp`: JWT의 만료 일시입니다.(timestamp)
- `aud`: JWT의 수신자로 Cert 서버에 제출하기 위해 `IWS.Cert`로 사용합니다.

아래는 payload의 예시입니다.

```json
"payload": {
    "iss": "did:infra:space:5GpakL6PJPufLhEN2ugquUoW39Uc8FTuDFVT9Jv96L5v6Pjy",
    "iat": 1673231288,
    "exp": 1673234888,
    "aud": ["IWS.Cert"]
},
```

### Signature

Infra DID Token의 Signature 슈도코드(pseudocode)의 구조는 다음과 같습니다.

```
EdDSA(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  privateKey)
```

위 payload 예시를 이용해 서명하여 생성한 DID Token의 예시입니다.

```
eyJ0eXAiOiJKV1QiLCJhbGciOiJFZERTQSJ9.eyJpc3MiOiJkaWQ6aW5mcmE6c3BhY2U6NUdwYWtMNlBKUHVmTGhFTjJ1Z3F1VW9XMzlVYzhGVHVERlZUOUp2OTZMNXY2UGp5IiwiaWF0IjoxNjczMjMxMjg4LCJleHAiOjE2NzMyMzQ4ODgsImF1ZCI6WyJJV1MuQ2VydCJdfQ.lHm_fUuXOnDPQBclBNdWcp6tSknIH_YUvBMvxT7TZ0We3j5RIWFByO7o_x_P2TC1qcCaTtyTCaDGx4MKk7wqjg
```

### Generate JWT / Verify JWT

- 제공되는 InfraBlockchain SDK를 통해 EdDSA 알고리즘 JWT를 생성할 수 있습니다. (링크 추가 필요)

- Edwards-curve Digital Signature Algorithm(EdDSA) 알고리즘은 [RFC8037 3.1 항](https://www.rfc-editor.org/rfc/rfc8037.html#section-3.1)에 의해 지원 알고리즘에 추가되었지만 아직 많은 라이브러리에서 이를 지원하지 않고 있습니다.
  - 지원되는 현황은 [jwt.io 지원 라이브러리](https://jwt.io/libraries) 페이지에서 확인할 수 있습니다.
    - javascript의 알려진 패키지 중 `jose`는 지원하지만 `jsonwebtoken`(jwt.io)에서는 아직 지원하지 않습니다.

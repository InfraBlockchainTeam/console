# Decentralized Identity(DID)

- 본 문서는 DID에 대한 간단한 소개를 담고 있습니다. 자세한 정보는 [W3C](https://www.w3.org/TR/did-core/)을 참고하시기 바랍니다.

## 정의

- DID는 '리소스'를 식별하는 문자열인 '글로벌 고유 식별자'의 새로운 형태 입니다.

  - 리소스는 모든 웹 표준에서 W3C가 사용하는 용어이며 엔터티(entity)라는 용어를 사용하기도 합니다.

- DID는 기존의 신원 확인 방식과 달리 중앙 시스템에 의해 통제되지 않으며 개개인이 자신의 정보에 완전한 통제권을 갖도록 하는 기술입니다.

  - 기업, 정부가 개인의 데이터를 소유하게 되며 자신의 데이터임에도 불구하고 기업의 결정에 따라 접근이 가능한 기존의 중앙 시스템의 문제를 바로잡고자 W3C의 탈 중앙운동을 전개하며 등장하였습니다.

  - 개인이 자신의 데이터를 직접 관리하며 중앙화 된 기관을 거치지 않으면서도 이를 검증 할 수 있습니다.

## 형식

- DID는 schema, did method, did method-specific identifier 3부분을 구분자`:`로 연결한 간단한 문자열입니다.

  - `did:infra:dk37s3Dkjs6D8s...`

## DID 문서

- DID의 인증정보, 제어권과 소유권을 증명할 수 있는 공개키와 해당 DID를 어떻게 사용하는지에 대해 설명한 데이터 집합(문서)입니다.

- DID는 그 자체로도 고유한 식별자로서 유용할 수 있지만 DID 리졸버(resolver)를 통해 표준화된 DID 문서를 검색할 수 있습니다.

  - DID 문서는 탈 중앙화된 [DID-spec-registry](https://www.w3.org/TR/did-spec-registries/)에 저장됩니다.

- DID 리졸버를 통해 DID문서를 얻는 과정을 DID 레졸루션(resolution)이라고 합니다.

- 아래는 InfraDID에서 사용되는 DID 문서의 예시 입니다.

```json
{
  "@context": ["https://www.w3.org/ns/did/v1"],
  "id": "did:infra:space:5CJ5apAujzH875X4oU1RPUsx5RV3bYdNaJ7DFpq31YTmtyAG",
  "controller": ["did:infra:space5CJ5apAujzH875X4oU1RPUsx5RV3bYdNaJ7DFpq31YTmtyAG"],
  "verificationMethod": [
    {
      "id": "did:infra:space:5CJ5apAujzH875X4oU1RPUsx5RV3bYdNaJ7DFpq31YTmtyAG#keys-1",
      "type": "Sr25519VerificationKey2020",
      "controller": "did:infra:space:5CJ5apAujzH875X4oU1RPUsx5RV3bYdNaJ7DFpq31YTmtyAG",
      "publicKeyBase58": "gpUPqMqxzpJbUvtw3nX54hyXa5NRqqCsB482wkYhGPf"
    }
  ],
  "authentication": ["did:infra:space:5CJ5apAujzH875X4oU1RPUsx5RV3bYdNaJ7DFpq31YTmtyAG#keys-1"],
  "assertionMethod": ["did:infra:space:5CJ5apAujzH875X4oU1RPUsx5RV3bYdNaJ7DFpq31YTmtyAG#keys-1"],
  "keyAgreement": [],
  "capabilityInvocation": ["did:infra:space:5CJ5apAujzH875X4oU1RPUsx5RV3bYdNaJ7DFpq31YTmtyAG#keys-1"],
  "ATTESTS_IRI": null,
  "service": []
}
```

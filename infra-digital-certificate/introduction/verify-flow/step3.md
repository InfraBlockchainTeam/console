# Step 3. VP 검증 단계(After VP Submit Step)

- 제출된 VP를 검증자가 검증하거나 서버에 검증요청 하는 단계입니다.
- 추후 제출인 경우 사용자가 REST API를 통해 제출하는 단계입니다.
- 제출 되거나 거절된 검증 내역을 저장합니다.
- 제출된 내역에 대해 Cert 서비스 서버가 서비스 제공자의 서비스 서버에 웹훅(콜백)을 수행합니다.
- 설정에 따라 `Verifier Verify` 방식과 `Cert Server Verify` 방식이 있습니다.

```mermaid
sequenceDiagram

participant h as Holder
participant v as Verifier
participant cs as Cert server
participant ss as Service server

note over h,ss: come from Step 2
alt Submit/Reject (Verifier verify)
	opt submit
		v->>v: VP verify
	end
	opt Create VP verify history
	v->>+cs: [REST API] Create VP verify history
	cs->>cs: Vreate VP verify history
	cs--)-v: [REST API] Create VP verify history
	end
else Submit/Reject (Cert server verify)
	v->>+cs: [REST API] VP verify
	cs->>cs: VP verify
	cs->>cs: Create VP verify history
	cs--)-v: [REST API] VP verify
else Submit-Later or Use REST API
	h->>+cs: [REST API] VP submit later (submit / reject)
	opt Submit
		cs->>cs: VP verify
	end
	cs->>cs: Create VP verify history
	cs->>+ss: [REST API] VP submit response callback(VP, verifyResult)
	ss--)-cs: [REST API] VP submit response callback
	cs--)-h: [REST API] VP submit later
end
```

# Step 1. VP 제출 요청 단계(VP Submit Request Step)

- 사용자와 검증자(Verifier)가 서로 연결되는 단계입니다.
- 검증자가 암호화 채널 혹은 REST API를 통해 VP 제출을 요청하는 단계입니다.
- 가능한 연결 방법은 아래와 같습니다.
  1.  Holder Dynamic QR - Verifier connection(WebSocket)
  2.  Holder Dynamic QR - Cert server connection(WebSocket)
  3.  Holder - static QR(Cert Server)(WebSocket)
  4.  Verifier Dynamic QR - Holder connection(WebSocket)
  5.  Cert server Dynamic QR - Holder connection(WebSocket)
  6.  Holder - static QR(Cert Server)(REST API)
  7.  Depands on Server - Holder (REST API)

### WebSocket을 이용한 연결

```mermaid
sequenceDiagram

participant h as Holder
participant ws as WebSocket
participant v as Verifier app
participant cs as Cert server

alt (1,2) Holder(Dynamic QR) ->
	h->>ws: Create WS connection
	ws--)h: Connected<br>(socketId)
	h->>h: Create dynamic QR<br>(DID-Connect-Request Message)
	v-)v: Camera on
	v-->>h: Tag QR<br>(DID-Connect-Request Message)
	alt 1. -> Verifier
		v->>ws: Create WS connection
		ws--)v: Connected<br>(socketId)
	  note over h,v: Holder-Verifier WS connected. DID auth & DID connected
	else 2. -> CertServer
		v->>+cs: [REST API]DID connection relay<br>(DID-Connect-Request Message)
		cs->>ws: Create WS connection
		ws--)cs: Connected<br>(socketId)
	  note over h,cs: Holder-CertServer WS connected. DID auth & DID connected
		opt After WS disconnect & VP verify
			cs--)-v: [REST API]DID connection relay<br>(VP, VerifyResult)
		end
	end
else 3 Holder(scan) -> CertServer(static QR)
	alt Verifier create QR
		v-)v: Create static QR<br/>(DID, Service Endpoint, Action Context)
	else Certserver create QR
		v->>+cs: [REST API]Generate static QR<br>(DID, Action Context)
		cs-)cs: Create static QR<br/>(DID, Service Endpoint, Action Context)
		cs--)-v: [REST API]Generate static QR<br>(QR)
	end
	h-)h: Camera on
	v-->>h: Tag QR<br/>(DID, Service Endpoint, Action Context)
	h->>ws: Create WS connection
	ws--)h: Connected<br>(socketId)
	h->>h: Create DID-Connect-Request msg
	h->>+cs: [REST API]DID connection<br>(DID-Connect-Request Message)
	cs->>ws: Create WS connection
	ws--)cs: Connected<br>(socketId)
  note over h,cs: Holder-CertServer WS connected. DID auth & DID connected
		opt After WS disconnect & VP verify
		cs--)-h: [REST API]DID connection
	end
else (4,5) Verifier/CertServer(Dynamic QR) -> Holder(scan)
	alt 4. Verifier create dynamic QR)
	  v->>ws: Create WS connection
		ws--)v: Connected<br>(socketId)
		v-)v: Create dynamic QR<br>(DID-Connect-Request Message)
	else 5. CertServer(Dynamic QR) -> Holder(scan)
	  v->>+cs: [REST API]Generate dynamic QR<br>(did, context)
		cs->>ws: Create WS connection
		ws--)cs: Connected<br>(socketId)
		cs-)cs: Create dynamic QR<br>(DID-Connect-Request msg)
		cs--)-v: [REST API]Generate dynamic QR<br>(QR)
	end
  h-)h: Camera on
	h-->>v: Tag QR
	h->>ws: Create WS connection
	ws--)h: Connected<br>(socketId)
  note over h,cs: Verifier/CertServer-Holder WS connected. DID auth & DID connected
end
note over h,cs: Go to Step 2
```

### REST API를 이용한 연결

```mermaid
sequenceDiagram

participant h as Holder
participant v as Verifier / Service server
participant cs as Cert server


v->>+cs: [REST API] Inquery VP template(s)
cs--)-v: [REST API] VP template(s)
alt 6. by static QR
	v->>+cs: [REST API]Create VP submit request with QR<br>(template id, DID-Auth Message, challenge)
	cs-)cs: Create submit request
	cs-)cs: Create static QR<br/>(DID, Service Endpoint, Action Context)
	cs--)-v: [REST API]Create VP submit request with QR<br>(QR)
  h-)h: Camera on
	h-->>v: Tag QR
	note over h,cs: Holder known who,what,where about vp submit
else 7. Depends on service server
	v->>+cs: [REST API] Create VP submit request<br>(template id, DID-Auth Message, challenge)
	cs-)cs: Create submit request
	cs--)-v: [REST API] Create VP submit request
	v->>h: request VP submit(Depends on service)

	note over h,cs: Holder known who,what,where about vp submit
end
note over h,cs: Go to Step 2
```

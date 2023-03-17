# API reference

{% swagger method="post" path="/v1/ft/issue" baseUrl="https://infratoken.io" summary="FT 토큰 발행" expanded="false" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="secure token" type="test token" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="contract" type="String" required="true" %}
Token Contract
{% endswagger-parameter %}

{% swagger-parameter in="body" name="to" type="String" required="true" %}
The user who will receive the token (Account)
{% endswagger-parameter %}

{% swagger-parameter in="body" name="quantity" type="Number" required="true" %}
Quantity
{% endswagger-parameter %}

{% swagger-parameter in="body" name="memo" type="String" required="false" %}
Memo
{% endswagger-parameter %}

{% swagger-parameter in="body" name="signature" type="String" %}
Signature of this transaction (When the from value is pubkeyDID)
{% endswagger-parameter %}

{% swagger-parameter in="body" name="txFeePayer" type="String" %}
Set Transaction Fee Payer (Optional)
{% endswagger-parameter %}

{% swagger-parameter in="body" name="txVote" type="String" %}
Set Transaction Vote Account (Optional)
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```json
{
  transaction_id: '5507088ecfc0d06a07955080b81d892280acc29791f0a423971e47ced78d8241',
  processed: {
	  id: '5507088ecfc0d06a07955080b81d892280acc29791f0a423971e47ced78d8241',
    block_num: 131097,
    block_time: '2022-11-29T01:41:54.500',
    producer_block_id: null,
    receipt: { status: 'executed', cpu_usage_us: 254, net_usage_words: 16 },
    elapsed: 254,
    net_usage: 128,
    scheduled: false,
    action_traces: [ [Object], [Object] ],
    account_ram_delta: null,
    except: null,
    error_code: null
  }
}
```
{% endswagger-response %}
{% endswagger %}


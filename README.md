# console

## translate 작업 참고

[mdpo](https://mondeja.github.io/mdpo/latest/index.html) 사용.

1. md2po2md로 locale 폴더+po 생성
2. 각 po 파일 번역(파일 내 msgstr 항목에 번역문 추가)
3. 다시 업데이트해서 md로 반영
4. 각 대상 폴더로 이동

## 생성 및 업데이트

- 저장소 내 `make_en_mdpo.sh` 사용
  - -> 대상폴더\_en 폴더내 동일 구조로 po파일 생성 및 po로부터 md파일 추출.

```shell
    # 사용법
  make_en_mdpo.sh {생성대상폴더}
  # 예시(cert 문서)
  make_en_mdpo.sh infra-digital-certificate
```

# 작성 규칙

- gitbook description은 po 변환 오류로 미작성합니다.

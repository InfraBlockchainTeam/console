# console

## translate 작업 참고(작업 중)

[mdpo](https://mondeja.github.io/mdpo/latest/index.html) 사용.

1. md2po2md로 locale 폴더+po 생성
2. 각 po 파일 번역
3. 다시 업데이트해서 md로 반영
4. 각 대상 폴더로 이동

경로별 output 안되나....

```
# 전체 po추출. & 업데이트 예제(경로 체크)
md2po2md  './infra-digital-certificate/**/*.md' -l en -o "infra-digital-certificate/locale/{lang}"
```

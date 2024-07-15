# Architectures_NumbersAPI
NumberAPI를 활용한 iOS의 다양한 아키텍처 패턴 적용기

### 시나리오 

1. 사용자가 1부터 100 사이의 랜덤 숫자가 추출되는 버튼을 탭합니다.
2. 버튼이 탭되면, `http://numbersapi.com/42?json`로 GET 요청을 합니다.
3. 응답의 `text` 내용을 화면에 출력합니다.

### NumbersAPI Response Example

~~~JSON
{
    "text": "42 is the number of laws of cricket.",
    "number": 42,
    "found": true,
    "type": "trivia"
}
~~~

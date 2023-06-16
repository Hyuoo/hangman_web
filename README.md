# hangman_web

- requirements.txt
  - 의존성 환경 설치용 pip install requirements.txt
- app.py
  - 메인코드
- test.py
  - 테스트코드

```
docker inspect [IMAGE]
```


- - -
1. 서비스 띄우기
```
git clone https://github.com/Hyuoo/hangman_web.git
pip3 install -r requirements.txt
python3 -m flask run --host=0.0.0.0 --port=4000
```
- - -
2. 도커 이미지 빌드   
  위 명령어들을 Dockerfile에 기술
```
# Dockerfile
FROM python:3.8-slim-buster
LABEL Maintainer="hopeace6@naver.com"
# WORKDIR이 선행되면 이후 COPY할때도 위 디렉토리에서 실행됨.
WORKDIR /app
COPY app.py ./
COPY requirements.txt ./
RUN pip3 install -r requirements.txt
# 동작에는 관여 X 메타데이터 너낌 __내부에서 4000번 오픈했다~
EXPOSE 4000
CMD ["python3","-m","flask","run","--host=0.0.0.0",--port=4000"]
```
```
docker build --platform=linux/amd64 -t hopeace6/hangman .
```

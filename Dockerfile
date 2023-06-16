FROM python:3.8-slim-buster
LABEL Maintainer="hopeace6@naver.com"
# WORKDIR이 선행되면 이후 COPY할때도 위 디렉토리에서 실행됨.
WORKDIR /app
COPY app.py ./
COPY requirements.txt ./
RUN pip3 install -r requirements.txt
# 동작에는 관여 X 메타데이터 너낌 __내부에서 4000번 오픈했다~
EXPOSE 4000
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=4000"]

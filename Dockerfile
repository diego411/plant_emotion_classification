# syntax=docker/dockerfile:1
FROM python:3.10-slim-buster
WORKDIR /app
COPY requirements.txt requirements.txt
RUN apt update -y && apt install ffmpeg -y && apt install libpq-dev -y && apt install python3-dev -y
RUN pip3 install -r requirements.txt
COPY . .
CMD [ "python3", "-m" , "flask", "--app", "src/main", "run", "--host=0.0.0.0"]
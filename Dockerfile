FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./elevate /elevate
COPY ./secure /secure

RUN sudo apt install trivy

RUN adduser -D user
USER user
FROM python:3.8-alpine

ENV PYTHONUNBUFFERED 1

RUN  mkdir /app
WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
COPY ./elevate /app/elevate
COPY ./secure /app/secure
COPY ./.env /app/.env


# RUN pip install -r /requirements.txt

# RUN mkdir /app
# WORKDIR /app
# COPY ./elevate /elevate
# COPY ./secure /secure

# RUN sudo apt install trivy


# EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# RUN adduser -D user
# USER user
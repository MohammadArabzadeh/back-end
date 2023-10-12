# FROM python:3.8-alpine

# ENV PYTHONUNBUFFERED 1

# RUN  mkdir /app
# WORKDIR /app

# COPY ./requirements.txt /app/requirements.txt
# COPY ./elevate /app/elevate
# COPY ./secure /app/secure
# COPY ./.env /app/.env


# RUN apk update
# RUN apk add trivy

# # Use a lightweight image to run Trivy
# FROM alpine:latest

# # Install Trivy
# RUN apk --no-cache add curl
# RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -

# # Optional: Update Trivy databases
# RUN /root/.cache/trivy/trivy db update

# # Entrypoint to run Trivy
# ENTRYPOINT ["/root/.cache/trivy/trivy"]



# # RUN mkdir /app
# # WORKDIR /app
# # COPY ./elevate /elevate
# # COPY ./secure /secure

# # RUN sudo apt install trivy


# # EXPOSE 8000

# # CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# # RUN adduser -D user
# # USER user







# FROM python:3.8-alpine

# ENV PYTHONUNBUFFERED 1

# RUN mkdir /app
# WORKDIR /app

# COPY ./requirements.txt /app/requirements.txt
# COPY ./elevate /app/elevate
# COPY ./secure /app/secure

# RUN pip install -r requirements.txt

# # The above line should be corrected to "RUN pip install -r requirements.txt" instead of "python pip install -r /requirements.txt".

# # The following lines are commented out, so they don't impact the validity of the Dockerfile. You can uncomment and modify them as needed.

# # RUN sudo apk add trivy
# # EXPOSE 8000
# # CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# # RUN adduser -D user
# # USER user






FROM python:3.8-alpine

ENV PYTHONUNBUFFERED 1

RUN  mkdir /app
WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
COPY ./elevate /app/elevate
COPY ./secure /app/secure
COPY ./.env /app/.env
COPY ./README.md /app/README.md
COPY ./requirements.txt /app/requirements.txt
COPY ./manage.py /app/manage.py
COPY ./run.sh /app/run.sh



# RUN apk update
# RUN apk add trivy

RUN apk add --update --no-cache curl
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -x -s -- -b /usr/local/bin

# ENTRYPOINT ["/usr/local/bin/trivy"]
# CMD ["--help"]



EXPOSE 8000

# CMD ["source", "./.env/bin/activate"]

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# CMD ["/bin/sh", "-c", "source .env/bin/activate && python manage.py runserver 0.0.0.0:8000"]


# ENV PATH="/opt/venv/bin:$PATH"

# RUN /bin/sh -c "source .env/bin/activate"

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


RUN chmod +x run.sh








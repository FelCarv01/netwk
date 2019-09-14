FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1
WORKDIR /usr/src/app

COPY requirements.txt ./
RUN apk update && apk add libpq
RUN apk add --virtual .build-deps gcc python3-dev musl-dev postgresql-dev
RUN pip install --no-cache-dir -r requirements.txt
RUN apk del .build-deps
COPY ./netwk /usr/src/app

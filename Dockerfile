FROM python:3.12-slim-bullseye
WORKDIR /app

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# install system dependencies
RUN apt-get update

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /app/
RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "gunicorn", "civil_logger.wsgi:application", "-b", "0.0.0.0:8000"]
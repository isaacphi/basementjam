FROM python:3.9-alpine

COPY ./app /app

RUN pip install pipenv

ENV PROJECT_DIR /usr/local/src/app

WORKDIR ${PROJECT_DIR}

COPY Pipfile Pipfile.lock ${PROJECT_DIR}/

RUN pipenv install --system --deploy

EXPOSE 8000

COPY ./app ${PROJECT_DIR}/app

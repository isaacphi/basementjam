FROM python:3.9-alpine


RUN apk --no-cache add curl


ENV POETRY_VERSION=1.1.7 \
    PATH="/root/.poetry/bin:$PATH"


ENV PROJECT_DIR /usr/local/src/app
WORKDIR ${PROJECT_DIR}
COPY . ${PROJECT_DIR}


RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
RUN poetry self update
RUN poetry install


EXPOSE 8000


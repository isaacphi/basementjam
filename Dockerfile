FROM python:3.9-alpine

COPY ./app /app

RUN pip install fastapi hypercorn

EXPOSE 8000

COPY ./app /app

CMD ["hypercorn", "app.main:app", "--reload"]

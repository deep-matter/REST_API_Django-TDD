FROM python:3.9-alpine3.13

ENV PYTHONUDUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

COPY  ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app 
WORKDIR /app
EXPOSE 8000
# Set the value DEV to False and override in Docker-compose
ARG DEV=false

RUN python -m venv /learning && \
    source /learning/bin/activate && \ 
    pip install --upgrade pip && \
    pip list && \
    pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then pip install -r /tmp/requirements.dev.txt ; \
    fi && \ 
    rm -rf /tmp && \
    adduser \
       --disabled-password \
       --no-create-home \ 
       django-user 


ENV PATH="/learning/bin:$PATH"  

USER django-user





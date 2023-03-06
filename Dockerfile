FROM python:3.9-alpine3.13

ENV PYTHONUDUFFERED 1
ENV PYTHONDONTWRITEBYTECODE=1

COPY  ./requirements.txt /tmp/requirements.txt
COPY ./app /app 
WORKDIR /app
EXPOSE 8000

# RUN nslookup pypi.org

RUN python -m venv /learning && \
    nslookup pypi.org && \ 
    /learning/bin/pip install --upgrade pip && \
    /learning/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
       --disabled-password \
       --no-create-home \ 
       django-user 

# RUN echo pip --version

ENV PATH="/learning/bin:$PATH"  

USER django-user





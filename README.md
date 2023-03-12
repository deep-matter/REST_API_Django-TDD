# REST_API_Django-TDD
End-to-End test driven developmenet with Rest Framework Django

### Introduction 
in this following project i will track my process learing Backend Techno by using and implement,
the whole life-cycel web developmenet

### ApiDesign

     
* **the workflow:** 
    the project will focus only on backend REST_API builing and testing
    which means that we can send and recieve Data as JSON format from FrontEnd
- **Techno Used**:

    - Python (Programmming Language)
    - Django (Framework backend)
    - Rest Framework (build Top on Django)
    - Postgres (Database)
    - Swagger (Documentation APIs Schema)
- **TDD** (test Driven developmenet)

  as long as goes along with project we will do Unit Test of our APIs following
  process of TDD that will help us to produce more Quality work and maintenbel code 

- **Swagger:**

   this tool we will help to document our APIs workflow

- **Postman:**

   APIs testing is software allow us to test EndPoints interact with Database

- **Docker:**

  for more professional developmenet we will use Docker Compose to Dockerize our Services 
  to make CI/CD deployment easy setup and track

- **github action:**

  automation deployment Ci/CD we will implement Scrtip Yaml to deployment the service in AWS
### Setup the Envirement 

- **intialize Envirement in tradional way **

we will need to create our Own **ENV** which only contain desirble packages following

  - create ENV

      ```python 
         virtualenv -name reciep_app python==3.9 
      ```
  - active ENV 
     
      ```python
      source reciep_app/bin/actived
      ```

  - creat source app folder django **dev**

      ```python 
      django-admin startproject dev
     ```
- **addtional used software in this project**

    - Docker 
    - Postman 
    - Postgers Admin 

##### Docker Start Config-files [Check Branch SetupEnv](https://github.com/deep-matter/REST_API_Django-TDD/tree/Git-Action)

- Create the image using Docker 
    
  - Description : in this Branch we create our Own image that containe all the neccessry Package to hold our ENV to work in Django this is simple example how to create **Dockerfile** 

    ```yaml

      FROM python:3.9-apline13.3 

      ENV PYTHONNOTWRITEBITYCODE 1 

      COPY ./requirements.txt /tmp/requirements.txt

      COPY ./app /app

      WORKDIR /app

      RUN python -venv django-app && \
          source /django-app/bin/activate && \
          pip install --upgrade pip && \
          pip install -r /tmp/requirements
          pip install -r /tmp/requirements.txt && \
          ### here we will create an superuser will access to ENV wihout creditioanls       
          adduser \
          --diseble-password \
          --no-create-home \
          django-user \
      
      USER django-user
    ```

  - build and run commands : the command to run the docker and create the image 

    ```sh
      docker build --tag django_docker_image . 
    ```
    **to run the containre** 

    ```sh 
      docker run --name=container_django_app -p 8000:8000 django_docker_image
    ```
  - Docker-compose :
      - decription: we also used docker-compose to create Image and runnthe service as long as the app get complicated we will need to run multi-Services at once . in this stage **Docker-compose** is good tool use here simple docker-compose file configuration: 

      ```yaml

      version: "3.9"

      Services:
        app:
          container_name: container_django_app
          build:
            context: .
          ports:
            - "8000:8000"
          volumes:
            - ./app:/app
          command: >
            sh -c "python manage.py runserver 0.0.0.0:8000"
      ```
#### Git-Hub Action Automated Deployment [Check Branch Git-Action](https://github.com/deep-matter/REST_API_Django-TDD/tree/setupEnv)

- Github Action :
    - Defenition : somehow when the application has many features to work on and manage and test , the manule setup make the workfolw be pain in ass to deal with , here github action provide us Automated Piplien for CI-CD which stand fro **continuies integartion-Contiunes Delivery**

    - the Basic :
      * automated Testing 
      * automated Dockerize app 
      * automated checking Branch Pull request at **the Event**
      * automated Deploymenet

    - configuration YAML file:

        ```yaml 

            name: CI-CD pipline config Django App 
            
            on:
              push:
                branches: ["main"]
              pull_request:
                branches: ["main"]

            jobs:
              
              Django-env:
              runs-on: ubuntu-latest
                steps:
                  -
                    name: checkout repo code
                    uses: actions/checkout@v2
                  - 
                    name: build env dockerize image
                    run: docker-compose run --rm app sh -c "python manage.py test"
                  - 
                    name: check linting formate code
                    run: docker-compose run --rm sh -c "flake8"
        ```

    - Run the workflow github action using Git-CLI 

        ```sh 
          gh run RUN_ID:115478658 
        ```

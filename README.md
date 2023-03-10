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

- **intialize ENV**

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


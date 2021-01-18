# README

## Introduction

This small and simple application meant to be and small application to the following scenarios:

- Creating Teachers
- Creating Courses
- Creating Classrooms
- Teachers registration to impart class
- Asign Teachers to courses
- Votes either to Teachers or Classrooms

## Run Application
To make use of the application is need it to

- Install `mysql` database
- Run the command `bundle install` to install all the dependencies
- Run the server `rails s` the server should be in `http://127.0.0.1:3000`


## Documentation

Follow this link url `https://documenter.getpostman.com/view/14235314/TVzXBErv` download the postman collection and start hitting this service

## Code Improvements
- Make some classes to make the validation of the params
- Improve the error handling to avoid all the possible errors
- Removing the code from the controllers and move them to small services

## Feature Improvements
- Create users in the platfform
- Associate User to votes to take control and limit number of votes per user 
- Add filters to the the index endpoints
- Indexing information get faster results
- Index all the information related to Course, currenr teachers and votes to make ordering and filtering
- Add a validation step before publish any course
- Add `status` fields to the `Classroom` and `Registration` models in order to show the current status of the teacher aplication



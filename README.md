# README

Includes usage of custom exception handlers
  * UserCrudService, Line No- 13 shows example of raising custom exception
  * Add a BaseException class which extends StandardError
  * Add more specific classes which extends BaseException class, example - EmailMissingError
  * BaseException creates instance of child exception classes, assign error_messages to the instance variables
  * Exception is rescued in ApplicationController and serialized using CustomExceptionSerializer


Steps - 
  * Create project
    command - rails new rails_exception_handling --api

  * Create user model
    command - rails g model User first_name last_name age email

  * Create users controller
    command - rails g controller Users    

  * Create user table
    command - rake db:migrate

  * Add resource
    in routes.rb - resources :users

  * Add a class - ApplicationService in app/services folder, all service class can extend this class, this provides readable instantiation of service classes 

  * Add service class - UserCrudService which extends ApplicationService, delegate logic to this service class to keep controllers clean

  * Add create method in UsersController, call UserCrudService to create the user

  * Create new folder custom_exceptions under lib folder

  * Add custom exception classes under lib/custom_exceptions

  * Add BaseException class, stores the error_code, messages for different exceptions, creates instances of child exception classes, assign values to variables of child    
    exception classes

  * Enable auto loading from lib folder
    add in application.rb - config.autoload_paths << "#{Rails.root}/lib"

  * install gem active_model_serializers

  * Add rescue code in ApplicationController

  * Add CustomExceptionsSerializer to define attributes of exceptions which are serialized and rendered by ApplicationController



    

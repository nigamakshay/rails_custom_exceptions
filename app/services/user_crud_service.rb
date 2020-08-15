# Use a service class to keep less code in controllers

class UserCrudService < ApplicationService
  
  def initialize(params)
    @params = params
  end

  def call()
    
    begin             
      # Raise custom exception if email is not present
      raise CustomExceptions::EmailMissingError.new unless @params[:email]

      user = User.create(@params.permit(:first_name, :last_name, :age, :email))
    
      return {success: false, status_code: 500, message: "User creation failed."} unless user
      
      {success: true, status_code: 200, user: user, message: "User created."} 

    rescue ActiveRecord::RecordInvalid => e    
      {success: false, status_code: 500, message: "User creation failed - #{e.message}"}
    end

  end
end
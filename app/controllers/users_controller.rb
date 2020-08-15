class UsersController < ApplicationController

  def create
    result = UserCrudService.call(params) # delegate business logic and other execution to a service class   
    render json: result, status: result[:status_code]    
  end
    
end

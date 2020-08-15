class ApplicationController < ActionController::API

  # use method render_error_response to rescue CustomExceptions
  rescue_from CustomExceptions::BaseException, :with => :render_error_response  

  # EmailMissingError object is obtained as response 
  # Serialize it using CustomExceptionsSerializer
  def render_error_response(response)
    render json: response, serializer: CustomExceptionsSerializer, status: 400
  end    
end

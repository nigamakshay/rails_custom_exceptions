# Extend StandardError so that child instances can be raised and rescued
module CustomExceptions
  class BaseException < StandardError
    include ActiveModel::Serialization
    extend ActiveModel::Naming
    attr_reader :status, :code, :message

    # Proc to return code and message
    ERROR_MESSAGE_PROC = Proc.new {|error_code, message, status| {status: status, code: error_code, message: message}}

    # Define exception specific code and message
    ERRORS = {
      "EmailMissingError" =>
        ERROR_MESSAGE_PROC.call(400, 3000, "Email is mandatory"),

      "UserNotFound" =>
        ERROR_MESSAGE_PROC.call(400, 3001, "User not found")
    }

    # Creates the object and set values to instance variables, object is serialized and error-message is rendered by rescue in ApplicationController
    def initialize      
      error_type = self.class.name.scan(/CustomExceptions::(.*)/).flatten.first
      
      # Set instance variables
      CustomExceptions::BaseException::ERRORS
        .fetch(error_type, {}).each do |attr, value|          
          instance_variable_set("@#{attr}".to_sym, value)
      end
    end
  end
end
# Serializer for CustomExceptions

class CustomExceptionsSerializer < ActiveModel::Serializer
  attributes :status, :code, :message
end

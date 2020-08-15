module CustomExceptions
  class UserNotFoundError < UserCrudError
    extend ActiveModel::Naming    
  end
end  
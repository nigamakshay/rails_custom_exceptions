# Makes readable instance creation of UserCrudService by using - UserCrudService.call(params) 
# If this class is not used then UserCrudService call method has to be called like- UserCrudService.new(@params).call()

class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call # Creates instance of child class and execute call() method of it
  end
end
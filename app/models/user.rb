class User < ActiveRecord::Base

 # Validations mean a User object won't be saved to the database unless the attributes meet
 # the specified criteria.
   validates :username, :presence => true,
                        :uniqueness => true
   validates :email,    :presence => true,
                        :uniqueness => true,
                        :format => { :with => /w\+@\w+\.\w+/ }
   validates :password, :presence => true
end

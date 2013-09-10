class User < ActiveRecord::Base
  include BCrypt
 # Validations mean a User object won't be saved to the database unless the attributes meet
 # the specified criteria.
   validates :username, :presence => true,
                        :uniqueness => true
   validates :email,    :presence => true,
                        :uniqueness => true,
                        :format => { :with => /w\+@\w+\.\w+/ }
   validates :password, :presence => true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password ||= Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(params)
    user = User.find_by_email(params[:email])
    (user && user.password == params[:password]) ? user : nil
  end

  def self.create(params)
    user = User.new(
      username: params[:username],
      email: params[:email])
    user.password=(params[:password])
    user.save
    user
  end

end

helpers do

  #will return the relevant user object, otherwise returns 'nil'
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

end

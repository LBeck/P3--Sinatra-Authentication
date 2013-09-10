# Routes depend on the UX design. Decisions like whether login and sign up should be on
# the same of separate pages play a role here

get '/' do
  #Show all users if user is signed in
  if current_user
    show_all_users # see user_helpers.rb
  end
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  if current_user
    session[:user_id] = @user.id
    erb :index
  else
    erb :sign_in
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  sessions[:user_id].clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  user = User.create(params[:user]) # note that .create() is overwritten in user.rb
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.erros.full_messages
    erb :sign_in
end

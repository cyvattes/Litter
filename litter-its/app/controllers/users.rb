get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.create(first_name: params[:first_name], last_name: params[:last_name], user_name: params[:user_name], email: params[:email], password: params[:password])
  if @user.valid?
    session[:user_id] = @user.id
    session[:name] = @user.full_name
    redirect '/users'
  else
    redirect "/users/new?errors=#{@user.errors.full_messages.join(" and ")}"
  end
end


# put '/users/:id' do
#   #future development option
# end

# delete '/users/:id' do
#   #future development option
# end

post '/users/login' do
  #@user = User.create(first_name: params[:first_name], last_name: params[:last_name], user_name: params[:user_name], email: params[:email], password: params[:password])
  user = User.find_by(email: params[:user][:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    session[:name] = user.full_name
    redirect '/users'
  else
    erb :layout
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

get '/users/:id/edit' do
  erb :'/users/edit'
end

post '/users/logout' do
  session[:user_id] = nil
  session[:name] = nil
  redirect '/'
end

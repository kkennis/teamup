post '/login' do

    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      session[:user_first_name] = @user.first_name
      redirect "users/#{session[:user_id]}"
      redirect '/'
    else
      redirect '/login'
    end
  
end

get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do

  @user = User.new(first_name: params[:first_name],
                   last_name: params[:last_name],
                   username: params[:username],
                   email: params[:email],
                  )
  redirect 'users/new' if params[:password].empty?
  @user.password = params[:password]
  saved = @user.save
  redirect 'users/new' unless saved


  session[:user_id] = @user.id
  session[:user_first_name] = @user.first_name
  redirect "/users/#{@user.id}"
end

get '/users/:id' do
  @user = User.find(session[:user_id])
  @user.teams
  erb :'users/show'
end

get '/login' do
  erb :login
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

put '/users/:id/edit' do
  user = User.find(params[:id])
  user.send(params[:action], params[:team_id])

  redirect "/users/#{params[:id]}"
end
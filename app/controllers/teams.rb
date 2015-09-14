get '/teams/:id' do
  @user = User.find(session[:user_id]) if session[:user_id]
  @team = Team.find(params[:id])
  @articles = get_articles(@team)

  erb :'teams/show'
end
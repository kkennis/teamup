get '/sports' do
  @sports = Sport.order(name: :desc)
  erb :'sports/index'
end

get '/sports/:id' do
  @sport = Sport.find(params[:id])
  erb :'sports/show'
end


get '/sports' do
  @sports = Sport.order(:name)
  erb :'sports/index'
end

get '/sports/new' do
  erb :'sports/new'
end

post '/sports' do
  @sport = Sport.new(name: params[:name])
  if @sport.save
    redirect "/sports/#{@sport.id}"
  else
    @errors = @sport.errors.full_messages
    erb :'sports/new'
  end
end

get '/sports/:id' do
  @sport = Sport.find(params[:id])
  erb :'sports/show'
end

get '/sports/:id/edit' do
  @sport = Sport.find(params[:id])
  erb :'sports/edit'
end

put 'sports/:id' do
  sport = Sport.find(params[:id])
  sport.update_attributes(params[:sport])
  redirect "/sports/#{sport.id}"
end

delete 'Sports/:id' do
  sport = sport.find(params[:id])
  sport.destroy
  redirect '/sports'
end
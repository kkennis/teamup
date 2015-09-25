get '/' do
  redirect '/sports'
end

get '/test' do
  content_type :json

  puts get_bleacher_report_articles(Team.find(1));
end
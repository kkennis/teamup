sports = ["football", "baseball", "basketball"]


sports.each do |sport|
  Sport.create(name: sport)
end

teams = { "San Francisco" => ["49ers", "SF"], 
          "New England" => ["Patriots", "NE"], 
          "Green Bay" => ["Packers", "GB"],
          "Carolina" => ["Panthers", "CAR"] }

teams.each do |city, info|
  new_team = Team.create(name: info.first, city: city, abbreviation: info.last, league_id: 1)
  League.create(name: "NFL", full_name: "National Football League", sport_id: 1)
  Sport.find(1).leagues.first.teams << new_team
end
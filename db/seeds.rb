football = Sport.create(name: "football")
baseball = Sport.create(name: "baseball")


nfl = League.create(name: "NFL",
                    full_name: "National Football League",
                    sport_id: Sport.find_by(name: "football"))

football.leagues << nfl

mlb = League.create!(name: "MLB",
                    full_name: "Major League Baseball",
                    sport_id: Sport.find_by(name: "baseball"))

baseball.leagues << mlb



nfl_teams = {
          "Bills" => ["Buffalo", "BUF"],
          "Dolphins" => ["Miami", "MIA"],
          "Patriots" => ["New England", "NE"],
          "Jets" => ["New York", "NYJ"],
          "Ravens" => ["Baltimore", "BAL"],
          "Bengals" => ["Cincinnati", "CIN"],
          "Browns" => ["Cleveland", "CLE"],
          "Steelers" => ["Pittsburgh", "PIT"],
          "Texans" => ["Houston", "HOU"],
          "Colts" => ["Indianapolis", "IND"],
          "Jaguars" => ["Jacksonville", "JAX"],
          "Titans" => ["Tennessee", "TEN"],
          "Broncos" => ["Denver", "DEN"],
          "Chiefs" => ["Kansas City", "KC"],
          "Raiders" => ["Oakland", "OAK"],
          "Chargers" => ["San Diego", "SD"],
          "Cowboys" => ["Dallas", "DAL"],
          "Giants" => ["New York", "NYG"],
          "Eagles" => ["Philadelphia", "PHI"],
          "Redskins" => ["Washington", "WAS"],
          "Bears" => ["Chicago", "CHI"],
          "Lions" => ["Detroit", "DET"],
          "Packers" => ["Green Bay", "GB"],
          "Vikings" => ["Minnesota", "MIN"],
          "Falcons" => ["Atlanta", "ATL"],
          "Panthers" => ["Carolina", "CAR"],
          "Saints" => ["New Orleans", "NO"],
          "Buccaneers" => ["Tampa Bay", "TB"],
          "Cardinals" => ["Arizona", "ARI"],
          "Rams" => ["St. Louis", "STL"],
          "49ers" => ["San Francisco", "SF"],
          "Seahawks" => ["Seattle", "SEA"]
        }

nfl_teams.each do |name, city_info|
  new_team = Team.create(name: name,
                         city: city_info.first,
                         abbreviation: city_info.last,
                         league_id: nfl.id)
  nfl.teams << new_team
end

mlb_teams = {
          "Giants" => ["San Francisco", "SF"],
          "Dodgers" => ["Los Angeles", "SF"],
          "Padres" => ["San Diego", "SD"],
          "Diamondbacks" => ["Arizona", "ARI"],
          "Rockies" => ["Colorado", "COL"],
          "Cardinals" => ["St. Louis", "STL"],
          "Pirates" => ["Pittsburgh", "PIT"],
          "Cubs" => ["Chicago", "CHC"],
          "Brewers" => ["Milwaukee", "MIL"],
          "Reds" => ["Cincinnati", "CIN"],
          "Mets" => ["New York", "NYM"],
          "Nationals" => ["Washington", "WAS"],
          "Phillies" => ["Philadelphia", "PHI"],
          "Marlins" => ["Miami", "MIA"],
          "Braves" => ["Atlanta", "ATL"],
          "Athletics" => ["Oakland", "OAK"],
          "Rangers" => ["Texas", "TEX"],
          "Angels" => ["Anaheim", "LAA"],
          "Mariners" => ["Seattle", "SEA"],
          "Astros" => ["Houston", "HOU"],
          "Indians" => ["Cleveland", "CLE"],
          "White Sox" => ["Chicago", "CWS"],
          "Royals" => ["Kansas City", "KC"],
          "Tigers" => ["Detroit", "DET"],
          "Twins" => ["Minnesota", "MIN"],
          "Yankees" => ["New York", "NYY"],
          "Red Sox" => ["Boston", "BOS"],
          "Orioles" => ["Baltimore", "BAL"],
          "Rays" => ["Tampa Bay", "TB"],
          "Blue Jays" => ["Toronto", "TOR"]
        }

mlb_teams.each do |name, city_info|
  new_team = Team.create!(name: name,
                         city: city_info.first,
                         abbreviation: city_info.last,
                         league_id: mlb.id)
  mlb.teams << new_team
end



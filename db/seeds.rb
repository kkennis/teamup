football = Sport.create(name: "football")

nfl = League.create(name: "NFL", 
                    full_name: "National Football League", 
                    sport_id: Sport.find_by(name: "football"))

football.leagues << nfl

teams = { 
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

teams.each do |name, city_info|
  new_team = Team.create(name: name,
                         city: city_info.first, 
                         abbreviation: city_info.last,
                         league_id: nfl.id)
  nfl.teams << new_team
end

User.create(first_name: "Kevin",
            last_name: "Kennis",
            )
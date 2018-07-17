require 'csv'

class Team
  attr_accessor :name, :abrev, :vegas_line, :tier, :wins

  def initialize(name, abrev, vegas_line, tier)
    @name = name
    @abrev = abrev
    @vegas_line = vegas_line.to_f
    @tier = tier
    @wins = 0
  end

  def play_game(other_team, off_bye?, home?)
    

  end

end

teams = []

teams.push(
  Team.new(
    "Arizona Cardinals",
    "ARI",
    5.5,
    7
  )
)

teams.push(
  Team.new(
    "Atlanta Falcons",
    "ATL",
    9,
    2
  )
)

teams.push(
  Team.new(
    "Baltimore Ravens",
    "BAL",
    8,
    4
  )
)

teams.push(
  Team.new(
    "Buffalo Bills",
    "BUF",
    6.5,
    7
  )
)

teams.push(
  Team.new(
    "Carolina Panthers",
    "CAR",
    9,
    3
  )
)

teams.push(
  Team.new(
    "Chicago Bears",
    "CHI",
    6.5,
    5
  )
)

teams.push(
  Team.new(
    "Cinncinatti Bengals",
    "CIN",
    6.5,
    4
  )
)

teams.push(
  Team.new(
    "Cleveland Browns",
    "CLE",
    6.5,
    7
  )
)

teams.push(
  Team.new(
    "Dallas Cowboys",
    "DAL",
    8.5,
    4
  )
)

teams.push(
  Team.new(
    "Denver Broncos",
    "DEN",
    7,
    4
  )
)

teams.push(
  Team.new(
    "Detroit Lions",
    "DET",
    7.5,
    4
  )
)

teams.push(
  Team.new(
    "Green Bay Packers",
    "GB",
    10,
    2
  )
)

teams.push(
  Team.new(
    "Houston Texans",
    "HOU",
    6.5,
    5
  )
)

teams.push(
  Team.new(
    "Indianapolis Colts",
    "IND",
    6.5,
    4
  )
)

teams.push(
  Team.new(
    "Jacksonville Jaguars",
    "JAC",
    9,
    3
  )
)

teams.push(
  Team.new(
    "Kansas City Chiefs",
    "KC",
    8.5,
    4
  )
)

teams.push(
  Team.new(
    "Los Angeles Chargers",
    "LAC",
    9.5,
    2
  )
)


teams.push(
  Team.new(
    "Los Angeles Rams",
    "LAR",
    10,
    3
  )
)

teams.push(
  Team.new(
    "Miami Dolphins",
    "MIA",
    6.5,
    5
  )
)

teams.push(
  Team.new(
    "Minnesota Vikings",
    "MIN",
    10,
    3
  )
)

teams.push(
  Team.new(
    "New England Patriots",
    "NE",
    11,
    1
  )
)

teams.push(
  Team.new(
    "New Orleans Saints",
    "NO",
    9.5,
    3
  )
)

teams.push(
  Team.new(
    "New York Giants",
    "NYG",
    7,
    5
  )
)

teams.push(
  Team.new(
    "New York Jets",
    "NYJ",
    6,
    7
  )
)

teams.push(
  Team.new(
    "Oakland Raiders",
    "OAK",
    8,
    4
  )
)

teams.push(
  Team.new(
    "Philadelphia Eagles",
    "IND",
    10.5,
    3
  )
)

teams.push(
  Team.new(
    "Pittsburgh Steelers",
    "PIT",
    10.5,
    3
  )
)

teams.push(
  Team.new(
    "Seattle Seahawks",
    "SEA",
    8,
    4
  )
)

teams.push(
  Team.new(
    "San Francisco 49ers",
    "SF",
    8.5,
    4
  )
)

teams.push(
  Team.new(
    "Tampa Bay Buccaneers",
    "TB",
    6.5,
    4
  )
)

teams.push(
  Team.new(
    "Tennessee Titans",
    "TEN",
    8,
    4
  )
)

teams.push(
  Team.new(
    "Washington Redskins",
    "WAS",
    7,
    5
  )
)

def find_team_by_abv(arr, abv)
  x = arr.select {|team| team.abrev == abv}
  x[0]
end



games = CSV.read('nfl_sched.csv');






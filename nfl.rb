require "csv"

############## classes #############
class Team
  attr_accessor :name, :abrev, :vegas_line, :tier, :wins

  def initialize(name, abrev, vegas_line, tier)
    @name = name
    @abrev = abrev
    @vegas_line = vegas_line.to_f
    @tier = tier
    @wins = 0
  end

  def play_game(other_team, off_bye, home)
    wins_earned = 0
    diff = other_team.tier - @tier

    if off_bye
      diff += 1
    end

    if home
      wins_earned += win_share(diff, true)
    else
      wins_earned = +win_share(diff, false)
    end

    @wins += wins_earned
  end
end

########## functions ############

def win_share(diff, home)
  if home
    if diff > 5
      1
    elsif diff > 3
      0.9
    elsif diff > 2
      0.8
    elsif diff > 1
      0.7
    elsif diff > -2
      0.6
    elsif diff > -4
      0.5
    elsif diff > -5
      0.3
    elsif diff > -6
      0.2
    else
      0.1
    end
  else
    if diff > 5
      0.9
    elsif diff > 4
      0.8
    elsif diff > 3
      0.7
    elsif diff > 2
      0.5
    elsif diff > 1
      0.5
    elsif diff > -2
      0.4
    elsif diff > -4
      0.3
    elsif diff > -5
      0.1
    elsif diff > -6
      0.1
    else
      0
    end
  end
end

def find_team_by_abv(arr, abv)
  x = arr.select { |team| team.abrev == abv }
  x[0]
end

########### variable declarations ###########

teams = []
weeks = CSV.read("nfl_sched_2020.csv")

teams_to_create = [
  { name: "Arizona Cardinals", abbr: "ARI", vegas_line: 5.5, tier: 7 },
  { name: "Atlanta Falcons", abbr: "ATL", vegas_line: 9, tier: 3 },
  { name: "Baltimore Ravens", abbr: "BAL", vegas_line: 8, tier: 4 },
  { name: "Buffalo Bills", abbr: "BUF", vegas_line: 6.5, tier: 4 },
  { name: "Carolina Panthers", abbr: "CAR", vegas_line: 9, tier: 4 },
  { name: "Chicago Bears", abbr: "CHI", vegas_line: 6.5, tier: 4 },
  { name: "Cinncinatti Bengals", abbr: "CIN", vegas_line: 6.5, tier: 6 },
  { name: "Cleveland Browns", abbr: "CLE", vegas_line: 6.5, tier: 3 },
  { name: "Dallas Cowboys", abbr: "DAL", vegas_line: 8.5, tier: 4 },
  { name: "Denver Broncos", abbr: "DEN", vegas_line: 7, tier: 5 },
  { name: "Detroit Lions", abbr: "DET", vegas_line: 7.5, tier: 5 },
  { name: "Green Bay Packers", abbr: "GB", vegas_line: 10, tier: 2 },
  { name: "Houston Texans", abbr: "HOU", vegas_line: 6.5, tier: 4 },
  { name: "Indianapolis Colts", abbr: "IND", vegas_line: 6.5, tier: 4 },
  { name: "Jacksonville Jaguars", abbr: "JAC", vegas_line: 9, tier: 4 },
  { name: "Kansas City Chiefs", abbr: "KC", vegas_line: 8.5, tier: 1 },
  { name: "Los Angeles Chargers", abbr: "LAC", vegas_line: 9.5, tier: 3 },
  { name: "Los Angeles Rams", abbr: "LAR", vegas_line: 10, tier: 2 },
  { name: "Miami Dolphins", abbr: "MIA", vegas_line: 6.5, tier: 7 },
  { name: "Minnesota Vikings", abbr: "MIN", vegas_line: 10, tier: 3 },
  { name: "New England Patriots", abbr: "NE", vegas_line: 11, tier: 2 },
  { name: "New Orleans Saints", abbr: "NO", vegas_line: 9.5, tier: 1 },
  { name: "New York Giants", abbr: "NYG", vegas_line: 7, tier: 7 },
  { name: "New York Jets", abbr: "NYJ", vegas_line: 6, tier: 5 },
  { name: "Oakland Raiders", abbr: "OAK", vegas_line: 8, tier: 6 },
  { name: "Philadelphia Eagles", abbr: "PHI", vegas_line: 10.5, tier: 2 },
  { name: "Pittsburgh Steelers", abbr: "PIT", vegas_line: 10.5, tier: 2 },
  { name: "Seattle Seahawks", abbr: "SEA", vegas_line: 8, tier: 4 },
  { name: "San Francisco 49ers", abbr: "SF", vegas_line: 8.5, tier: 5 },
  { name: "Tampa Bay Buccaneers", abbr: "TB", vegas_line: 6.5, tier: 4 },
  { name: "Tennessee Titans", abbr: "TEN", vegas_line: 8, tier: 5 },
  { name: "Washington Redskins", abbr: "WAS", vegas_line: 7, tier: 7 },
]

teams_to_create.each do |team_stub|
  teams.push(Team.new(team_stub[:name], team_stub[:abbr], team_stub[:vegas_line], team_stub[:tier]))
end

######### scripts #########

weeks.each do |week|
  focus_team = find_team_by_abv(teams, week[0])
  last_bye = false
  week[1..-1].each_with_index do |game, i| puts i
    if game == "Bye"
    last_bye = true
    puts "bye week"
  elsif game.split("@").length > 1
    #team is on the road
    last_bye = false

    oppo_team = find_team_by_abv(teams, game.split("@")[1])

    focus_team.play_game(oppo_team, last_bye, false)

    puts "#{focus_team.name} @ #{oppo_team.name} and moves to #{focus_team.wins}"
  else
    #team is home
    last_bye = false
    oppo_team = find_team_by_abv(teams, game.split("@")[0])

    focus_team.play_game(oppo_team, last_bye, true)

    puts "#{focus_team.name} home vs #{oppo_team.name} and moves to #{focus_team.wins}"
  end   end
end

teams.each do |team|
  puts "#{team.name} --- #{team.wins.round(2)}"
end

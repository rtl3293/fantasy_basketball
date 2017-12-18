# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TEAMS_INFO = [{team_id: 1610612744, name: "Warriors"}]


teams = TEAMS_INFO.collect do |team_info|
  new_team = Team.create(team_id: team_info[:team_id], name: team_info[:name])
  team_players = NbaRb::Team::CommonRoster.new(team_id: team_info[:team_id]).roster
  team_players.each do |player|
    new_team.players.build(name: player["PLAYER"], player_id: player["PLAYER_ID"])
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TEAMS_INFO = NbaRb::TEAMS.collect do |team, team_info|
  {team_id: team_info["id"], name: team_info["name"]}
end


TEAMS_INFO.each do |team_info|
  new_team = Team.create(team_id: team_info[:team_id], name: team_info[:name])
  new_team.update_team_stats
  new_team.create_roster(team_info[:team_id])
  new_team.save
end

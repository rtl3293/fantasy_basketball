class Team < ActiveRecord::Base
  has_many :players
  has_many :users


  def create_roster(team_id)
    roster = NbaRb::Team::CommonRoster.new(team_id: team_id, season: "2017-18").roster
    # binding.pry
    roster.each do |player|
      new_player = players.build(name: player["PLAYER"], player_id: player["PLAYER_ID"], position: player["POSITION"], height: player["HEIGHT"], weight: player["WEIGHT"], school: player["SCHOOL"])
      new_player.save
    end
    update_stats(team_id)
    save
  end

  def update_stats(team_id)
    players = NbaRb::Team::Players.new(team_id: team_id, season: "2017-18").season_totals
    players.each do |player_hash|
      player = Player.find_by(player_id: player_hash["PLAYER_ID"])
      if !player.nil? && player.games_played != player_hash["GP"]
        player.update(games_played: player_hash["GP"], points_per_game: player_hash["PTS"], assists_per_game: player_hash["AST"], rebounds_per_game: player_hash["REB"], steals_per_game: player_hash["STL"], turnovers_per_game: player_hash["TOV"], blocks_per_game: player_hash["BLK"], plus_minus: player_hash["PLUS_MINUS"], minutes_per_game: player_hash["MIN"])
        player.save
        player
      else
        player
      end
    end
  end

end

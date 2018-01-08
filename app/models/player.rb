class Player < ActiveRecord::Base
  belongs_to :team

  def update_stats(player_hash)
    update(games_played: player_hash["GP"], points_per_game: player_hash["PTS"], assists_per_game: player_hash["AST"], rebounds_per_game: player_hash["REB"], steals_per_game: player_hash["STL"], turnovers_per_game: player_hash["TOV"], blocks_per_game: player_hash["BLK"], plus_minus: player_hash["PLUS_MINUS"], minutes_per_game: player_hash["MIN"])
    save
  end
end

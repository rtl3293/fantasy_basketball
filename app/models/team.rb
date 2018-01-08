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
    update_player_stats
    update_team_stats
    save
  end

  def update_team_stats
    stats = NbaRb::Team::Summary.new(team_id: team_id).info[0]
    # binding.pry
    update(wins: stats["W"], losses: stats["L"], win_pct: stats["PCT"])
    save
  end



  def update_player_stats
    players = NbaRb::Team::Players.new(team_id: team_id, season: "2017-18").season_totals
    players.each do |player_hash|
      player = Player.find_by(player_id: player_hash["PLAYER_ID"])
      if !player.nil? && player.games_played != player_hash["GP"]
        player.update_stats(player_hash)
        player
      else
        player
      end
    end
  end

end

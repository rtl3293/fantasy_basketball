class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :player_id
      t.string :position
      t.string :height
      t.string :weight
      t.string :school
      t.integer :games_played
      t.decimal :points_per_game
      t.decimal :assists_per_game
      t.decimal :rebounds_per_game
      t.decimal :blocks_per_game
      t.decimal :steals_per_game
      t.decimal :plus_minus
      t.decimal :minutes_per_game
      t.decimal :turnovers_per_game
      t.belongs_to :team
      t.timestamps null: false
    end
  end
end

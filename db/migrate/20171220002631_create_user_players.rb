class CreateUserPlayers < ActiveRecord::Migration
  def change
    create_table :user_players do |t|
      t.belongs_to :user
      t.belongs_to :player
    end
  end
end

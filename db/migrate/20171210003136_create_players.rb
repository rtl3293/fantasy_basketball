class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :player_id
      t.belongs_to :team
      t.timestamps null: false
    end
  end
end

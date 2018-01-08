class AddWinsAndLossesToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :wins, :integer
    add_column :teams, :losses, :integer
    add_column :teams, :win_pct, :decimal
  end
end

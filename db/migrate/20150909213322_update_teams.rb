class UpdateTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :sport_id, :integer
    add_column :teams, :league_id, :integer
  end
end

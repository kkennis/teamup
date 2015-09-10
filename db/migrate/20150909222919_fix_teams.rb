class FixTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :abbrevation, :string
    add_column :teams, :abbreviation, :string
  end
end

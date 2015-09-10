class FixTeamsTypo < ActiveRecord::Migration
  def change
    change_column :teams, :abbrevation, :string, name: :abbreviation
  end
end

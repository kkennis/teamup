class UpdateSports < ActiveRecord::Migration
  def change
    remove_column :sports, :league, :string
  end
end

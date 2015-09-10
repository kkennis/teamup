class CreateTrackedTeams < ActiveRecord::Migration
  def change
    create_table :tracked_teams do |t|
      t.references :user
      t.references :team
    end
  end
end

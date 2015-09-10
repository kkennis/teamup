class Team < ActiveRecord::Base
  has_many :users, through: :tracked_teams
  belongs_to :league
  belongs_to :sport, through: :league
end

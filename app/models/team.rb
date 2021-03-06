class Team < ActiveRecord::Base
  has_many :users, through: :tracked_teams
  belongs_to :league
  has_one :sport, through: :league

  def full_name
    self.city + " " + self.name
  end
end

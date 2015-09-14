class User < ActiveRecord::Base
  has_many :teams
  has_many :leagues, through: :teams
  has_many :sports, through: :leagues

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def add_team(team)
    channel = Team.find(team_id)
    self.tracked_teams << TrackedTeam.create(user_id: self.id, team_id: team_id)
  end

  def remove_channel(team_id)
    subscription = TrackedTeam.find_by(user_id: self.id, team_id: team_id)
    subscription.destroy
  end
end

class Sport < ActiveRecord::Base
  has_many :leagues
  has_many :teams, through: :leagues
end

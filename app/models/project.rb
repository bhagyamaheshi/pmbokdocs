class Project < ActiveRecord::Base
  has_many :project_teams
  has_many :users, through: :project_teams
  has_many :activities
end

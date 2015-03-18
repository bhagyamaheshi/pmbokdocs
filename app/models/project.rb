class Project < ActiveRecord::Base
  has_many :users, through: :project_team
  has_many :activities
end

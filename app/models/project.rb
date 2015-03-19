class Project < ActiveRecord::Base
  has_one  :project_team
  has_many :users, through: :project_team
  has_many :activities
end

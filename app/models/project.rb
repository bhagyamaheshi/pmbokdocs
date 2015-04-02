class Project < ActiveRecord::Base
  has_many :project_teams
  has_many :users, through: :project_teams
  has_many :activities

  before_save :capitalizeProjectName

  def capitalizeProjectName
    self.projectName.upcase!
  end

end

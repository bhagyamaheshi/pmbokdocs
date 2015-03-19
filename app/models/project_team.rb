class ProjectTeam < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  #has_many :users, through: :project
end

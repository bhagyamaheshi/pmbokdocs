class AddProjectsToProjectTeam < ActiveRecord::Migration
  def change
    add_reference :project_teams, :project, index: true
  end
end

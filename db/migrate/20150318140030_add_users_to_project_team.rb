class AddUsersToProjectTeam < ActiveRecord::Migration
  def change
    add_reference :project_teams, :user, index: true
  end
end

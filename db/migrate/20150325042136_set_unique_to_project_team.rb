class SetUniqueToProjectTeam < ActiveRecord::Migration
  def change
  	add_index :project_teams, [:project_id, :user_id], :unique => true
  end
end

class CreateProjectTeams < ActiveRecord::Migration
  def change
    create_table :project_teams do |t|

      t.timestamps
    end
  end
end

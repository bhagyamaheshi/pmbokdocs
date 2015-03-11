class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectId
      t.string :projectName
      t.text :description
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end

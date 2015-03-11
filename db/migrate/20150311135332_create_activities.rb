class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activityId
      t.string :activityName

      t.timestamps
    end
  end
end

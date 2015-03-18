class AddActivityCategoryToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :activity_category, index: true
  end
end

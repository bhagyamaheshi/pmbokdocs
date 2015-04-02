class AddActivityCategoryNameToActivityCategory < ActiveRecord::Migration
  def change
    add_column :activity_categories, :activityCategoryName, :string
  end
end

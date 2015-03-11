class CreateActivityCategories < ActiveRecord::Migration
  def change
    create_table :activity_categories do |t|
      t.string :categoryId
      t.string :categoryName

      t.timestamps
    end
  end
end

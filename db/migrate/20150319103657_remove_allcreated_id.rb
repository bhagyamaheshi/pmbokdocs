class RemoveAllcreatedId < ActiveRecord::Migration
  def change
    remove_column :activities, :activityId
    remove_column :activity_categories, :categoryId
    remove_column :document_categories, :categoryId
    remove_column :documents, :documentId
    remove_column :issues, :issueId
    remove_column :projects, :projectId
    remove_column :roles, :roleId
  end
end

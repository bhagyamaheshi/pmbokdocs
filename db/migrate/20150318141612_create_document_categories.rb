class CreateDocumentCategories < ActiveRecord::Migration
  def change
    create_table :document_categories do |t|
      t.string :categoryId
      t.string :categoryName

      t.timestamps
    end
  end
end

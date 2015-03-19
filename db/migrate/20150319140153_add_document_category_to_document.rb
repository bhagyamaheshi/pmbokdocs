class AddDocumentCategoryToDocument < ActiveRecord::Migration
  def change
    add_reference :documents, :document_category, index: true
  end
end

class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :documentId
      t.string :title
      t.string :description
      t.string :fileLocation

      t.timestamps
    end
  end
end

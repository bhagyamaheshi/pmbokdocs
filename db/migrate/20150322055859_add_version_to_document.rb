class AddVersionToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :version, :float
  end
end

class ChangeTypeDocumentTable < ActiveRecord::Migration
  def self.up
  	change_column :documents, :version, :integer
  end

  def self.down
  	change_column :documents, :version, :float
  end 
end

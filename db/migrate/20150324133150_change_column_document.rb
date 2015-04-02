class ChangeColumnDocument < ActiveRecord::Migration
    def change
  		add_column :documents, :versionMinor, :integer
  	end
end

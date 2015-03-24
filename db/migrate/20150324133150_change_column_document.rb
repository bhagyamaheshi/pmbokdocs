class ChangeColumnDocument < ActiveRecord::Migration
    def change
  		add_column :documents, :versionMinor, :int
  	end
end

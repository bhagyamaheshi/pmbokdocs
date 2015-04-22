class AddActivityToDocument < ActiveRecord::Migration
  def change
    add_reference :documents, :activity, index: true
  end
end

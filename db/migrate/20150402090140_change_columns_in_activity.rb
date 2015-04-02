class ChangeColumnsInActivity < ActiveRecord::Migration
  def change
    add_column :activities , :assignerID, :integer
    add_column :activities , :dueDate, :date
    add_column :activities , :priority, :string
    add_reference :activities, :user, index: true
    add_reference :activities, :documentcategories, index: true
  end
end

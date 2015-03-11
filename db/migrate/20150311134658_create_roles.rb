class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :roleId
      t.string :roleName

      t.timestamps
    end
  end
end

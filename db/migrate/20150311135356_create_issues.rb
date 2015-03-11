class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :issueId
      t.string :issueName

      t.timestamps
    end
  end
end

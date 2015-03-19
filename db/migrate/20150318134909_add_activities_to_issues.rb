class AddActivitiesToIssues < ActiveRecord::Migration
  def change
    add_reference :issues, :activity, index: true
  end
end

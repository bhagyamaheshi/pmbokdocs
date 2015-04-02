class Activity < ActiveRecord::Base
  belongs_to :project
  belongs_to :activity_category
  belongs_to :user
  has_many :issues
end

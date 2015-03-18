class Activity < ActiveRecord::Base
  belongs_to :project
  belongs_to :activity_category
  has_many :issues
end

class Document < ActiveRecord::Base
  belongs_to :document_category
  belongs_to :project
  attr_accessor :fileLocation
end

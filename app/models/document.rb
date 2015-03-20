class Document < ActiveRecord::Base
  belongs_to :document_category
  belongs_to :project

  has_attached_file :file
  #validates_attachment_content_type :file
  do_not_validate_attachment_file_type :file
end

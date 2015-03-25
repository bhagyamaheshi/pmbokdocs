class Document < ActiveRecord::Base
  belongs_to :document_category
  belongs_to :project

  before_save :renameFile

  has_attached_file :file, :fileLocation => ':rails_root/tmp/upload/:id/:basename.:extension'
  validates_attachment :file, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  #validates_attachment_content_type :file

  def documentName(name)
    @thisName = name.to_s
  end

  def renameFile
    extension = File.extname(file_file_name).downcase
    self.file.instance_write :file_name, "#{@thisName.to_s}#{extension}"
  end

end

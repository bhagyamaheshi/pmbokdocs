class Document < ActiveRecord::Base
  belongs_to :document_category
  belongs_to :project

  before_save :renameFile

  has_attached_file :file

  validates_attachment :file, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  def documentName(name)
    @thisName = name.to_s
  end

  def renameFile
    extension = File.extname(file_file_name).downcase
    self.file.instance_write :file_name, "#{@thisName.to_s}#{extension}"
  end

end

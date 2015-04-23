class Document < ActiveRecord::Base
  belongs_to :document_category
  belongs_to :project


  before_save :renameFile

  has_attached_file :upload
                    #:path => "public/system/:class/:id/:filename",
                    #:url => "/system/:class/:id/:basename.:extension"

 # has_attached_file :upload2,
  #                  :path => "public/system/upload2/:class/:id/:filename",
   #                 :url => "/system/upload2/:class/:id/:basename.:extension"

  #do_not_validate_attachment_file_type :upload, :upload2

  validates_attachment :upload, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  def rename(name)
    @thisName = name.to_s
  end

  def renameFile
    extension = File.extname(upload_file_name).downcase
    self.upload.instance_write :file_name, "#{@thisName.to_s}#{extension}"
  end


end

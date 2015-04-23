class AddAttachmentUpload2ToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :upload2
    end
  end

  def self.down
    remove_attachment :documents, :upload2
  end
end

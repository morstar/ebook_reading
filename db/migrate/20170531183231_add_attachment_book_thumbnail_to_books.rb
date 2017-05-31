class AddAttachmentBookThumbnailToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :book_thumbnail
    end
  end

  def self.down
    remove_attachment :books, :book_thumbnail
  end
end

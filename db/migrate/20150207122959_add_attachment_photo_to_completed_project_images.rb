class AddAttachmentPhotoToCompletedProjectImages < ActiveRecord::Migration
  def self.up
    change_table :completed_project_images do |t|
      t.attachment :photo
      t.integer :completed_project_id
      t.string :caption, limit: 100
    end
  end

  def self.down
    remove_attachment :completed_project_images, :photo
  end
end

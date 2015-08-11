class CompletedProjectImage < ActiveRecord::Base
  # Handle company's projects

  #Relationships
  belongs_to :completed_project

  # Paperclip
  has_attached_file :photo, :styles => { :medium => "800x600>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes

  # Accessible fields
  attr_accessible :photo

end

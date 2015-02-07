class CompletedProject < ActiveRecord::Base
  # Handle company's projects

  #Relationships
  has_many :completed_project_images
  belongs_to :completed_project_category

  accepts_nested_attributes_for :completed_project_images, :reject_if => lambda { |t| t['completed_project_image'].nil? }

  # Accessible fields
  attr_accessible :name, :release_date, :category_id, :description, :published, :created_at, :completed_project_images_attributes, :completed_project_category_id

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    name: 'Nom',
    release_date: "Date d'exécution",
    completed_project_category_id: 'Catégorie du projet',
    description: 'Description'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  #Validations
  validates :name, presence: true
  validates :name, :completed_project_category_id, :description, presence: true
  validates :name, length: {in: 5..100}
  validates :description, length: {minimum: 10}
end

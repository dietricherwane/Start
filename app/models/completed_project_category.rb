class CompletedProjectCategory < ActiveRecord::Base
  # Handle contact email subjects

  #Relationships
  has_many :completed_projects

  # Accessible fields
  attr_accessible :name, :published, :created_at, :id

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    name: 'Nom',
    published: 'Statut'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  #Validations
  validates :name, presence: true
  validates :name, length: {in: 4..100}
  validates :name, uniqueness: true
end

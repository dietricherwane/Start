class Subject < ActiveRecord::Base
  # Handle contact email subjects

  #Relationships
  has_many :contacts

  # Accessible fields
  attr_accessible :name, :published

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    name: 'Intitulé',
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

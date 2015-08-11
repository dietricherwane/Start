class Budget < ActiveRecord::Base
  # Handle project planner budget

  #Relationships
  has_many :project

  # Accessible fields
  attr_accessible :label, :published, :created_at

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    label: 'Libellé',
    published: 'Statut'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  #Validations
  validates :label, presence: true
  validates :label, length: {in: 5..100}
end

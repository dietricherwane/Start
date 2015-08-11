class Contact < ActiveRecord::Base
  # Handle users emails

  #Relationships
  belongs_to :subject

  # Accessible fields
  attr_accessible :name, :email, :subject_id,:message, :captcha, :created_at

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    name: 'Nom',
    email: 'Email',
    subject_id: 'Sujet',
    message: 'Message',
    captcha: 'captcha'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  #Validations
  validates :name, :email, :subject_id, :message, presence: true
  validates :name, length: {in: 5..100}
  validates :email, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true}
  validates :message, length: {in: 10..400}
end

class Project < ActiveRecord::Base
  # Handle users projects

  #Relationships
  belongs_to :budget

  # Accessible fields
  attr_accessible :name, :email, :phone_number, :company_name, :website, :location, :details, :begin_date, :budget_id, :desired_task, :anything_else, :created_at

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    name: 'Nom*',
    email: 'Email*',
    phone_number: 'Numéro de téléphone*',
    company_name: "Nom de l'entreprise",
    website: 'Site web',
    location: 'Votre localisation*',
    details: 'Descriptif du projet*',
    begin_date: 'Date de début*',
    budget_id: 'Votre budget*',
    desired_task: 'Ce que vous attendez de nous*',
    anything_else: 'Détails additionnels',
    created_at: 'Date de création'
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  #Validations
  validates :name, :email, :phone_number, :location, :details, :budget_id, :desired_task, :begin_date, presence: true
  validates :name, :email, :website, :location, length: {in: 5..100, allow_blank: true}
  validates :company_name, length: {in: 3..100, allow_blank: true}
  validates :phone_number, length: {in: 6..15, allow_blank: true}
  validates :email, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true}
  validates :details, :desired_task, :anything_else, length: {in: 10..400, allow_blank: true}
  validates :website, format: {with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, multiline: true, allow_blank: true}
  #validate :begin_date_is_valid

  def begin_date_is_valid
    errors.add(:begin_date, 'doit débuter dans au moins une semaine') if ((Date.parse(begin_date) rescue DateTime.now) < (DateTime.now + 1.week))
  end

  after_create :send_mail

  def send_mail
    ProjectMailer.notification(self).deliver
  end
end

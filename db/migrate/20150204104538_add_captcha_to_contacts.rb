class AddCaptchaToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :captcha, :string, limit: 20
  end
end

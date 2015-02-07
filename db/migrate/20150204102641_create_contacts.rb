class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, limit: 100
      t.string :email, limit: 100
      t.string :sujet, limit: 200
      t.text :message

      t.timestamps
    end
  end
end

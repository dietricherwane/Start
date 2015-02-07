class RemoveSubjectFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :sujet
  end
end

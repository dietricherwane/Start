class AddSubjectIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :subject_id, :integer
  end
end

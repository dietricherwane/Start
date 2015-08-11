class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, limit: 100
      t.string :email, limit: 100
      t.string :phone_number, limit: 16
      t.string :company_name, limit: 100
      t.string :website, limit: 100
      t.string :location, limit: 100
      t.text :details
      t.datetime :begin_date
      t.integer :budget_id
      t.text :desired_task
      t.text :anything_else

      t.timestamps
    end
  end
end

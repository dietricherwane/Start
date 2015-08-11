class CreateCompletedProjects < ActiveRecord::Migration
  def change
    create_table :completed_projects do |t|
      t.string :name, limit: 100
      t.datetime :release_date
      t.integer :category_id
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end

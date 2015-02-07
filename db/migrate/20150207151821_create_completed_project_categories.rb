class CreateCompletedProjectCategories < ActiveRecord::Migration
  def change
    create_table :completed_project_categories do |t|
      t.string :name, limit: 100
      t.boolean :published

      t.timestamps
    end
  end
end

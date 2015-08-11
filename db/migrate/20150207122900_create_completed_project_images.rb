class CreateCompletedProjectImages < ActiveRecord::Migration
  def change
    create_table :completed_project_images do |t|

      t.timestamps
    end
  end
end

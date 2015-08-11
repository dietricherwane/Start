class AddCompletedProjectCategoryIdToCompletedProjects < ActiveRecord::Migration
  def change
    add_column :completed_projects, :completed_project_category_id, :integer
  end
end

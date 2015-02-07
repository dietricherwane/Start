class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Adds active class to the active menu item
  def current_menu_item_class(active_menu_hash)
    @menu_hash_class = {:home => '', :projects => '', :skills => '', :about_us => '', :contact => ''}
    @menu_hash_class.merge!(active_menu_hash)

    return @menu_hash_class
  end

  def initialize_project_planner
    @project = Project.new

    @budgets = Budget.where(published: [nil, true]).order('created_at ASC')
  end
end

class HomeController < ApplicationController
  before_filter :initialize_project_planner, except: :show

  layout 'front'

  def index
    @page_title = "START::Accueil"
    @completed_projects = CompletedProject.where(published: [nil, true]).limit(6).order("created_at DESC")

    current_menu_item_class({:home => 'current-menu-item'})
  end

  def skills
    @page_title = "START::Competences"
    current_menu_item_class({:skills => 'current-menu-item'})
  end

  def about_us
    @page_title = "START::A-propos"
    current_menu_item_class({:about_us => 'current-menu-item'})
  end

  def portfolio
    @page_title = "START::Nos-projets"
    current_menu_item_class({:projects => 'current-menu-item'})

    @completed_project_categories = CompletedProjectCategory.where(published: [nil, true]).order('name ASC')

    @completed_projects = CompletedProject.where(published: [nil, true])
  end

end

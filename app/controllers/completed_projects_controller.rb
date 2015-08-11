class CompletedProjectsController < ApplicationController
  before_filter :initialize_project_planner, only: [:details]

  layout :select_layout

  def select_layout
    if ["details"].include?(action_name)
      return "front"
    else
      return "administrator"
    end
  end

  def new
    @page_title = "START::Projet"
    @completed_project = CompletedProject.new
    @completed_project_categories = CompletedProjectCategory.where(published: [nil, true])
    5.times {@completed_project.completed_project_images.build}
  end

  def create
    @page_title = "START::Projet"
    @completed_project_categories = CompletedProjectCategory.where(published: [nil, true])
    @completed_project = CompletedProject.new(params[:completed_project])

    if @completed_project.save
      #params[:completed_project][:completed_project_images_attributes].each do |photo|
        #@completed_project.completed_project_images.create(photo)
      #end
      params[:completed_project][:completed_project_images_attributes].each do |key, array|
        @completed_project.completed_project_images.create(array)
      end
      @completed_project = CompletedProject.new

      flash.now[:success] = "Le projet a été créé."
    else
      flash.now[:error] = @completed_project.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    end

    5.times {@completed_project.completed_project_images.build}

    render :new
  end

  def details
    @completed_project = CompletedProject.find_by_id(params[:completed_project_id])
    @completed_projects = CompletedProject.where(published: [nil, true]).limit(6).order("created_at DESC")
    current_menu_item_class({:projects => 'current-menu-item'})
    @page_title = "START::Détails du projet"

    unless @completed_project
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end
end

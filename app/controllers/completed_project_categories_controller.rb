class CompletedProjectCategoriesController < ApplicationController
  layout 'administrator'

  def new
    @page_title = "START::Catégories de projets terminés"
    @completed_project_category = CompletedProjectCategory.new
  end

  def create
    @page_title = "START::Catégories de projets terminés"
    @completed_project_category = CompletedProjectCategory.new(params[:completed_project_category])

    if @completed_project_category.save
      @completed_project_category = CompletedProjectCategory.new
      flash.now[:success] = "La catégorie a été créée"
    else
      flash.now[:error] = @completed_project_category.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    end

    render :new
  end

  def show
    @page_title = "START::Catégories de projets terminés"
    @completed_project_categories = CompletedProjectCategory.all.order('name ASC')
  end

  def edit
    @page_title = "START::Catégories de projets terminés"
    @completed_project_category = CompletedProjectCategory.find_by_id(params[:completed_project_category_id])

    unless @completed_project_category
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

  def update
    @completed_project_category = CompletedProjectCategory.find_by_id(params[:completed_project_category_id])

    if @completed_project_category.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @completed_project_category.update_attributes(params[:completed_project_category])
      if @completed_project_category.errors.full_messages.blank?
        flash.now[:success] = "La catégorie a été mise à jour."
      else
        flash.now[:error] = @completed_project_category.errors.full_messages.map { |msg| "<p>#{msg}</p>" }.join
        @completed_project_category = CompletedProjectCategory.find_by_id(params[:completed_project_category_id])
      end

      render :edit, id: @completed_project_category.id
    end
  end

  def enable
    enable_disable(true, 'activée')
  end

  def disable
    enable_disable(false, 'désactivée')
  end

  def enable_disable(status, message)
    completed_project_category = CompletedProjectCategory.find_by_id(params[:completed_project_category_id])
    if completed_project_category.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      completed_project_category.update_attribute(:published, status)
      flash[:success] = "La catégorie: #{completed_project_category.name} a été #{message}."

      redirect_to completed_project_categories_path
    end
  end

end

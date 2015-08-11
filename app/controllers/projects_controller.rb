class ProjectsController < ApplicationController
  before_filter :initialize_project_planner

  layout :select_layout

  def select_layout
    if ["show"].include?(action_name)
      return "administrator"
    else
      return "front"
    end
  end

  def new
    @page_title = "START::Projet"
    @project = Project.new
  end

  def create
    @page_title = "START::Projet"
    current_menu_item_class({:projects => 'current-menu-item'})
    @project = Project.new(params[:project].merge!({:begin_date => (Date.parse(params[:project][:begin_date]) rescue Date.today + 1.week)}))

    #if @project.save
      #@project = Project.new
      #flash.now[:success] = "Le projet a été créé"
    #else
      #flash.now[:error] = @project.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    #end

    respond_to do |format|
      if @project.save
        @project = Project.new
        format.js { render :js => %Q[$( "#project_errors" ).html("");$('#planner-scrollarea').getNiceScroll().remove();$('.planner-modal').css('display', 'none');$('body').css('overflow-y', 'scroll');document.getElementById("new_project").reset();alert("Nous vous remercions pour votre soumission. Nous l'étudierons et vous recontacterons sous peu.");] }
      else
        error_message = @project.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
        format.js { render :js => %Q[$( "#project_errors" ).html("#{error_message}"); $('#planner-scrollarea').animate( { scrollTop:0}, 750);] }
      end
    end

    #render :new
  end

  def show
    @page_title = "START::Projects"
    @projects = Project.all.order('created_at ASC')
  end
end

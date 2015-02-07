class SubjectsController < ApplicationController

  layout 'administrator'

  def new
    @page_title = "START::Sujet"
    @subject = Subject.new
  end

  def create
    @page_title = "START::Sujet"
    @subject = Subject.new(params[:subject])

    if @subject.save
      @subject = Subject.new
      flash.now[:success] = "Le sujet a été créé"
    else
      flash.now[:error] = @subject.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    end

    render :new
  end

  def show
    @page_title = "START::Sujets"
    @subjects = Subject.all.order('name ASC')
  end

  def edit
    @page_title = "START::Sujet"
    @subject = Subject.find_by_id(params[:subject_id])

    unless @subject
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

  def update
    @subject = Subject.find_by_id(params[:subject_id])

    if @subject.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @subject.update_attributes(params[:subject])
      if @subject.errors.full_messages.blank?
        flash.now[:success] = "Le sujet a été mis à jour."
      else
        flash.now[:error] = @subject.errors.full_messages.map { |msg| "<p>#{msg}</p>" }.join
        @subject = Subject.find_by_id(params[:subject_id])
      end

      render :edit, id: @subject.id
    end
  end

  def enable
    enable_disable(true, 'activé')
  end

  def disable
    enable_disable(false, 'désactivé')
  end

  def enable_disable(status, message)
    subject = Subject.find_by_id(params[:subject_id])
    if subject.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      subject.update_attribute(:published, status)
      flash[:success] = "Le sujet: #{subject.name} a été #{message}."

      redirect_to subjects_path
    end
  end

end

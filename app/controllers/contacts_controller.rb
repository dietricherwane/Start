class ContactsController < ApplicationController
  before_filter :initialize_project_planner, except: :show

  #layout 'front'

  layout :select_layout

  def select_layout
    if ["show"].include?(action_name)
      return "administrator"
    else
      return "front"
    end
  end

  def new
    @page_title = "START::Contacts"
    current_menu_item_class({:contact => 'current-menu-item'})

    @contact = Contact.new
    @subjects = Subject.where(published: [nil, true])
  end

  def create
    @page_title = "START::Contacts"
    @contact = Contact.new(params[:contact])
    @subjects = Subject.where(published: [nil, true])
    current_menu_item_class({:contact => 'current-menu-item'})

    if @contact.save
      ContactMailer.notification(@contact).deliver
      @contact = Contact.new
      flash.now[:success] = "Votre message a bien été envoyé"
    else
      flash.now[:error] = @contact.errors.full_messages.map{ |msg|  "#{msg}<br />"}.join
    end

    render :new
  end

  def show
    @page_title = "START::Contacts"
    @contacts = Contact.all.order('created_at DESC')
  end
end

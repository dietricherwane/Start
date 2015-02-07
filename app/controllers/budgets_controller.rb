class BudgetsController < ApplicationController
  layout 'administrator'

  def new
    @page_title = "START::Budget"
    @budget = Budget.new
  end

  def create
    @page_title = "START::Budget"
    @budget = Budget.new(params[:budget])

    if @budget.save
      @budget = Budget.new
      flash.now[:success] = "Le budget a été créé"
    else
      flash.now[:error] = @budget.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    end

    render :new
  end

  def show
    @page_title = "START::Budgets"
    @budgets = Budget.all.order('created_at ASC')
  end

  def edit
    @page_title = "START::Budget"
    @budget = Budget.find_by_id(params[:budget_id])

    unless @budget
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

  def update
    @budget = Budget.find_by_id(params[:budget_id])

    if @budget.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @budget.update_attributes(params[:budget])
      if @budget.errors.full_messages.blank?
        flash.now[:success] = "Le budget a été mis à jour."
      else
        flash.now[:error] = @budget.errors.full_messages.map { |msg| "<p>#{msg}</p>" }.join
        @budget = Budget.find_by_id(params[:budget_id])
      end

      render :edit, id: @budget.id
    end
  end

  def enable
    enable_disable(true, 'activé')
  end

  def disable
    enable_disable(false, 'désactivé')
  end

  def enable_disable(status, message)
    budget = Budget.find_by_id(params[:budget_id])
    if budget.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      budget.update_attribute(:published, status)
      flash[:success] = "Le budget: #{budget.label} a été #{message}."

      redirect_to budgets_path
    end
  end

end

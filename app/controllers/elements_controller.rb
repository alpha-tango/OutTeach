class ElementsController < ApplicationController
  before_action :authenticate_user!

  def new
    @element = Element.new
  end

  def create
    @element = Element.new(element_params)
    @assignment = Assignment.find(params[:assignment_id])
    @element.assignment = @assignment

    if @element.save
      flash[:notice] = "Element successfully created!"
      redirect_to assignment_path(@assignment)
    else
      render 'assignments/show'
    end
  end

  def destroy
    element = Element.includes(:assignment).find(params[:id])
    if element.user == current_user
      @element = element
    end
    if @element.destroy
      redirect_to assignment_path(@element.assignment)
      flash[:notice]="Element deleted"
    else
      render :show
    end
  end

  def element_params
    params.require(:element).permit(:type_id, :assignment_id, :content, :title, :citation, :url, :video_embed)
  end

  def edit
    element = Element.includes(:assignment).find(params[:id])
    if element.user == current_user
      @element = element
    end
  end

  def update
    element = Element.includes(:assignment).find(params[:id])
    if element.user == current_user
      @element = element
    end
    if @element.update(element_params)
      redirect_to assignment_path(@element.assignment)
      flash[:notice] = "Assignment updated"
    else
      render :edit
    end
  end
end

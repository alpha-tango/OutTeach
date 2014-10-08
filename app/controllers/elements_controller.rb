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
      redirect_to course_assignment_path(@assignment.course, @assignment)
    else
      render 'assignments/show'
    end
  end

  def element_params
    params.require(:element).permit(:type_id, :assignment_id, :content, :title, :citation, :url)
  end
end

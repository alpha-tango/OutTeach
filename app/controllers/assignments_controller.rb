class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @assignment = Assignment.new(assignment_params)
    @course = Course.find(params[:course_id])
    @assignment.course = @course

    if @assignment.save
      flash[:notice] = "Assignment successfully created!"
      redirect_to course_assignment_path(@course, @assignment)
    else
      render 'courses/show'
    end
  end

  def assignment_params
    params.require(:assignment).permit(:course_id, :title)
  end

  def show
    @assignment = Assignment.find(params[:id])
    @element = Element.new
  end

end

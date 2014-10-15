class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.course = @course

    if @assignment.save
      flash[:notice] = "Assignment successfully created!"
      redirect_to assignment_path(@assignment)
    else
      @quiz = Quiz.new
      render 'courses/show'
    end
  end

  def assignment_params
    params.require(:assignment).permit(:course_id, :title, :goals, :importance)
  end

  def show
    @assignment = Assignment.includes(:course, :elements).find(params[:id])
    @element = Element.new
  end

  def destroy
    @assignment = Assignment.includes(:course).find(params[:id])
    if @assignment.user == current_user && @assignment.destroy
      redirect_to course_path(@assignment.course)
      flash[:notice] = "Assignment deleted"
    else
      render :show
    end
  end

  def edit
    assignment = Assignment.find(params[:id])
    if assignment.user == current_user
      @assignment = assignment
    end
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.user == current_user && @assignment.update(assignment_params)
      redirect_to assignment_path(@assignment)
      flash[:notice] = "Assignment updated"
    else
      render :edit
    end
  end
end

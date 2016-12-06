class TrainingCourseListsController < ApplicationController
  before_action :set_training_course_list, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @training_course_lists = TrainingCourseList.all
    respond_with(@training_course_lists)
  end

  def show
    respond_with(@training_course_list)
  end

  def new
    @training_course_list = TrainingCourseList.new
    respond_with(@training_course_list)
  end

  def edit
  end

  def create
    @training_course_list = TrainingCourseList.new(training_course_list_params)
    @training_course_list.save
    respond_with(@training_course_list)
  end

  def update
    @training_course_list.update(training_course_list_params)
    respond_with(@training_course_list)
  end

  def destroy
    @training_course_list.destroy
    respond_with(@training_course_list)
  end

  private
    def set_training_course_list
      @training_course_list = TrainingCourseList.find(params[:id])
    end

    def training_course_list_params
      params[:training_course_list]
    end
end

class TrainingCourseListsController < ApplicationController
  before_action :set_training_course_list, only: [:show]

  respond_to :html, :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @training_course_lists = TrainingCourse.all.page(params[:page]).per(params[:per_page])
    respond_with(@training_course_lists)
  end

  def show
    respond_with(@training_course_list)
  end

  private
    def set_training_course_list
      @training_course_list = TrainingCourse.find(params[:id])
    end
end

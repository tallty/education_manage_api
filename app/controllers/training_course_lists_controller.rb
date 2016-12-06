class TrainingCourseListsController < ApplicationController
  before_action :set_training_course, only: [:show]

  respond_to :html, :json

  def index
    # @keyword = params[:keyword].present?? params[:keyword] : " "
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @training_courses = TrainingCourse.all.is_training.page(params[:page]).per(params[:per_page])
    respond_with(@training_courses)
  end

  # def list
  #   @category = params[:category].present?? params[:category] : "0"
  #   @keyword = params[:keyword].present?? params[:keyword] : " "
  #   page = params[:page] || 1
  #   per_page = params[:per_page] || 15
  #   @training_course_lists = TrainingCourse.all.scope_category(@category).keyword(@keyword).page(params[:page]).per(params[:per_page])
  #   respond_with(@training_course_lists, template:"training_course_lists/index", status: 200)
  # end

  def show
    respond_with(@training_course)
  end

  private
    def set_training_course
      @training_course = TrainingCourse.find(params[:id])
    end
end

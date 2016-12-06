class AdminPanel::ProjectsController < AdminPanel::BaseController
  def index
    @projects = TrainingCourse.all.page(params[:page]).per(15)
  end
end

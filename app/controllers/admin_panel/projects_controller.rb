class AdminPanel::ProjectsController < AdminPanel::BaseController

  def index
    @projects = TrainingCourse.all.keyword(params[:keyword]).page(params[:page]).per(15)
  end
end

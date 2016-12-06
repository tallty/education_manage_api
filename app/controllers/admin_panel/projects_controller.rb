class AdminPanel::ProjectsController < AdminPanel::BaseController
  load_and_authorize_resource
  
  def index
    @projects = TrainingCourse.all.page(params[:page]).per(15)
  end
end

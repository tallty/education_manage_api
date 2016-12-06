class AdminPanel::SyllabusesController < AdminPanel::BaseController
  load_and_authorize_resource

  def index
    @projects = TrainingCourse.all.page(params[:page]).per(15)
    @syllabuses = Syllabuses.all.page(params[:page]).per(15)
  end
end

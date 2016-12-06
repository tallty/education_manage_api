class AdminPanel::SyllabusesController < AdminPanel::BaseController
  load_and_authorize_resource

  def index
    @syllabuses = Syllabus.all.page(params[:page]).per(15)
  end
end

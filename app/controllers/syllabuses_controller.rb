class SyllabusesController < ApplicationController
  before_action :set_syllabus, only: [:show, :update, :destroy]

  respond_to :json, :html

  # GET /syllabuses
  # GET /syllabuses.json
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 5
    @syllabuses = Syllabus.all.paginate(page: page, per_page:per_page)
    respond_with(@syllabuses)
  end

  # GET /syllabuses/1
  # GET /syllabuses/1.json
  def show
    respond_with(@syllabus)
  end

  # POST /syllabuses
  # POST /syllabuses.json
  def create
    @syllabus = Syllabus.new(syllabus_params)
    if @syllabus.save
      respond_with(@syllabus)
    else
      @error = "课程表创建失败 ！"
      respond_with(@error)
    end
  end

  # PATCH/PUT /syllabuses/1
  # PATCH/PUT /syllabuses/1.json
  def update
    @syllabus.update(syllabus_params)
    respond_with(@syllabus) 
  end

  # DELETE /syllabuses/1
  # DELETE /syllabuses/1.json
  def destroy
    @syllabus.destroy
    respond_with(@syllabus)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_syllabus
      @syllabus = Syllabus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def syllabus_params
      params.require(:syllabus).permit(:training_course_id, :school_id, :course_time, :title, :content)
    end
end

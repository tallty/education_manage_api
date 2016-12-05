class SyllabusesController < ApplicationController
  # acts_as_token_authentication_handler_for User
  before_action :set_syllabus, only: [:show, :update, :destroy]

  respond_to :json, :html

  # GET /syllabuses
  # GET /syllabuses.json
  def index
    # page = params[:page] || 1
    # per_page = params[:per_page] || 5
    # @syllabuses = Syllabus.all.paginate(page: page, per_page:per_page)
    @syllabuses = Syllabus.all.page(params[:page]).per(5)
    respond_with(@syllabuses)
  end

  # GET /syllabuses/1
  # GET /syllabuses/1.json
  def show
    respond_with(@syllabus)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_syllabus
      @syllabus = Syllabus.find(params[:id])
    end
end

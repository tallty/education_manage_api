class SignsController < ApplicationController
  before_action :set_sign, only: [:show]

  respond_to :json, :html

  # GET /signs
  # GET /signs.json
  def index
    page = params[:page] || 1
    per_page = params[:per_page]
    @signs = Sign.all.paginate(page: page, per_page: per_page)
    respond_with(@signs)
  end

  # GET /signs/1
  # GET /signs/1.json
  def show
    respond_with(@sign)
  end

  # POST /signs
  # POST /signs.json
  def create
    @sign = Sign.new(sign_params)
    if @sign.save
      respond_with(@sign)
    else
      @error = "签到 失败 ！"
      respond_with(@error)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign
      @sign = Sign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sign_params
      params.require(:sign).permit(:training_course_id, :school_id, :user_id, :sign_time)
    end
end

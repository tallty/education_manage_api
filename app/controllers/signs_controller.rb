class SignsController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_sign, only: [:show]

  respond_to :json, :html

  # GET /signs
  # GET /signs.json
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 6
    # @signs = Sign.all.paginate(page: page, per_page: per_page)
    @signs = current_user.signs.default_order.page(params[:page]).per(params[:per_page])
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
    @sign = current_user.signs.build(sign_params)
    if @sign.save
      respond_with(@sign, template: "signs/show", status: 201)
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
      params.require(:sign).permit(:user_id, :syllabus_id, :title, :teacher, :address)
    end
end

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
    user_id = current_user.id 
    @user = User.all.get_user(user_id) #判断当前登录的用户是否报名了
    if @user.present?
      @sign = current_user.signs.build(sign_params)
      if @sign.save
        respond_with(@sign, template: "signs/show", status: 201)
      else
        @error = "签到 失败 ！"
        respond_with(@error)
      end
    else
      @error = "您没有报名该培训课程，所以不能签到 ！"
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

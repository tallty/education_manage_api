class Admin::SignsController < ApplicationController
  before_action :set_admin_sign, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_signs = Admin::Sign.all
    respond_with(@admin_signs)
  end

  def show
    respond_with(@admin_sign)
  end

  def new
    @admin_sign = Admin::Sign.new
    respond_with(@admin_sign)
  end

  def edit
  end

  def create
    @admin_sign = Admin::Sign.new(admin_sign_params)
    @admin_sign.save
    respond_with(@admin_sign)
  end

  def update
    @admin_sign.update(admin_sign_params)
    respond_with(@admin_sign)
  end

  def destroy
    @admin_sign.destroy
    respond_with(@admin_sign)
  end

  private
    def set_admin_sign
      @admin_sign = Admin::Sign.find(params[:id])
    end

    def admin_sign_params
      params[:admin_sign]
    end
end

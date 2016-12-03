class Admin::SyllabusesController < ApplicationController
  before_action :set_admin_syllabus, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_syllabuses = Admin::Syllabus.all
    respond_with(@admin_syllabuses)
  end

  def show
    respond_with(@admin_syllabus)
  end

  def new
    @admin_syllabus = Admin::Syllabus.new
    respond_with(@admin_syllabus)
  end

  def edit
  end

  def create
    @admin_syllabus = Admin::Syllabus.new(admin_syllabus_params)
    @admin_syllabus.save
    respond_with(@admin_syllabus)
  end

  def update
    @admin_syllabus.update(admin_syllabus_params)
    respond_with(@admin_syllabus)
  end

  def destroy
    @admin_syllabus.destroy
    respond_with(@admin_syllabus)
  end

  private
    def set_admin_syllabus
      @admin_syllabus = Admin::Syllabus.find(params[:id])
    end

    def admin_syllabus_params
      params[:admin_syllabus]
    end
end

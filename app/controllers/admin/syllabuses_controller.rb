class Admin::SyllabusesController < ApplicationController
  acts_as_token_authentication_handler_for Admin
  before_action :set_admin_syllabus, only: [:show, :update, :destroy]

  respond_to :html, :json

  def index
    # page = params[:page] || 1
    # per_page = params[:per_page] || 5
    # @admin_syllabuses = Syllabus.all.paginate(page: page, per_page:per_page)
    @admin_syllabuses = Syllabus.all.page(params[:page]).per(5)
    respond_with(@admin_syllabuses)
  end

  def show
    respond_with(@admin_syllabus)
  end

  def upload_course_list
    @error = UploadCourseList.upload_xls(params[:file])
    unless @error.nil?
      @error = "上传失败，请检查信息表格式。 {error: #{@error}}"
      respond_with(@error)
    end 
  end

  #get 'admin/load_course_list_template'
  def load_course_list_template
    send_file File.dirname(__FILE__) + '/../../../培训管理员上传课程表模板.xlsx',
        :filename => "培训管理员上传课程表模板.xlsx"   
  end

  def create
    @admin_syllabus = Syllabus.new(admin_syllabus_params)
    if @admin_syllabus.save
      respond_with(@admin_syllabus)
    else
      @error = "课程表创建失败 ！"
      respond_with(@error)
    end
  end

  def update
    @admin_syllabus.update(admin_syllabus_params)
    respond_with(@admin_syllabus, template: "admin/syllabuses/show", status: 201)
  end

  def destroy
    @admin_syllabus.destroy
    respond_with(@admin_syllabus)
  end

  private
    def set_admin_syllabus
      @admin_syllabus = Syllabus.find(params[:id])
    end

    def admin_syllabus_params
     params.require(:syllabus).permit(:training_course_id, :course_time, :title, :content, :address, :teacher)
    end
end

require 'acceptance_helper'

resource "管理员对 课程表 相关的API" do
  header "Accept", "application/json"

  #################### create #############################
  post '/admin/syllabuses' do
    admin_attrs = FactoryGirl.attributes_for(:admin)
    syllabus_attrs = FactoryGirl.attributes_for(:syllabus)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    parameter :title, " 课程表 课程的标题 (必填)",required: true, scope: :syllabus
    parameter :training_course_id, "课程表 课程 属于的项目(必填)",required: true, scope: :syllabus
    parameter :teacher, "课程表 课程老师名称(必填)",required: true, scope: :syllabus
    parameter :course_time, "课程表 课程的开课 时间(必填)",required: true, scope: :syllabus
    parameter :content, "课程表 课程简介(必填)",required: true, scope: :syllabus
    parameter :address, "课程表 签到地址(必填)",required: true, scope: :syllabus

    let(:title) {syllabus_attrs[:title]}
    let(:training_course_id) {syllabus_attrs[:training_course_id]}
    let(:teacher) {syllabus_attrs[:teacher]}
    let(:course_time) {syllabus_attrs[:course_time]}
    let(:content) {syllabus_attrs[:content]}
    let(:address) {syllabus_attrs[:address]}

    before do
      @admin = create(:admin)
      # @training_course = create(:training_course)
    end

    example "管理员 创建课程表 成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  ############### before_do ################################
  describe 'syllabus condition is all correct' do
    admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      # @training_course = create(:training_course)
    end
    
    ################### upload_course_list ############
    post 'admin/upload_course_list' do

      parameter :file, "名单 仅(.xlsx)文件", required: true

      example "管理员上传 课程表成功" do
        puts "上传 课程表成功。。。。。"
      end
    end

    ################## load_course_list_template ############
    get 'admin/load_course_list_template' do
      example "管理员 下载 用户信息模板xlsx文件" do
        puts "下载 用户信息模板xlsx文件 成功"
      end
    end
  end
  

  ############### before_do ################################
  describe 'syllabus condition is all correct' do
    admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      @admin_syllabuses = create_list(:syllabus, 5, course_time: Time.zone.now)
    end

    #################### index #############################
    get '/admin/syllabuses' do

      parameter :page, "当前页", required: false
      parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {6}

      example "管理员 查询 课程表 记录 成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/admin/syllabuses/:id" do

      let(:id) {@admin_syllabuses.first.id}
 
      example " 管理员 查询指定 课程表 的详情成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end
    ##################### update #############################
    put "/admin/syllabuses/:id" do

      let(:id) {@admin_syllabuses.first.id}

      syllabus_attrs = FactoryGirl.attributes_for(:syllabus)

      parameter :title, " 课程表 课程的标题 (必填)",required: true, scope: :syllabus
      parameter :training_course_id, "课程表 课程 属于的项目(必填)",required: true, scope: :syllabus
      parameter :teacher, "课程表 课程老师名称(必填)",required: true, scope: :syllabus
      parameter :course_time, "课程表 课程的开课 时间(必填)",required: true, scope: :syllabus
      parameter :content, "课程表 课程简介(必填)",required: true, scope: :syllabus
      parameter :address, "课程表 签到地址(必填)",required: true, scope: :syllabus

      let(:title) {syllabus_attrs[:title]}
      let(:training_course_id) {syllabus_attrs[:training_course_id]}
      let(:teacher) {syllabus_attrs[:teacher]}
      let(:course_time) {syllabus_attrs[:course_time]}
      let(:content) {syllabus_attrs[:content]}
      let(:address) {syllabus_attrs[:address]}

      example " 管理员 修改指定 课程表 成功" do
        do_request
        puts response_body
        expect(status).to eq(201)
      end
    end

    ##################### delete #############################
    delete "/admin/syllabuses/:id" do

      let(:id) {@admin_syllabuses.first.id}

      example " 管理员 删除指定 课程表 成功" do
        do_request
        puts response_body
        expect(status).to eq(204)
      end
    end

  end
end
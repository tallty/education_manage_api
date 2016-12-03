require 'acceptance_helper'

resource "学员 签到 相关的API" do
  header "Accept", "application/json"

  #################### create #############################
  post '/signs' do
    # user_attrs = FactoryGirl.attributes_for(:user)
    sign_attrs = FactoryGirl.attributes_for(:sign)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Email", user_attrs[:email]
    parameter :user_id, "签到的学员",required: true, scope: :sign
    parameter :training_course_id, "学员签到的 项目",required: true, scope: :sign
    parameter :school_id, "学员签到的 学校",required: true, scope: :sign
    parameter :sign_time, "学员签到的 时间",required: true, scope: :sign
    parameter :syllabus_id, "学员签到的 课程内容",required: true, scope: :sign

    let(:user_id) {sign_attrs[:user_id]}
    let(:training_course_id) {sign_attrs[:training_course_id]}
    let(:school_id) {sign_attrs[:school_id]}
    let(:sign_time) {sign_attrs[:sign_time]}
    let(:syllabus_id) {sign_attrs[:syllabus_id]}

    before do
      # @user = create(:user)
      # @school = create(:school)
      # @training_course = create(:training_course)
    end

    example "学员 签到 成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  ############### before_do ################################
  describe 'sign condition is all correct' do
    # user_attrs = FactoryGirl.attributes_for(:user)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Email", user_attrs[:email]

    before do
      # @school = create(:school)
      @signs = create_list(:sign, 5, sign_time: Time.zone.now)
    end

  #################### index #############################
    get '/signs' do

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {6}

      example "学员 查询 签到 记录 成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/signs/:id" do

  	  let(:id) {@signs.first.id}

  	  example " 学员 查询指定 签到 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end
  end
end
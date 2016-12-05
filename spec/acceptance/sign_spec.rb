require 'acceptance_helper'

resource "学员 签到 相关的API" do
  header "Accept", "application/json"

  #################### create #############################
  post '/signs' do
    user_attrs = FactoryGirl.attributes_for(:user)
    sign_attrs = FactoryGirl.attributes_for(:sign)

    header "X-User-Token", user_attrs[:authentication_token]
    header "X-User-Email", user_attrs[:email]

    parameter :syllabus_id, " 对应的课程表id(必填)",required: true, scope: :sign
    parameter :user_id, "签到的学员名称(必填)",required: true, scope: :sign
    # parameter :title, " 课程名称(必填)",required: true, scope: :sign
    # parameter :content, " 课程简介(必填)",required: true, scope: :sign
    # parameter :address, " 签到地址(必填)",required: true, scope: :sign
    # parameter :teacher, " 培训老师(必填)",required: true, scope: :sign

    let(:syllabus_id) {sign_attrs[:syllabus_id]}
    let(:user_id) {sign_attrs[:user_id]}
    # let(:title) {sign_attrs[:title]}
    # let(:content) {sign_attrs[:content]}
    # let(:address) {sign_attrs[:address]}
    # let(:teacher) {sign_attrs[:teacher]}

    before do
      @user = create(:user)
      # @syllabus = create(:syllabus)
    end

    example "学员 签到 成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  ############### before_do ################################
  describe 'sign condition is all correct' do
    user_attrs = FactoryGirl.attributes_for(:user)

    header "X-User-Token", user_attrs[:authentication_token]
    header "X-User-Email", user_attrs[:email]

    before do
      @user = create(:user)
      # @syllabus = create(:syllabus)
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
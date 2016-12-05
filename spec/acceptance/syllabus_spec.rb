require 'acceptance_helper'

resource "学员对 课程表 相关的API" do
  header "Accept", "application/json"

  ############### before_do ################################
  describe 'syllabus condition is all correct' do
    # user_attrs = FactoryGirl.attributes_for(:user)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Email", user_attrs[:email]

    before do
      # @user = create(:user)
      # @school = create(:school)
      @syllabuses = create_list(:syllabus, 5, course_time: Time.zone.now)
    end

    #################### index #############################
    get '/syllabuses' do

      parameter :page, "当前页", required: false
      parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {6}

      example "学员 查询 课程表 记录 成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/syllabuses/:id" do

      let(:id) {@syllabuses.first.id}

      example " 学员 查询指定 课程表 的详情成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

  end
end